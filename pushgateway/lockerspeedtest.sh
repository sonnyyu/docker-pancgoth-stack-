#!/bin/bash
speedtest-cli --simple >speed.txt
sed -i -e 's/://g' speed.txt
locker_speed_test=`cat speed.txt |awk {'print "Locker_"$1"  "$2'}`
cat <<EOF | curl -u admin:admin --data-binary @- https://localhost:9091/metrics/job/metricfire/instance/article2
  $locker_speed_test
EOF
