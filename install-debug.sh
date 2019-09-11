#!/bin/bash
#DEFAULT DEBIAN install - config
User=$1
echo install and config for $User debug version:


########################################################################
#	                   CONFIG URL variables		               #
########################################################################
#Config URL and Variable
#Java
Tomcat=https://www.apache.org/dist/tomcat/tomcat-9/v9.0.24/bin/apache-tomcat-9.0.24-deployer.tar.gz
Payara=https://search.maven.org/remotecontent?filepath=fish/payara/distributions/payara/5.193/payara-5.193.zip
Netbeans=lien
Eclipse=lien
#if specific version
JDK=url
JRE=url

Netbeans=lien

#URL ANDROID 09/2019 
Android=https://dl.google.com/dl/android/studio/ide-zips/3.5.0.21/android-studio-ide-191.5791312-linux.tar.gz
#URL IntelliJ 09/2019 
IntelliJ=https://download.jetbrains.com/idea/ideaIC-2019.2.2.tar.gz\?_ga\=2.168603234.2104405915.1568068392-720424917.1568068392
SublimTxt=lien
VsCode=lien
Mongodb=lien



#####################################################################
#DEFAULT SOURCES LIST OF DEBIAN BUSTER 
echo add default buster source.list
sudo cp sources.list /etc/apt/sources.list
# /!\ NEED TO ADAPT FOR UBUNTU /!\


#UPDATE UPGRADE
#echo Update et full Upgrade 
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get full-upgrade

#temp dir for install
mkdir ~/temp

#Location of softwares
echo Location of softwares: > locate.txt

########################################################################
#	               CONFIG personal home user		       #
########################################################################

read -p "My personal config of user $User ? yes or no " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	mkdir ~/repo
	mkdir ~/Dropbox
	sudo mkdir /mnt/D
	sudo ln -s /mnt/D ~/D
	#Auto mount ?
	
	echo My Home config of $User is ready
else
	echo No special Home config 
fi


########################################################################
#	                 Install essential build 	               #
########################################################################
read -p "Install essential package (need for the rest) ? yes or no " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo install essential package:
        sudo apt-get install build-essential 
        sudo apt-get install automake 
        sudo apt-get install autoconf
        sudo apt-get install libxmu-dev
        sudo apt-get install libxi-dev   
        sudo apt-get install checkinstall
        
	read -p "Install common independent software package (usefull for the rest) ? yes or no " -n 1 -r
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		sudo apt-get install software-properties-common
	fi
	
else
	echo no essential package

fi
########################################################################
#	                      Install JAVA          	               #
########################################################################
#JAVA
read -p "Install Java ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	# Installing JDK and JRE
	sudo apt-get install -y default-jre
	sudo apt-get install -y default-jdk

	read -p "Install version 12 with oracle? yes or no" -n 1 -r
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		# Installing JDK and JRE oracle 12
		sudo add-apt-repository ppa:linuxuprising/java
		sudo apt-get update
		sudo apt-get install openjdk-12-jdk
		sudo apt-get install openjdk-12-jre
		sudo apt-get install oracle-java12-installer
		sudo apt update
	fi
	
	read -p "Install java 11 ? yes or no" -n 1 -r
	if [[ $REPLY =~ ^[Yy]$ ]]
	then		
		# Installing JDK and JRE 11
		sudo apt install openjdk-11-jdk
		sudo apt install openjdk-11-jre
		sudo apt update
	fi
	
	read -p "Install java 8 ? yes or no" -n 1 -r
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		# Installing JDK and JRE 8
		sudo apt install openjdk-8-jdk
		sudo apt install openjdk-8-jre
		sudo apt update
	fi
	
	read -p "Install maven ? yes or no" -n 1 -r
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		sudo apt-get install maven
    fi
    
	read -p "Install jenkins (java 8>=) ? yes or no" -n 1 -r
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		sudo apt install jenkins
	
	fi
	
	read -p "Install tomcat (java 8>=) ? yes or no" -n 1 -r
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		cd ~/temp
		wget -O tomcat.tar.gz $Tomcat
		sudo mkdir /opt/tomcat
		sudo tar -xzvf tomcat.tar.gz -C /opt/tomcat --strip-components=1
	fi

	read -p "Install payara ? yes or no" -n 1 -r
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		sudo update-alternatives --config java
		cd ~/temp
		wget -O tomcat.tar.gz $Tomcat
		sudo mkdir /opt/tomcat
		sudo tar -xzvf tomcat.tar.gz -C /opt/tomcat --strip-components=1	
	fi

fi

