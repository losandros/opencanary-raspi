#!/bin/bash
echo '{"local_time": "'$(date +%Y-%m-%d\ %H:%M:%S)'", "logtype": "heartbeat", "node_id": "'$(hostname)'", "logdata": "'$(ps -C opencanaryd -o pid=,cmd=)'"}' >> /var/tmp/opencanary-up.log 

