1#!/bin/bash
#DEFAULT DEBIAN install - config


User=$1
echo install and config for $User debug version:


########################################################################
#	                   CONFIG URL variables		               #
########################################################################
#Config URL and Variable
#Java
#URL Tomcat 09/2019 
Tomcat=https://www.apache.org/dist/tomcat/tomcat-9/v9.0.24/bin/apache-tomcat-9.0.24-deployer.tar.gz
#URL Payara 09/2019 
Payara=https://search.maven.org/remotecontent?filepath=fish/payara/distributions/payara/5.193/payara-5.193.zip
#URL NodeVX 09/2019 
NodeVX=https://deb.nodesource.com/setup_12.x
#URL ZSH 09/2019 
ZSH=https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh
#URL Netbeans 09/2019 
Netbeans=https://download.netbeans.org/netbeans/8.2/final/bundles/netbeans-8.2-linux.sh
#URL Eclipse 09/2019 
Eclipse=http://eclipse.mirror.garr.it/mirrors/eclipse//oomph/epp/2019-06/R/eclipse-inst-linux64.tar.gz
#URL ANDROID 09/2019 
Android=https://dl.google.com/dl/android/studio/ide-zips/3.5.0.21/android-studio-ide-191.5791312-linux.tar.gz
#URL IntelliJ 09/2019 
IntelliJ=https://download.jetbrains.com/idea/ideaIC-2019.2.2.tar.gz\?_ga\=2.168603234.2104405915.1568068392-720424917.1568068392
#URL Sublimetext 09/2019 
SublimeTxt=https://download.sublimetext.com/sublimehq-pub.gpg
#URL VsCode 09/2019 
VsCode=vscode.deb https://go.microsoft.com/fwlink/\?LinkID\=760868 
#URL MondoDB 09/2019 
Mongodb=https://www.mongodb.org/static/pgp/server-4.2.asc 
#URL Slack 09/2019
Slack=https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb
#URL Dropbox 09/2019
Dropbox=git://github.com/dropbox/dropbox-sdk-python.git
#URL Mysql 09/2019
Mysql=http://repo.mysql.com/mysql-apt-config_0.8.13-1_all.deb
#URL Mysql Workbench 09/2019
MyWorkbench=https://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community_8.0.17-1ubuntu18.04_amd64.deb
#if specific version
#JDK=url
#JRE=url

########################################################################
#	                    UPDATE AND UPGRADE		               #
########################################################################

read -p "Source list config and Public Key ? yes or no " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then


	#DEFAULT SOURCES LIST OF DEBIAN BUSTER 
	echo add default buster source.list
	sudo chown root source.list
	sudo cp sources.list /etc/apt/sources.list
	# /!\ NEED TO ADAPT FOR UBUNTU /!\

	sudo bash PubKey.sh
fi

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
	sudo apt-get install apt-transport-https
	sudo apt-get install dirmngr
	
        
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
		cd -
	fi

	read -p "Install payara ? yes or no" -n 1 -r
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		sudo update-alternatives --config java
		cd ~/temp
		wget -O Payara.zip $Payara
		unzip Payara.zip
		sudo cp payara5 /opt/
		cd -
	fi

fi

sudo apt-get update
sudo apt-get upgrade

########################################################################
#	                 	C and C++ 		               #
########################################################################
#C and C++ 
read -p "Install C and Cpp tools? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo install Cpp tools :
	# Installing C compiler (include in g++)
	#sudo apt-get install gcc
	# Installing C++ compiler
	sudo apt-get install g++	
fi

########################################################################
#	      		        Python		             	       #
########################################################################
read -p "Install Python? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	sudo apt-get install python-pip
	sudo apt-get install python3-pip
	sudo apt-get install idle
	sudo apt-get install curl python-software-properties
	sudo apt update
	sudo apt upgrade
	

fi

########################################################################
#	                 	   NODEJS                               #
########################################################################

read -p "Install Nodejs? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	#Nodejs and NVM
	sudo apt-get install -y curl software-properties-common
	curl -sL $NodeVX | sudo bash -
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
	# Gulp - an automated task runner
	sudo npm install -g gulp-cli

	# Angular FullStack - My favorite MEAN boilerplate (MEAN = MongoDB, Express, Angularjs, Nodejs)
	sudo npm install -g generator-angular-fullstack generatsudo 
	sudo apt-get install gitor-angular-fullstack
	echo NODE installed

else
	echo no NODE
fi

#Update
sudo apt-get update
sudo apt-get upgrade



########################################################################
#	                       Cryptography			       #
########################################################################
read -p "cryptography package ? yes or no " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo install cryptography libs :
	sudo apt-get install libssl-dev 
	sudo apt-get install libffi-dev 
	sudo apt-get install dirmngr
	sudo apt-get install apt-transport-https 
	sudo apt-get install gnupg 
	
	#with Python
	sudo pip install cryptography
	echo cryptography libs installed
