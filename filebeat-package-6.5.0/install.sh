#!/bin/bash
sudo mkdir -p /usr/share/filebeat/bin
sudo mkdir -p /etc/filebeat
sudo mkdir -p /var/lib/filebeat
sudo mkdir -p /var/log/filebeat
sudo cp -R usr/share/filebeat/bin/filebeat /usr/share/filebeat/bin
sudo cp -R usr/share/filebeat/module /usr/share/filebeat/
sudo cp -R etc/filebeat/* /etc/filebeat/
sudo chmod 750 /var/log/filebeat
sudo chmod 750 /etc/filebeat/
sudo chown -R root:root /usr/share/filebeat/*
sudo cp filebeat.service /lib/systemd/system/
sudo systemctl enable filebeat.service
sudo service filebeat start
echo "Change paths and hosts in /etc/filebeat/filebeat.yml accordingly"
