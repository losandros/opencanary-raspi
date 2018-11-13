#!/bin/bash
echo '{"local_time": "'$(date +%Y-%m-%d\ %H:%M:%S)'", "logtype": "heartbeat", "node_id": "'$(hostname)'", "logdata": "'$(ps -ef |grep opencanaryd |grep -v grep)'"}' >> /var/tmp/opencanary-up.log 

