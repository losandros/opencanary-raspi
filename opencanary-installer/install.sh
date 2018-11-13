#!/bin/bash
cd /home/pi
echo "updating raspian"
sudo apt update
sudo apt full-upgrade 
echo "installing opencanary pre-requisites"
sudo apt install python-dev python-pip python-virtualenv libssl-dev libffi-dev libpcap-dev libpq-dev samba
echo "creating virtualenv"
mkdir canary-env
virtualenv -p python2 canary-env
echo "Now type: source ./canary-env/bin/activate"
echo "After that within the virtualenv install-env.sh"
