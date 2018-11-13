<h1>Copy NOOBS to pre-formated SD-Card</h1>
estimated 1 minutes
https://www.raspberrypi.org/downloads/noobs/


<h1>Install Raspian lite</h1>
estimated 5 minutes (via wifi)

<h1>boot and pre-configure raspian lite</h1>
estimated 2 minutes

login with default credentials (pi, raspberry) <BR>
change pi password <BR>
sudo raspi-config <BR>

 --> localisation options
 
 --> Change wifi country
 
 --> finish
 
sudo apt update

sudo apt full-upgrade

sudo apt install git

sudo raspi-config 
  --> change hostname

sudo reboot


<h1>Install filebeat </h1>
estimated 2 minutes

cd /home/pi

git clone https://github.com/losandros/opencanary-raspi ./

(for private repository auth is needed)

cd filebeat-package-6.4.3

sh ./install.sh

<h1>Install Opencanary Raspi Fork</h1>
estimated 20 minutes

cd ..

cd opencanary-installer

sh ./install.sh

sh ./installer-env.sh
