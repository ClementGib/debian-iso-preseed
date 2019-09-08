#!/bin/bash

#add sudo user
su root
usermod -aG sudo czem
su czem

#DEV CONFIG
sudo apt-get update

# Installing essential
sudo apt-get install -y build-essential libssl-dev automake autoconf
sudo apt-get install -y ssh
sudo apt-get install -y check flex file rsync
sudo apt-get install -y gcc g++
sudo apt-get install -y libgl1 libgl1-mesa-dev 
sudo apt-get install -y net-tools

# Installing text editor
sudo apt-get install -y vim emacs nano

# Installing tools
sudo apt-get install -y terminator
sudo apt-get install -y firefox
sudo apt-get install -y gparted


# Nodejs and NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
source ~/.profile
sudo nvm install 7.10.0
sudo nvm use 7.10.0
node -v

#nodemon
sudo npm install -g nodemon
sudo npm install -g loopback-cli

# Mongodb, Installing and starting server
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
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


# maven 
sudo apt-get install maven -y

# Gulp - an automated task runner
sudo npm install -g gulp-cli

# Angular FullStack - My favorite MEAN boilerplate (MEAN = MongoDB, Express, Angularjs, Nodejs)
sudo npm install -g generator-angular-fullstack

# Vim, Curl, Python - Some random useful stuff
sudo apt-get install -y curl python-software-properties
sudo apt-get install -y python-dev, python-pip
sudo apt-get install -y python3
sudo apt-get install idle
sudo apt-get install -y libkrb5-dev

# Installing JDK and JRE
sudo apt-get install -y default-jre
sudo apt-get install -y default-jdk

# Gimp Image Editor
sudo apt-get install -y gimp gimp-data gimp-plugin-registry gimp-data-extras

# Archive Extractors
sudo apt-get install -y unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller

# FileZilla - a FTP client
sudo apt-get install -y filezilla

# TLP - saves battery when Ubuntu is installed on Laptops
sudo apt-get remove laptop-mode-tools
sudo add-apt-repository ppa:linrunner/tlp
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

# Zsh
sudo apt-get install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Docker
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
# Docker-compose
sudo pip install docker-compose
