<h1>Copy NOOB to pre-formated SD-Card</h1>
estimated 1 minutes


<h1>Install Raspian lite</h1>
estimated 5 minutes (via wifi)

<h1>boot and pre-configure raspian lite</h1>

login with default credentials (pi, raspberry)

change pi password

sudo raspi-config

 --> localisation options
 
 --> Change wifi country
 
 --> finish
 
sudo apt update

sudo apt full-upgrade

sudo apt install git

sudo reboot


<h1>Install via </h1>

cd /home/pi

git clone https://github.com/los_andros/opencanary-raspi ./

tar zxvf filebeat-package-6.4.3.tar.gz

tar zxvf opencanary-raspi.tar.gz 

cd filebeat-package-6.4.3

sh ./install.sh

cd ..

cd opencanary-raspi

sh ./install.sh