else
	echo no cryptography libs

fi



########################################################################
#	                 	usefull Libs 	                       #
########################################################################
# Installing libs 
read -p "Install usefull libs ? yes or no " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	
        sudo apt-get install libgl1
        sudo apt-get install libgl1-mesa-dev 
	sudo apt-get install lib32ncurses5-dev 
	sudo apt-get install lib32z1-dev
	sudo apt-get install lib32stdc++6
	echo OPENGL and lib32 installed

        
else
	echo no usefull libs 

fi

########################################################################
#	                   Install texteditor   	               #
########################################################################
#Install and config text editor
read -p "Install texteditor ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo install text editor :
	# Installing text editor
	sudo apt-get install -y vim emacs
	read -p "Config vim with auto-plug and addons ? yes or no" -n 1 -r
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		echo config vim :
		#Config vim 
		cp vim/.* ~/
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		echo VIM config : ~/.vim >> locate.txt 
	fi
else
	echo no vim config
fi

sudo apt-get update
sudo apt-get upgrade


########################################################################
#	                   Install ZSH config		               #
########################################################################
# Zsh
read -p "Install zsh and config with Oh-My-Zsh ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	sudo apt-get install zsh
	sh -c "$(curl -fsSL $ZSH)"
	#cp config
	sh zsh/fonts/install.sh 
	cp zsh/.* ~/
	echo ZSH : ~/.zsh >> locate.txt 
else
	echo no zsh config
fi

########################################################################
#	                  Install usefull tools 	               #
########################################################################
#Some random useful stuff
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
	sudo apt-get install filezilla
	sudo apt-get install smartmontools 
	sudo apt-get install ethtool
	sudo apt-get install thunderbird
	#dual boot
	sudo apt-get install grub-customizer
	#  Notes
	sudo apt-get install xpad
	sudo apt-get install basket
	
	#Usually installed by default 
	#sudo apt-get install libreoffice
	#sudo apt-get install wget
	#sudo apt-get install firefox
	#sudo apt-get install ssh
	#sudo apt-get install file

else
	echo no usefull tools
fi


########################################################################
#	                  Install less usefull tools 	               #
########################################################################
#Some random useful stuff
read -p "Install usefull tools 2 ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	# Erlang - Actor Concurrency Model based Programming Language
	sudo apt-get install erlang
	# KVM acceleration and cpu checker
	sudo apt-get install cpu-checker
	sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils
	sudo apt-get install virt-manager

	# RPM and alien - sometimes used to install software packages
	sudo apt-get install rpm
	sudo apt-get install alien dpkg-dev debhelper

	# Calibre - Ebook reader and converter
	sudo -v && wget -nv -O- https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py | sudo python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()"

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
fi


########################################################################
#	               	      Install TLP		               #
########################################################################

read -p " install TLP (saves battery for Laptops) ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	# TLP - saves battery when Ubuntu is installed on Laptops
	sudo apt-get remove laptop-mode-tools
	#Uncomment Ubuntu
	#sudo add-apt-repository ppa:linrunner/tlp
	#Need bask port Debian (backport)
	sudo apt-get update

	sudo apt-get install tlp tlp-rdw 
	sudo tlp start
	sudo tlp stat
else
	echo no TLP
fi

########################################################################
#	                 Dictionary client server	               #
########################################################################
read -p "Install dictionary ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then

	# Dictionary Client and Server with Thesaurus
	sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
	sudo apt-get install dict
	sudo apt-get install dictd
	sudo apt-get install dict-gcide
	sudo apt-get install dict-wn
	sudo apt-get install dict-devil
	sudo apt-get install dict-moby-thesaurus
else
	echo no dictionary
fi

########################################################################
#	                 	   Golang          	               #
########################################################################
read -p "Install Golang ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	sudo apt-get install golang
fi


########################################################################
#	           	          IDE			               #
########################################################################
#IDE
read -p "Install IDE (Java, c++, web, android ...) ? yes or no" -n 1 -r
sudo apt-get install -y clementine
if [[ $REPLY =~ ^[Yy]$ ]]
then
	read -p "Install Netbeans ? yes or no" -n 1 -r
	sudo apt-get install -y clementine
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		
		#Install Netbeans
		cd ~/temp
		wget -O netbeans8.sh $Netbeans
		bash netbeans8.sh
		echo End of netbeans installationgnupg 
		cd -
	
	fi

	read -p "Dowload eclipse ? yes or no" -n 1 -r
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		#Install Eclipse
		cd ~/temp
		wget -O eclipse.tar.gz $Eclipse
		tar -xvf eclipse.tar.gz
		
		read -p "Start eclipse installer ? yes or no " -n 1 -r
		while [[ $REPLY =~ ^[Yy]$ ]]; do
			cd eclipse-installer
			./eclipse-inst
			#Start runner
			echo End of eclipse installation
			cd -
			read -p "Install eclipse again ? yes or no " -n 1 -r
			#for different eclipse verions
		done
				
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
fi


