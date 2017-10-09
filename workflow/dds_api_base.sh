#!/bin/bash
which jq > /dev/null
if [ $? -gt 0 ]
then
  echo "install jq https://stedolan.github.io/jq/"
  exit 1
fi

config_file="$HOME/.ddsclient"
config_file_error()
{
  echo "create $config_file file according to DukeDSClient instructions:"
  echo "https://github.com/Duke-GCB/DukeDSClient/blob/master/docs/GettingAgentAndUserKeys.md#custom-url-configuration"
  exit 1
}

if [ ! -e "$config_file" ]
then
  config_file_error
else
  config_api_keys=`jq -r '{agent_key, user_key}' $config_file`
  config_url=`jq -r '.url' $config_file`
fi

usage_and_exit()
{
  read -d '' usage << USAGE
usage: $0 [-h] api_path
  -h display this message
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

list_paths_and_exit()
{
  curl -s "${config_url}/swagger_doc" | jq -r '.paths | to_entries[] | select(.value.get).key' | sed 's:^/api/v1::'
  exit 0
}

while getopts ":hl" opt; do
  case $opt in
    h)
      usage_and_exit
      ;;
    l)
      list_paths_and_exit
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

# Shift options off parameters
shift $((OPTIND-1))

path=$1
if [ $# -ne 1 ]
then
  usage_and_exit 1
fi

#echo "config_agent_key = ${config_agent_key}"
#echo "config_user_key = ${config_user_key}"
#echo "config_url = ${config_url}"
#echo "path = ${path}"

# getting api_token for keys
resp=`curl -X POST -s --header "Content-Type: application/json" --header "Accept: application/json" -d "${config_api_keys}" "${config_url}/software_agents/api_token"`
if [ $? -gt 0 ]
then
  echo "Problem getting api_token!"
  exit 1
fi
#echo ${resp} | jq
error=`echo ${resp} | jq '.error'`
if [ "${error}" != null ]
then
  echo "Problem!"
  exit 1
fi
auth_token=`echo ${resp} | jq -r '.api_token'`
curl -s -X GET --header 'Content-Type: application/json' --header 'Accept: application/json' --header "Authorization: ${auth_token}" "${config_url}${path}"
