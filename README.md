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
 --> localisation options <BR>
 --> Change wifi country <BR> 
 --> finish <BR>
sudo apt update <BR>
sudo apt full-upgrade <BR>
sudo apt install git <BR>
sudo raspi-config <BR>
  --> change hostname <BR>
sudo reboot <BR>

<h1>Install filebeat </h1>
estimated 2 minutes <BR>
only works with logstash/elasticsearch/kibana -6.4.3 <BR>
cd /home/pi <BR>
git clone https://github.com/losandros/opencanary-raspi <BR>
(for private repository auth is needed) <BR>
cd filebeat-package-6.4.3 <BR>
sh ./install.sh <BR>

<h1>Install Opencanary Raspi Fork</h1>
estimated 20 minutes <BR>
cd .. <BR>
cd opencanary-installer <BR>
sh ./install.sh <BR>
source /home/pi/canary-env/bin/activate  <BR>
sh ./installer-env.sh  <BR>

<h1>Check</h1>
check if services are running via <BR>
sudo systemctl status filebeat.service <BR>
sudo systemctl status opencanary-heartbeat.timer <BR>
sudo systemctl status opencanary.service <BR>
tail -f /var/tmp/opencanary* <BR> 
