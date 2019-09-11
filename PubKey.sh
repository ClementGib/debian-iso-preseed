sudo bash -c 'apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys EAC0D406E5D79A82ADEEDFDFB76E53652D87398A
wget http://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/deb-multimedia-keyring_2016.8.1_all.deb && dpkg -i deb-multimedia-keyring_2016.8.1_all.deb
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xF1656F24C74CD1D8
wget https://nginx.org/keys/nginx_signing.key && apt-key add nginx_signing.key
curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys E58A9D36647CAE7F
wget -q -O- https://packages.sury.org/php/apt.gpg | apt-key add -
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 1F3045A5DF7587C3
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F24AEA9FB05498B7
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
wget -O - https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc | apt-key add -
gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -'