########################################################################
########################################################################
#	                 	C and C++ 		               #
########################################################################
#C and C++ 
read -p "Install C and Cpp tools? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo install Cpp tools :
	# Installing C compiler
	sudo apt-get install gcc
	# Installing C++ compiler
	sudo apt-get install g++	
fi

########################################################################
########################################################################
#	      		        Python		             	       #
########################################################################
read -p "Install Python? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install python3-pip
sudo apt-get install python2-pip
sudo apt-get install python-pip


sudo apt update
sudo apt-get install -f python-dev
sudo apt-get install -y python3
sudo apt-get install -y idle
sudo apt-get install -y -f python3.7
fi

########################################################################
#	                       Cryptography			       #
########################################################################
read -p "cryptography package ? yes or no " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo install cryptography libs :
	sudo apt-get install libssl-dev 
	sudo apt-get install libffi-dev 
	#with Python
	pip install cryptography

else
	echo no cryptography libs

fi

########################################################################
#	                 	Lib OPENGL 	                       #
########################################################################
# Installing crypto packagess
read -p "OPENGL lib ? yes or no " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	
        sudo apt-get install libgl1
        sudo apt-get install libgl1-mesa-dev 

        
else
	echo no OPENGL libs

fi


########################################################################

########################################################################
#	                 Install essential build 	               #
########################################################################
#Install and config text editor
read -p "Install texteditor ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo install text editor :
	# Installing text editor
	sudo apt-get install -y vim emacs
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
########################################################################
#	                 	   NODE	                               #
########################################################################
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

# Gulp - an automated task runner
sudo npm install -g gulp-cli

# Angular FullStack - My favorite MEAN boilerplate (MEAN = MongoDB, Express, Angularjs, Nodejs)
sudo npm install -g generatsudo apt-get install -y gitor-angular-fullstack

#Update
sudo apt-get update
sudo apt-get upgrade
#Curl, Python - Some random useful stuff
#sudo apt-get install -y curl python-software-properties



########################################################################
########################################################################
#	                  Install usefull tools 	               #
########################################################################
# Installing basic programmes 
read -p "Install usefull tools ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo Install tools :	
        sudo apt-get install terminator
        sudo apt-get install gparted
        sudo apt-get install w3m
        sudo apt-get install git
	sudo apt-get install xclip
	sudo apt-get install locate
	sudo apt-get install find
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
	echo no usefull tools
fi

########################################################################
#	                 Install Archive extractors	               #
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




########################################################################
read -p "Install Golang ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
sudo apt-get install golang
fi

########################################################################
#IDE
read -p "Install Netbeans ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
		#Install Netbeans
		echo Netbeans : opt/android-studio >> locate.txt 
fi

read -p "Install Eclipse ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
		#Install Eclipse
		#echo Eclipse : opt/android-studio >> locate.txt 
fi

read -p "Install Netbeans Java ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
		#Install Netbeans
		echo Netbeans : opt/android-studio >> locate.txt 
fi

read -p "Install Eclipse Java ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
		#Install Netbeans
		echo Eclipse : opt/android-studio >> locate.txt 
fi

read -p "Install Android studio ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
		#Install Netbeans
		#AndroidStudio (need to create shortcut /opt/android-studio)
		sudo apt-get install -y lib32stdc++6
		
		cd ~/temp && wget -O android.tar.gz $Android 
		tar -xvf android.tar.gz
		sudo mv android-studio /opt/
		sudo rm android.tar.gz
		#Location of softwares file
		echo Android-Studio : opt/android-studio >> locate.txt 
fi

read -p "Install IntelliJ Community ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
		#intelliJ community (need to create shortcut /opt/idea-IC-192.6603.28 AFTER)
		cd ~/temp && wget -O intelliJ.tar.gz $IntelliJ 
		tar -xvf intelliJ.tar.gz
		sudo mv idea-IC-192.6603.28 /opt
		#Location of softwares file
		echo IntelliJ : opt/idea-IC-192.6603.28 >> locate.txt 
fi


read -p "Install Arduino IDE ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
		#Arduino
		sudo apt-get install arduino
		#Location of softwares file
		echo Arduino : etc/Arduino >> locate.txt 
fi








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
sudo apt-get install -f


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




#VsCode
#URL 09/2019
cd ~/temp && wget -O vscode.deb https://go.microsoft.com/fwlink/\?LinkID\=760868 && sudo dpkg -i vscode.deb
sudo apt-get install -f



#LAMPP:
#Mysql
wget http://repo.mysql.com/mysql-apt-config_0.8.13-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.13-1_all.deb
sudo apt-get install -f

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

