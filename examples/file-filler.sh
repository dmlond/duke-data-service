#!/bin/bash
which jq > /dev/null
if [ $? -gt 0 ]
then
  echo "install jq https://stedolan.github.io/jq/"
  exit 1
fi

usage_and_exit()
{
  read -d '' usage << USAGE
usage: file-filler.sh [-hv] [-r num] [-o page_offset] [-l page_limit] project_id
  -h display this message
  -v verbose output
  -r retry this number of times
  -o page offset to start filling
  -l number of pages to fill
USAGE
  if [ -n "$1" ] && [ $1 -gt 0 ]
  then
    echo "${usage}" >&2
    exit $1
  else
    echo "${usage}"
    exit 0
  fi
}

exit_with_restart_command()
{
  new_command="file-filler.sh"
  if [ -n "${retry_num}" ]
  then
    new_command+=" -r ${retry_num}"
  fi
  if [ -n "${page_limit}" ]
  then
    new_limit=$((last_page - current_page))
    new_command+=" -l ${new_limit}"
  fi
  new_command+=" -o ${current_page} ${project_id}"
  echo "Restart progress with: ${new_command}" >&2
  exit 1
}

start_page=1
verbose=""
while getopts ":hvr:o:l:" opt; do
  case ${opt} in
    h)
      usage_and_exit
      ;;
    v)
      verbose="-v"
      ;;
    r)
      if [ "${OPTARG}" -gt 0 ]
      then
        retry_num=${OPTARG}
        curl_retry="--retry ${retry_num}"
      else
        echo "Retry number must be a positive integer" >&2
        exit 1
      fi
      ;;
    o)
      if [ "${OPTARG}" -gt 0 ]
      then
        start_page=${OPTARG}
      else
        echo "Page offset must be a positive integer" >&2
        exit 1
      fi
      ;;
    l)
      if [ "${OPTARG}" -gt 0 ]
      then
        page_limit=${OPTARG}
      else
        echo "Page limit must be a positive integer" >&2
        exit 1
      fi
      ;;
    \?)
      echo "Invalid option: -${OPTARG}" >&2
      ;;
    :)
      echo "Option -${OPTARG} requires an argument." >&2
      exit 1
      ;;
  esac
done

# Shift options off parameters
shift $((OPTIND-1))

project_id=$1
if [ $# -ne 1 ]
then
  usage_and_exit 1
fi

curl_options="${verbose} ${curl_retry}"

test_file="/tmp/file-filler-test"
chunk_prefix="${test_file}_chunk-"
echo "THIS" > ${test_file}
echo "IS" >> ${test_file}
echo "A" >> ${test_file}
echo "TEST" >> ${test_file}
split -l 1 ${test_file} ${chunk_prefix}

upload_name="it"
upload_content_type="text%2Fplain"
upload_size=`wc -c < ${test_file}`
upload_md5=`md5sum ${test_file} | cut -d' ' -f1`

per_page=100
if [ -n "${page_limit}" ]
then
  last_page=$((start_page + page_limit))
fi
current_page=${start_page}
until [ "${current_page}" = "done" ]; do
  echo -n "${current_page}: "
  DUKEDS_API_KEY=`jq '{user_key, agent_key}' ~/.ddsclient | dukeds-cli ${curl_options} postApiV1SoftwareAgentsApiToken - | jq -r '.api_token'`
  resp=`dukeds-cli ${curl_options} getApiV1ProjectsIdChildren id=${project_id} per_page=${per_page} page=${current_page} name_contains=___`
  if [ $? -gt 0 ]
  then
    echo "Problem retrieving project children" >&2
    echo "Response: ${resp}" >&2
    exit_with_restart_command
  fi

  count=`echo "${resp}" | jq '.results | length'`
  if [ "${count}" -gt "0" ]
  then
    for folder_id in `echo "${resp}" | jq -r '.results[].id'`
    do
      # create upload
      resp=`dukeds-cli ${curl_options} postApiV1ProjectsProjectIdUploads project_id=${project_id} name==${upload_name} content_type==${upload_content_type} size==${upload_size}`
      upload_id=`echo ${resp} | jq -r '.id'`
      chunk_number=1
      # loop through chunks
      for chunk in `ls ${chunk_prefix}* | sort`
      do
        # collect chunk information
        chunk_md5=`md5sum ${chunk} | cut -d' ' -f1`
        if [ $? -gt 0 ]
        then
          echo "Problem getting md5 for ${chunk}" >&2
          exit_with_restart_command
        fi

        chunk_size=`wc -c < ${chunk}`
        if [ $? -gt 0 ]
        then
          echo "Problem getting size for ${chunk}" >&2
          exit_with_restart_command
        fi

        # create chunk
        payload_format='{"number": "%s", "size": %s, "hash": {"algorithm": "md5", "value": "%s"}}'
        payload=`printf "${payload_format}" ${chunk_number} ${chunk_size} ${chunk_md5}`
        resp=`echo "$payload" | dukeds-cli ${curl_options} putApiV1UploadsIdChunks id=${upload_id} -`
        error=`echo ${resp} | jq '.error'`

        if [ "${error}" != "null" ]
        then
          echo "Problem creating chunk ${chunk}: ${resp}" >&2
          exit_with_restart_command
        fi

        # upload chunk
        host=`echo ${resp} | jq -r '.host'`
        put_url=`echo ${resp} | jq -r '.url'`
        resp=`curl ${curl_options} -T ${chunk} "${host}${put_url}" 2>&1`
        if [ $? -gt 0 ]
        then
          echo "Problem uploading chunk ${chunk}" >&2
          echo "Response: ${resp}" >&2
          exit_with_restart_command
        fi

        ((chunk_number++))
      done

      # complete upload
      payload_format='{"hash": {"algorithm": "md5", "value": "%s"}}'
      payload=`printf "${payload_format}" ${upload_size}`
      resp=`echo "$payload" | dukeds-cli ${curl_options} putApiV1UploadsIdComplete id=${upload_id} -`
      error=`echo ${resp} | jq '.error'`
      if [ "${error}" != "null" ]
      then
        echo "Problem completing upload: ${resp}" >&2
        exit_with_restart_command
      fi

      # create file
      payload_format='{"parent": {"kind": "dds-folder", "id": "%s"}, "upload": {"id": "%s"}}'
      payload=`printf "${payload_format}" ${folder_id} ${upload_id}`
      resp=`echo $payload | dukeds-cli ${curl_options} postApiV1Files -`
      error=`echo ${resp} | jq '.error'`
      if [ "${error}" != "null" ]
      then
        echo "Problem creating file: ${resp}" >&2
        exit_with_restart_command
      fi

      echo -n '.'
    done

    echo ' 😃 '
    let current_page+=1

    if [ "${current_page}" == "${last_page}" ]
    then
      current_page="done"
    fi
  else
    current_page="done"
  fi
done
