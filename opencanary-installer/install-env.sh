#!/bin/bash
echo -e "\e[32minstalling all pip pre-requisites\e[39m"
pip install --upgrade pip setuptools
pip install rdpy
pip install scapy pcapy
echo -e "\e[32mdownloading patron-it opencanary fork\e[39m"
cd /home/pi
git clone https://github.com/losandros/opencanary
echo -e "\e[32mchanging iptables log-level from warning to info\e[39m"
cd /home/pi/opencanary/opencanary/modules
mv portscan.py portscan.py.original
cat portscan.py.original | sed s/"--log-level=warning"/"--log-level=info"/g >> portscan.py
cd ../../
echo -e "\e[32minstalling opencanary via pip\e[39m"
pip install opencanary
sudo mkdir -p /etc/opencanaryd
read -p "Enter Honeypot name (best the same as hostname): " honeypotname
cat /home/pi/opencanary-raspi/opencanary-installer/opencanary.conf | sed s/"opencanary-1"/"$honeypotname"/g | sed s/'"portscan.enabled":\ false'/'"portscan.enabled":\ true'/g | sed s/'"ssh.enabled":\ false'/'"ssh.enabled":\ true'/g >> /home/pi/opencanary.conf
echo -e "\e[32mconfig copied to /etc/opencanaryd/opencanary.conf\e[39m"
echo -e "\e[32mAdjust to your needs\e[39m"
sudo mv /home/pi/opencanary.conf /etc/opencanaryd/
cp bin/opencanary.tac /home/pi/canary-env/bin/opencanary.tac
echo -e "\e[32mcreating empty logfile in/var/tmp/\e[39m"
sudo touch /var/tmp/opencanary.log
sudo touch /var/tmp/opencanary-up.log
echo -e "\e[32mcopying systemd service\e[39m"
cd /home/pi/opencanary-raspi/opencanary-installer
sudo cp opencanary.service /lib/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable opencanary.service
echo -e "\e[32mcopying opencanary-heartbeat timer and service\e[39m"
cp /home/pi/opencanary-raspi/opencanary-installer/canary-uptime.sh /home/pi/canary-env/bin/
sudo cp opencanary-heartbeat.* /lib/systemd/system/
sudo systemctl enable opencanary-heartbeat.timer
echo -e "\e[32mStarting opencanary-heartbeat and opencanary\e[39m"
sudo systemctl start opencanary-heartbeat.timer
sudo systemctl start opencanary.service
#sudo update-rc.d service enable
echo -e "\e[32mto start opencanary daemon, start with > sudo service opencanary start\e[39m"
echo -e "\e[32mif that fails manually start with > /home/pi/canary-env/bin/opencanaryd --start \e[39m"
