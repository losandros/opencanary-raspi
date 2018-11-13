#!/bin/bash
echo "installing all pip pre-requisites"
pip install --upgrade pip setuptools
pip install rdpy
pip install scapy pcapy
echo "downloading patron-it opencanary fork"
cd /home/pi
git clone https://github.com/losandros/opencanary
echo "changing iptables log-level from warning to info"
cd /home/pi/opencanary/opencanary/modules
mv portscan.py portscan.py.original
cat portscan.py.original | sed s/"--log-level=warning"/"--log-level=info"/g >> portscan.py
cd ../../
echo "installing opencanary via pip"
pip install opencanary
sudo mkdir -p /etc/opencanaryd
opencanaryd --copyconfig
read -p "Enter Honeypot name (best the same as hostname): " honeypotname
cat /home/pi/.opencanary.conf | sed s/"opencanary-1"/"$honeypotname"/g | sed s/'"portscan.enabled":\ false'/'"portscan.enabled":\ true'/g | sed s/'"ssh.enabled":\ false'/'"ssh.enabled":\ true'/g >> /home/pi/opencanary.conf
echo "config copied to /etc/opencanaryd/opencanary-conf"
echo "Adjust to your needs"
sudo mv /home/pi/opencanary.conf /etc/opencanaryd/
sudo rm -f /etc/opencanaryd/.opencanary.conf
cp bin/opencanary.tac /home/pi/canary-env/bin/opencanary.tac
echo "creating empty logfile in/var/tmp/"
sudo touch /var/tmp/opencanary.log
sudo touch /var/tmp/opencanary-up.log
echo "copying systemd service"
cd /home/pi/opencanary-raspi/opencanary-installer
sudo cp opencanary.service /lib/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable opencanary.service
echo "copying opencanary-heartbeat timer and service"
cp /home/pi/opencanary-raspi/opencanary-installer/canary-uptime.sh /home/pi/canary-env/bin/
sudo cp opencanary-heartbeat.* /lib/systemd/system/
sudo systemctl enable opencanary-heartbeat.timer
echo "Starting opencanary-heartbeat"
sudo systemctl start opencanary-heartbeat.timer
echo "to start opencanary daemon, start with > sudo service opencanary start"
