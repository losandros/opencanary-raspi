#!/bin/bash
echo "\e[32mStopping filebeat if running ...\e[39m"
sudo service filebeat stop
echo "\e[32mCopying filebeat files to /usr/share/filebeat, /var/lib/filebeat and /var/log/filebeat\e[39m"
sudo mkdir -p /usr/share/filebeat/bin
sudo mkdir -p /var/lib/filebeat
sudo mkdir -p /var/log/filebeat
sudo cp -R usr/share/filebeat/bin/filebeat /usr/share/filebeat/bin
sudo cp -R usr/share/filebeat/module /usr/share/filebeat/
if [ -f /etc/filebeat/filebeat.yml ]; then
		echo "\e[32mCopying configuration files to /etc/filebeat\e[39m"
		sudo mkdir -p /etc/filebeat
		sudo cp -R etc/filebeat/* /etc/filebeat/
		sudo chmod 750 /etc/filebeat
	else
		echo "\e[32m/etc/filebeat/filebeat.yml already existsw, keeping original configuration\e[39m"

fi
sudo chmod 750 /var/log/filebeat
sudo chown -R root:root /usr/share/filebeat/*
echo "\e[32mCopying and registering systemd service files to /lib/systemd/system/ and starting as service\e[39m"
sudo cp filebeat.service /lib/systemd/system/
sudo systemctl enable filebeat.service
sudo service filebeat start
echo "\e[32mChange paths and hosts in /etc/filebeat/filebeat.yml accordingly\e[39m"
echo "\e[32mCurrent config from /etc/filebeat/filebeat.yml\e[39m"
sudo cat /etc/filebeat/filebeat.yml |grep -v \# | grep .
