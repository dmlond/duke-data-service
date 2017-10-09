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
usage: project-crawler.sh [-hv] [-r num] [-o page_offset] [-e fields] project_id
  -h display this message
  -v verbose output
  -r retry this number of times
  -o page offset to start crawling
  -p number of results per page
  -e space sparated string of fields to exclude (ex: 'audit current_file_version project ancestors')
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
  new_command="project-crawler.sh"
  if [ -n "${verbose}" ]
  then
    new_command+=" -v"
  fi
  if [ -n "${retry_num}" ]
  then
    new_command+=" -r ${retry_num}"
  fi
  if [ -n "${exclude_response_fields}" ]
  then
    new_command+=" -e '${exclude_response_fields}"
  fi
  new_command+=" -o ${current_page} -p ${per_page} ${project_id}"
  echo "Restart progress with: ${new_command}" >&2
  exit 1
}

start_page=1
per_page=100
verbose=""
while getopts ":hvr:o:p:e:" opt; do
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
    p)
      if [ "${OPTARG}" -gt 0 ]
      then
        per_page=${OPTARG}
      else
        echo "Per-page must be a positive integer" >&2
        exit 1
      fi
      ;;
    e)
      exclude_response_fields="${OPTARG}"
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

current_page=${start_page}
until [ "${current_page}" == "done" ]; do
  if [ $(((current_page-start_page) % 60)) = 0 ]
  then
    DUKEDS_API_KEY=`jq '{user_key, agent_key}' ~/.ddsclient | dukeds-cli ${curl_options} postApiV1SoftwareAgentsApiToken - | jq -r '.api_token'`
  fi

  count=0
  page_success='no'
  page_retries=0
  max_page_retries=4
  until [ "${page_retries}" == "${max_page_retries}" ]; do
    echo -n "${current_page}: "
    resp=`dukeds-cli ${curl_options} getApiV1ProjectsIdChildren id=${project_id} per_page=${per_page} page=${current_page} name_contains=_ exclude_response_fields="${exclude_response_fields}" 2>&1`
    if [ $? -gt 0 ]
    then
      echo "curl fail: ${resp}"
      let page_retries+=1
    else
      resp_body=`echo "${resp}" | grep -v '^[<>*]'`
      count=`echo "${resp_body}" | jq '.results | length'`
      if [ $? -gt 0 ]
      then
        echo "parse fail: ${resp_body}"
        let page_retries+=1
      else
        page_success='yay'
        echo '😃 '
        page_retries=$max_page_retries
      fi
    fi
  done

  if [ "${count}" == "${per_page}" ]
  then
    let current_page+=1
  else
    if [ "${page_success}" != "yay" ]
    then
      exit_with_restart_command
    fi
    current_page="done"
  fi
done
