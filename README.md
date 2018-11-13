<h1>Copy NOOBS to pre-formated SD-Card</h1>
estimated 1 minutes
https://www.raspberrypi.org/downloads/noobs/


<h1>Install Raspian lite</h1>
estimated 5 minutes (via wifi)

<h1>boot and pre-configure raspian lite</h1>
estimated 2 minutes

login with default credentials (pi, raspberry)

change pi password

sudo raspi-config

 --> localisation options
 
 --> Change wifi country
 
 --> finish
 
sudo apt update

sudo apt full-upgrade

sudo apt install git

hostname <NEW-HOST-NAME>

sudo reboot


<h1>Install filebeat </h1>
estimated 2 minutes

cd /home/pi

git clone https://github.com/losandros/opencanary-raspi ./

(for private repository auth is needed)

tar zxvf filebeat-package-6.4.3.tar.gz

cd filebeat-package-6.4.3

sh ./install.sh

<h1>Install Opencanary Raspi Fork</h1>
estimated 20 minutes

tar zxvf opencanary-raspi.tar.gz

cd ..

cd opencanary-raspi

edit install.sh and change path from opencanary to opencanary-raspi <-- needs to be fixed

split files to install.sh as normal user, then "source canary-env", then install-env.sh

sh ./install.sh
