!/bin/bash

#DEFAULT DEBIAN install 

User=$1
echo install and config for $User :

#DEFAULT SOURCES 
sudo cp sources.list /etc/apt/sources.list

#DEV CONFIG
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get full-upgrade


#CONFIG home user
mkdir ~/repo
mkdir ~/Dropbox
sudo mkdir /mnt/D
sudo ln -s /mnt/D ~/D

mkdir ~/temp

# Installing essential 
sudo apt-get install -y build-essential libssl-dev automake autoconf
sudo apt-get install -y ssh
sudo apt-get install -y check flex file rsync
sudo apt-get install -y gcc g++
sudo apt-get install -y libgl1 libgl1-mesa-dev 
sudo apt-get install -y net-tools
sudo apt-get install -y -f libc6:i386 libncurses5android-studio-bundle-132.893413-linux.tgz:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
sudo apt-get install -y git
sudo apt-get install -y locate
sudo apt-get install -y libssl-dev
sudo apt-get install -y libffi-dev


# Installing text editor
sudo apt-get install -y vim emacs nano

#Config vim 
cp vim/.* ~/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#bash test/run


# Installing tools
sudo apt-get install -y terminator
sudo apt-get install -y firefox
sudo apt-get install -y gparted
sudo apt-get install -y w3m



# Nodejs and NVM

sudo apt-get install -y curl software-properties-common
curl -sL https://deb.nodesource.com/setup_12.x | sudo bash -
sudo apt-get install -y nodejs

#nodemon
sudo npm install -g nodemon
sudo npm install -g loopback-cli

# Mongodb, Installing and starting server
sudo apt install wget gnupg

echo "deb http://repo.mongodb.org/apt/debian "$(lsb_release -sc)"/mongodb-org/4.2 main" | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo service mongod start
sudo service mongod status

# Forever to run nodejs scripts forever
sudo npm install forever -g

# Git - a version control system
sudo apt-get update
sudo apt-get install -y git xclip

# Grunt - an automated task runner
sudo npm install -g grunt-cli

# Bower - a dependency manager
sudo npm install -g bower

# Yeoman - for generators
sudo npm install -g yo 
e.sh



# maven 
sudo apt-get install maven -y

# Gulp - an automated task runner
sudo npm install -g gulp-cli

# Angular FullStack - My favorite MEAN boilerplate (MEAN = MongoDB, Express, Angularjs, Nodejs)
sudo npm install -g generatsudo apt-get install -y gitor-angular-fullstack

#Update
sudo apt-get update
sudo apt-get upgrade
#Curl, Python - Some random useful stuff
#sudo apt-get install -y curl python-software-properties

sudo apt-get install -y python3-pip
sudo apt-get install -y python2-pip
udo apt-get install -y python-dev
sudo apt-get install -y python-pip
sudo apt-get install -y python3
sudo apt-get install -y idle
sudo apt-get install -y libkrb5-dev
sudo apt-get install -y -f python3.7


# Installing JDK and JRE
sudo apt-get install -y default-jre
sudo apt-get install -y default-jdk

# Gimp Image Editor
sudo apt-get install -y gimp gimp-data gimp-plugin-registry gimp-data-extrase.sh


sudo apt-get install -y git
# Archive Extractors
sudo apt-get install -y unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller

# FileZilla - a FTP client
sudo apt-get install -y filezilla

# TLP - saves battery when Ubuntu is installed on Laptops
#sudo apt-get remove laptop-mode-tools

#push enter
#ubuntu repo
#sudo add-apt-repository ppa:linrunner/tlp

#need backport for debian
sudo apt-get update
sudo apt-get install -y tlp tlp-rdw smartmontools ethtool
sudo tlp start
sudo tlp stat

# Erlang - Actor Concurrency Model based Programming Language
sudo apt-get install -y erlang

#  Notes
sudo apt-get install -y xpad
sudo apt-get install -y basket


