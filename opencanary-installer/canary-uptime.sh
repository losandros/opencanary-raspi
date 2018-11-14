#!/bin/bash
echo '{"local_time": "'$(date +%Y-%m-%d\ %H:%M:%S)'", "logtype": "1003", "node_id": "'$(hostname)'", "logdata": "'$(ps -ef |grep opencanaryd |grep -v grep)'", "src_host": "'$(ip addr | awk '/^[0-9]+/ { currentinterface=$2 } $1 == "inet" { split( $2, foo, "/" ); print currentinterface ,foo[1] }' | grep -v lo)'"}' >> /var/tmp/opencanary-up.log 

