Install via
cd /home/pi
git clone https://github.com/los_andros/opencanary-raspi ./
tar zxvf filebeat-package-6.4.3.tar.gz
tar zxvf opencanary-raspi.tar.gz 
cd filebeat-package-6.4.3
sh ./install.sh
cd ..
cd opencanary-raspi
sh ./install.sh