# KVM acceleration and cpu checker
sudo apt-get install -y cpu-checker
sudo apt-get install -y qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils
sudo apt-get install -y virt-manager
sudo apt-get install -y lib32z1 lib32ncurses5 lib32bz2-1.0 lib32stdc++6

# RPM and alien - sometimes used to install software packages
sudo apt-get install -y rpm
sudo apt-get install -y alien dpkg-dev debhelper

# Calibre - Ebook reader and converter
sudo -v && wget -nv -O- https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py | sudo python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()"

# Dictionary Client and Server with Thesaurus
sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
sudo apt-get install -y dict
sudo apt-get install -y dictd
sudo apt-get install -y dict-gcide
sudo apt-get install -y dict-wn
sudo apt-get install -y dict-devil
sudo apt-get install -y dict-moby-thesaurus

# For Android Studio (Gradle Daemon)
#touch ~/.gradle/gradle.properties && echo "org.gradle.daemon=true" >> ~/.gradle/gradle.properties

#Arduino
sudo apt-get install arduino -y


#Golang
sudo apt-get install golang -y


# Zsh
sudo apt-get install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#cp config
sh zsh/fonts/install.sh 
cp zsh/.* ~/


# Docker
sudo apt-get install docker -y
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
# Docker-compose
sudo pip install docker-compose -y


#Tool ++
sudo apt-get install -y vlc
sudo apt-get install -y thunderbird
sudo apt-get install -y libreoffice
sudo apt-get install -y locate
sudo apt-get install -y kazam
sudo apt-get install -y clementine
#dual boot
sudo apt-get install -y grub-customizer


#Onenote
#With npm
sudo npm install -g p3x-onenote --unsafe-perm=true --allow-root
p3x-onenote &


#dropbox
#URL 09/2019
#cd ~/temp && wget -O dropbox.deb https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2019.02.14_amd64.deb
#sudo ~/temp/.dropbox-dist/dropboxd
cd ~/temp
git clone git://github.com/dropbox/dropbox-sdk-python.git
cd dropbox-sdk-python
sudo python setup.py install

#sublim
#URL 09/2019
cd ~/temp && wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install sublime-text


#AndroidStudio (need to create shortcut /opt/android-studio)
sudo apt-get install -y lib32stdc++6
#URL 09/2019
cd ~/temp && wget -O android.tar.gz https://dl.google.com/dl/android/studio/ide-zips/3.5.0.21/android-studio-ide-191.5791312-linux.tar.gz 
tar -xvf android.tar.gz
sudo mv android-studio /opt/
sudo rm android.tar.gz

#VsCode
#URL 09/2019
cd ~/temp && wget -O vscode.deb https://go.microsoft.com/fwlink/\?LinkID\=760868 && sudo dpkg -i vscode.deb

#intelliJ community (need to create shortcut /opt/idea-IC-192.6603.28)
cd ~/temp && wget -O intelliJ.tar.gz https://download.jetbrains.com/idea/ideaIC-2019.2.2.tar.gz\?_ga\=2.168603234.2104405915.1568068392-720424917.1568068392 
tar -xvf intelliJ.tar.gz
sudo mv idea-IC-192.6603.28 /opt

#LAMPP:
#Mysql
sudo apt-get install mysql-server mysql-client libmysqlclient-dev -y

#Apache server
sudo apt-get install apache2 apache2-doc apache2-npm-prefork apache2-utils libexpat1 ssl-cert -y

#Install PHP (php7.0 latest version of PHP)
sudo apt-get install libapache2-mod-php7.0 php7.0 php7.0-common php7.0-curl php7.0-dev php7.0-gd php-pear php-imagick php7.0-mcrypt php7.0-mysql php7.0-ps php7.0-xsl -y

#Install Phpmyadmin(for database)
sudo apt-get install phpmyadmin

sudo apt-get update -y
sudo apt-get upgrade -y

