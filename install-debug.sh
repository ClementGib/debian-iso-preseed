#!/bin/bash

#DEFAULT DEBIAN install - config
User=$1
echo install and config for $User :






######################################################################
#Config URL and Variable
#Java
$JDK=
$JRE=

$Netbeans=lien
$Android=lien
$IntelliJ=lien
$SublimTxt=lien
$VsCode=lien
$Mongodb=lien
#####################################################################
#DEFAULT SOURCES LIST OF DEBIAN BUSTER 
echo add default buster source.list
sudo cp sources.list /etc/apt/sources.list
# /!\ NEED TO ADAPT FOR UBUNTU /!\



#UPDATE UPGRADE
echo Update et full Upgrade 
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get full-upgrade


########################################################################
#CONFIG perosnal home user
read -p "My personal config of user $User ? yes or no " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	mkdir ~/repo
	mkdir ~/Dropbox
	sudo mkdir /mnt/D
	sudo ln -s /mnt/D ~/D
	mkdir ~/temp
	echo My Home config of $User is ready
else
	echo No special Home config 
fi




########################################################################
# Installing essential 
read -p "essential package (need for the rest) ? yes or no " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo install essential package:
        sudo apt-get install build-essential 
        sudo apt-get install libssl-dev 
        sudo apt-get install automake 
        sudo apt-get install autoconf
        sudo apt-get install rsync
        sudo apt-get install libgl1
        sudo apt-get install libgl1-mesa-dev 
        sudo apt-get install libssl-dev
        sudo apt-get install libffi-dev 
   

else
	echo no essential package

fi

###########################################################################
#JAVA

# Installing JDK and JRE
sudo apt-get install -y default-jre
sudo apt-get install -y default-jdk

# maven 
sudo apt-get install maven -y



####################################################################################




read -p "Install C and Cpp tools? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo install Cpp tools :
	# Installing C++
	sudo apt-get install gcc
	sudo apt-get install g++
	
	read -p "Install IDE C/Cpp (Netbeans) ? yes or no" -n 1 -r
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		#Install Netbeans

fi






########################################################################
#Install and config text editor
read -p "Install texteditor ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo install text editor :
	# Installing text editor
	sudo apt-get install -y vim emacs nano
	read -p "Config vim with auto-plug and addons? yes or no" -n 1 -r
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		echo config vim :
		#Config vim 
		cp vim/.* ~/
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	else
		echo no vim config
	fi
fi



########################################################################
#NODE:
#Nodejs and NVM
sudo apt-get install -y curl software-properties-common
curl -sL https://deb.nodesource.com/setup_12.x | sudo bash -
sudo apt-get install -y nodejs

#nodemon
sudo npm install -g nodemon
sudo npm install -g loopback-cli

# Forever to run nodejs scripts forever
sudo npm install forever -g

# Grunt - an automated task runn#need backport for debianer
sudo npm install -g grunt-cli

# Bower - a dependency manager
sudo npm install -g bower

# Yeoman - for generators
sudo npm install -g yo 
e.sh



####################################################################################
#JAVA

# Installing JDK and JRE
sudo apt-get install -y default-jre
sudo apt-get install -y default-jdk

# maven 
sudo apt-get install maven -y

####################################################################################
#JAVA

# Installing JDK and JRE
sudo apt-get install -y default-jre
sudo apt-get install -y default-jdk

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

####################################################################################
#Python#need backport for debian
sudo apt-get install -y python3-pip
sudo apt-get install -y python2-pip
udo apt-get install -y python-dev
sudo apt-get install -y python-pip
sudo apt-get install -y python3
sudo apt-get install -y idle
sudo apt-get install -y libkrb5-dev
sudo apt-get install -y -f python3.7




########################################################################
# Installing basic programmes 
read -p "Install usefull tools ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo Install tools	
        sudo apt-get install terminator
        sudo apt-get install gparted
        sudo apt-get install w3m
        sudo apt-get install ssh
        sudo apt-get install git
	sudo apt-get install xclip
        sudo apt-get install wget
        sudo apt-get install locate
        sudo apt-get install net-tools
        sudo apt-get install check 
        sudo apt-get install flex 
        sudo apt-get install file
        sudo apt-get install aptitude
        sudo apt-get install net-tools
        sudo apt-get install curl 

else
	echo no tools
fi



########################################################################
# Installing basic programmes 
read -p "Install usefull tools ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo Install tools	
        sudo apt-get install terminator
        sudo apt-get install gparted
        sudo apt-get install w3m
        sudo apt-get install git
	sudo apt-get install xclip
	sudo apt-get install locate
        sudo apt-get install net-tools
        sudo apt-get install check 
        sudo apt-get install flex 
        sudo apt-get install aptitude
        sudo apt-get install net-tools
        sudo apt-get install curl 
	sudo apt-get install git
	sudo apt-get install filezilla

#Installed by default
#	sudo apt-get install wget
#	sudo apt-get install firefox
#       sudo apt-get install ssh
#       sudo apt-get install file


else
	echo no tools
fi


########################################################################
#Archive Extractors  
read -p "Install Archive extractors ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo Install archive extractor	
	# Archive Extractors
	sudo apt-get install unace 
	sudo apt-get install unrar 
	sudo apt-get install zip 
	sudo apt-get install unzip 
	sudo apt-get install p7zip-full 
	sudo apt-get install p7zip-rar 
	sudo apt-get install sharutils 
	sudo apt-get install rar 
	sudo apt-get install uudeview 
	sudo apt-get install mpack 
	sudo apt-get install arj 
	sudo apt-get install cabextract 
	sudo apt-get install file-roller
	
else
	echo no archive extractor
fi


####################################################################################
#Tools
# TLP - saves battery when Ubuntu is installed on Laptops
#sudo apt-get remove laptop-mode-tools

read -p "Install C and Cpp tools? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo install Cpp tools :
	# Installing C++
	sudo apt-get install gcc
	sudo apt-get install g++

else
	echo no archive extractor
fi



#Uncomment Ubuntu
#sudo add-apt-repository ppa:linrunner/tlp
#Need bask port Debian (backport)
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


#Golangread -p "Install C and Cpp tools? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo install Cpp tools :
	# Installing C++
	sudo apt-get install gcc
	sudo apt-get install g++

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


#Teamviewer
 cd ~/temp && wget -O teamviewer.deb https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo dpkg -i teamviewer.deb


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
wget http://repo.mysql.com/mysql-apt-config_0.8.13-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.13-1_all.deb

#Workbench 
wget -O workbench.deb https://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community_8.0.17-1ubuntu18.04_amd64.deb

#Apache server
#sudo apt-get install apache2 apache2-doc apache2-npm-prefork apache2-utils libexpat1 ssl-cert -y

#Install PHP (php7.0 latest version of PHP)
#sudo apt-get install libapache2-mod-php7.0 php7.0 php7.0-common php7.0-curl php7.0-dev php7.0-gd php-pear php-imagick php7.0-mcrypt php7.0-mysql php7.0-ps php7.0-xsl -y

#Install Phpmyadmin(for database)
#sudo apt-get install phpmyadmin



# Mongodb, Installing and starting server
sudo apt install gnupg
cd ~/temp
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.2 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org



sudo apt-get update -y
sudo apt-get upgrade -y

