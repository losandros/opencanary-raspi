#!/bin/bash
cd /home/pi
echo "updating raspian"
sudo apt update
sudo apt full-upgrade -y
echo "disabling SSHD and samba"
sudo systemctl stop nmbd
sudo systemctl disable smbd
sudo systemctl disable ssh.service
sudo update-rc.d nmbd disable

echo "installing opencanary pre-requisites"
sudo apt install -y python-dev python-pip python-virtualenv libssl-dev libffi-dev libpcap-dev libpq-dev samba
echo "creating virtualenv"
mkdir canary-env
virtualenv -p python2 canary-env
echo "Now type: source /home/pi/canary-env/bin/activate"
echo "After that within the virtualenv sh ./install-env.sh"
