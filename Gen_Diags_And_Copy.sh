#!/bin/bash

# Set username and password for the local ops-manager

OPS_MANAGER_USERNAME=
OPS_MANAGER_PASSWORD=

# Set Diags Destination

DIAG_PATH="PATH/TO/SHARE"

# Genereate the DIAG Bundle

date_format=$(date +%Y-%m-%d_%H-%M-%S)
namespace=turbonomic
ip=$(kubectl get services --no-headers -n $namespace | grep nginx | awk '{print $4; exit}')
cookie=$(curl -k -s -v "https://$ip/vmturbo/rest/login" --data "username=$OPS_MANAGER_USERNAME&password=$OPS_MANAGER_PASSWORD" 2>&1 | grep JSESSION | awk -F'=' '{print $2}' | awk -F';' '{print $1}')
mkdir -p $HOME/syslog/$namespace
SYSLOG_HOME=$HOME/syslog/$namespace
curl --cookie "JSESSIONID=$cookie" -k "https://$ip:443/vmturbo/rest/cluster/diagnostics" -o $SYSLOG_HOME/turbonomic-diags_"$date_format".zip
result=$?
if [ $result -ne 0 ]
then
  echo "Curl Command Failed" >> $SYSLOG_HOME/turbonomic-diags_"$date_format".log
  exit 1
fi
echo "Uploaded the Full Diagnostics bundle to $SYSLOG_HOME/turbonomic-diags_$date_format.zip" >> $SYSLOG_HOME/turbonomic-diags_"$date_format".log

#Copy the Diags to the designated path

cp $SYSLOG_HOME/turbonomic-diags_"$date_format".zip /$DIAG_PATH

echo "Copied the Full Diagnostics bundle to $DIAG_PATH/turbonomic-diags_$date_format.zip" >> $SYSLOG_HOME/turbonomic-diags_"$date_format".log

# Delete Diags older than Five Days

find $SYSLOG_HOME/*.zip -mtime +5 -exec rm -rf {} \;

find $SYSLOG_HOME/*.log -mtime +5 -exec rm -rf {} \;