########################################################################
#	           	          DOCKER    			       #
########################################################################

read -p "Install Docker ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	# Docker
	sudo apt-get install docker
	cd ~/temp
	curl -fsSL get.docker.com -o get-docker.sh
	sh get-docker.sh
	cd -
	# Docker-compose
	sudo pip install docker-compose
	
	read -p "Install Kubernetes ? yes or no" -n 1 -r
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		sudo apt-get update && sudo apt-get install -y apt-transport-https curl
		sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
		sudo cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
		deb https://apt.kubernetes.io/ kubernetes-xenial main
		EOF
		sudo apt-get update
		sudo apt-get install -y kubelet kubeadm kubectl
		sudo apt-mark hold kubelet kubeadm kubectl
	fi
fi

########################################################################
#	           	      Multimedia			       #
########################################################################
read -p "Install multimedia ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	#Multimedia
	sudo apt-get install vlc
	sudo apt-get install kazam
	sudo apt-get install clementine
	sudo apt-get install audacity
fi



########################################################################
#	           	         Onenote		 	       #
########################################################################
read -p "Install Onenote ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	#Onenote
	#With npm
	sudo npm install -g p3x-onenote --unsafe-perm=true --allow-root
	p3x-onenote &
fi


########################################################################
#	           	         Slack		 	       #
########################################################################
read -p "Install Slack ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	#Slack 
	cd ~/temp
	wget -O Slack.deb $Slack
	sudo dpkg -i Slack.deb
	cd -
fi


########################################################################
#	           	         Teamviewer		 	       #
########################################################################
read -p "Install Teamviewer ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	#Teamviewer
	cd ~/temp && wget -O teamviewer.deb https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
	sudo dpkg -i teamviewer.deb
	sudo apt-get install -f
	cd -
fi

########################################################################
#	           	         Dropbox		 	       #
########################################################################
read -p "Install Dropbox ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	#dropbox
	#URL 09/2019
	#cd ~/temp && wget -O dropbox.deb https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2019.02.14_amd64.deb
	#sudo ~/temp/.dropbox-dist/dropboxd
	cd ~/temp
	git clone $Dropbox
	cd dropbox-sdk-python
	sudo python setup.py install
	cd -
fi



########################################################################
#	           	       Sublimetext			       #
########################################################################
read -p "Install Sublimetext ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	#sublimText
	#URL 09/2019
	cd ~/temp && wget -qO - $SublimeTxt | sudo apt-key add -
	sudo apt-get update
	sudo apt-get install sublime-text
fi


########################################################################
#	           	          VsCode			       #
########################################################################
read -p "Install VSCODE ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	#VsCode
	#URL 09/2019
	cd ~/temp && wget -O $VsCode && sudo dpkg -i vscode.deb
	sudo apt-get install -f
fi

########################################################################
#	           	          LAMPP				       #
########################################################################
read -p "Install "LAMPP" (Apache and/or MySQL and/or PHP and/or Phpadmin) ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	#LAMPP:
	#Mysql
	wget -O mysql-config.deb $Mysql
	sudo dpkg -i mysql-config.deb
	sudo apt-get install -f

	#Workbench 
	wget -O workbench.deb $MyWorkbench

	#Apache server
	#sudo apt-get install apache2 apache2-doc apache2-npm-prefork apache2-utils libexpat1 ssl-cert -y

	#Install PHP (php7.0 latest version of PHP)
	#sudo apt-get install libapache2-mod-php7.0 php7.0 php7.0-common php7.0-curl php7.0-dev php7.0-gd php-pear php-imagick php7.0-mcrypt php7.0-mysql php7.0-ps php7.0-xsl -y

	#Install Phpmyadmin(for database)
	#sudo apt-get install phpmyadmin
fi


########################################################################
#	           	       MongoDB				       #
########################################################################
read -p "Install multimedia ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	# Mongodb, Installing and starting server
	sudo apt install gnupg
	cd ~/temp
	wget -qO - $Mongodb | sudo apt-key add -
	#Already done
	#echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.2 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
	sudo apt-get update
	sudo apt-get install -y mongodb-org

fi
#########################################################################

sudo apt-get update -y
sudo apt-get upgrade -y

########################################################################
#	           	    KDE DESKTOP CUSTOM		    	       #
########################################################################
sudo apt-get install latte-dock 

