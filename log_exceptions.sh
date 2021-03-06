#/bin/bash

# Go to the script's path beacuse we need env.sh
cd "${BASH_SOURCE%/*}/"

source env.sh
source lib.sh

log_file_with_exceptions=$1
echo Log file with exceptions: $log_file_with_exceptions
res=$(cat $log_file_with_exceptions | egrep "Exception|Exception:" | wc -l)
hostname=$(hostname)
#echo res: $res
if [ -z "$2" ]
  then
    send_to_influxdb exceptions,file=$log_file_with_exceptions $res
  else
    send_to_influxdb exceptions,file=$2 $res
fi
#send_to_influxdb exceptions,file=$log_file_with_exceptions $res


