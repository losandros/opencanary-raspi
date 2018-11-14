#!/bin/bash
cd /home/pi
echo "updating raspian"
sudo apt update
sudo apt full-upgrade -y
echo -e "\e[32mdisabling SSHD and samba\e[39m"
sudo systemctl stop nmbd
sudo systemctl disable smbd
sudo systemctl disable ssh.service
sudo update-rc.d nmbd disable

echo -e "\e[32minstalling opencanary pre-requisites\e[39m"
sudo apt install -y python-dev python-pip python-virtualenv libssl-dev libffi-dev libpcap-dev libpq-dev samba
echo -e "\e[32mcreating virtualenv\e[39m"
mkdir canary-env
virtualenv -p python2 canary-env
echo -e "\e[32mNow type: source /home/pi/canary-env/bin/activate\e[39m"
echo -e "\e[32mAfter that within the virtualenv sh ./install-env.sh\e[39m"
