#!/bin/bash
#DEFAULT DEBIAN install - config

#SOURCE LIST FTP.FR (FRENCH) DEFAULT

sudo cp sources.list-empty /etc/apt/sources.list


sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install build-essential

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
VsCode=https://go.microsoft.com/fwlink/?LinkID=760868
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
#URL XAMPP 09/2019
Xampp=https://downloadsapachefriends.global.ssl.fastly.net/7.3.0/xampp-linux-x64-7.3.0-0-installer.run?from_af=true
#if specific version
#JDK=url
#JRE=url

########################################################################
#	                    UPDATE AND UPGRADE		               #
########################################################################


sudo apt-get install gpg
sudo apt-get install curl

#DEFAULT SOURCES LIST OF DEBIAN BUSTER 
echo add default buster source.list
sudo cp sources.list /etc/apt/sources.list
# /!\ NEED TO ADAPT FOR UBUNTU /!\
sudo bash PubKey.sh

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

mkdir ~/repo
mkdir ~/Dropbox
sudo mkdir /mnt/D
sudo ln -s /mnt/D ~/D
#Auto mount ?	
echo My Home config of $User is ready



########################################################################
#	                 Install essential build 	               #
########################################################################
echo install essential package:
sudo apt-get install automake -y -f
sudo apt-get install autoconf -y -f
sudo apt-get install libxmu-dev -y -f
sudo apt-get install libxi-dev -y -f
sudo apt-get install checkinstall -y -f
sudo apt-get install apt-transport-https -y -f
sudo apt-get install dirmngr -y -f

sudo apt-get install software-properties-common

########################################################################
#	                      Install JAVA          	               #
########################################################################
#JAVA
sudo apt-get install -y default-jre
sudo apt-get install -y default-jdk

read -p "Install version 12 with oracle? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	# Installing JDK and JRE oracle 12
	sudo add-apt-repository ppa:linuxuprising/java
	sudo apt-get update
	sudo apt-get install openjdk-12-jdk -y -f
	sudo apt-get install openjdk-12-jre -y -f
	sudo apt-get install oracle-java12-installer -y -f
	sudo apt update
fi

read -p "Install java 11 ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then		
	# Installing JDK and JRE 11
	sudo apt install openjdk-11-jdk -y -f
	sudo apt install openjdk-11-jre -y -f
	sudo apt update
fi
	
read -p "Install java 8 ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	# Installing JDK and JRE 8
	sudo apt install openjdk-8-jdk -y -f
	sudo apt install openjdk-8-jre -y -f
	sudo apt update
fi
	
read -p "Install maven ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
		sudo apt-get install maven -y -f
fi
    
read -p "Install jenkins (java 8>=) ? yes or no" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
#	wget -q -O -
#	http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key \
#	| sudo apt-key add -
#	sudo echo "deb http://pkg.jenkins-ci.org/debian binary/" > \
#	/etc/apt/sources.list.d/jenkins.list
		
	sudo apt install jenkins -y -f
	
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


sudo apt-get update
sudo apt-get upgrade

fi
########################################################################
#	                 	C and C++ 		               #
########################################################################
#C and C++ 

echo install Cpp tools :
# Installing C compiler (include in g++)
#sudo apt-get install gcc
# Installing C++ compiler
sudo apt-get install g++ -y -f


########################################################################
#	      		        Python		             	       #
########################################################################

sudo apt-get install python-pip -y -f
sudo apt-get install python3-pip -y -f
sudo apt-get install idle -y -f
sudo apt-get install curl python-software-properties -y -f
sudo apt update
sudo apt upgrade
	
########################################################################
#	                 	   NODEJS                               #
########################################################################

#Nodejs and NVM
sudo apt-get install software-properties-common -y -f
curl -sL $NodeVX | sudo bash -
sudo apt-get install  nodejs -y -f

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
sudo apt-get install gitor-angular-fullstack -y -f
echo NODE installed
sudo apt-get update
sudo apt-get upgrade


########################################################################
#	                       Cryptography			       #
########################################################################
echo install cryptography libs :
sudo apt-get install libssl-dev -y -f
sudo apt-get install libffi-dev -y -f
sudo apt-get install dirmngr -y -f
sudo apt-get install apt-transport-https -y -f
sudo apt-get install gnupg -y -f
	
#with Python
sudo pip install cryptography
echo cryptography libs installed
sudo apt-get update
sudo apt-get upgrade

echo no cryptography libs

########################################################################
#	                 	usefull Libs 	                       #
########################################################################
# Installing libs 
sudo apt-get install libgl1 -y -f
sudo apt-get install libgl1-mesa-dev -y -f
sudo apt-get install lib32ncurses5-dev -y -f
sudo apt-get install lib32z1-dev -y -f
sudo apt-get install lib32stdc++6 -y -f

echo OPENGL and lib32 installed
sudo apt-get update
sudo apt-get upgrade

########################################################################
#	                   Install texteditor   	               #
########################################################################
#Install and config text editor

echo install text editor :
# Installing text editor
sudo apt-get install -y vim emacs vim-gtk -y -f

echo config vim :
#Config vim 
cp -a vim/.vim ~/
cp -a vim/.vimrc ~/
cp -a vim/.vimrc.plug ~/
		
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo VIM config : ~/.vim >> locate.txt 
sudo apt-get update
sudo apt-get upgrade

########################################################################
#	                  Install usefull tools 	               #
########################################################################
#Some random useful stuff

echo Install tools!!!!!!!!!!!!!!!!!!!
sudo apt-get install terminator -y -f
sudo apt-get install gparted -y -f
sudo apt-get install w3m -y -f
sudo apt-get install git -y -f
sudo apt-get install xclip -y -f
sudo apt-get install locate -y -f
sudo apt-get install find -y -f
sudo apt-get install net-tools -y -f
sudo apt-get install check -y -f
sudo apt-get install flex -y -f
sudo apt-get install aptitude -y -f
sudo apt-get install net-tools -y -f
sudo apt-get install curl -y -f
sudo apt-get install filezilla -y -f
sudo apt-get install smartmontools -y -f
sudo apt-get install ethtool -y -f
sudo apt-get install thunderbird -y -f
#dual boot
sudo apt-get install grub-customizer -y -f
#  Notes
sudo apt-get install xpad -y -f
sudo apt-get install basket -y -f
	
#Usually installed by default 
#sudo apt-get install libreoffice
#sudo apt-get install wget
#sudo apt-get install firefox
#sudo apt-get install ssh
#sudo apt-get install file
sudo apt-get update
sudo apt-get upgrade


########################################################################
#	                   Install ZSH config		               #
########################################################################
# Zsh

echo zsh install
sudo apt-get install zsh -y -f
sh -c "$(curl -fsSL $ZSH)"
#cp config
sh zsh/fonts/install.sh 
cp -r zsh/.* ~/
sudo apt-get update
sudo apt-get upgrade 
 
echo ZSH : ~/.zsh >> locate.txt 

########################################################################
#	                  Install less usefull tools 	               #
########################################################################
#Some random useful stuff

# Erlang - Actor Concurrency Model based Programming Language
sudo apt-get install erlang -y -f
# KVM acceleration and cpu checker
sudo apt-get install cpu-checker -y -f
sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils -y -f
sudo apt-get install virt-manager -y -f
sudo apt-get install feh -y -f
# RPM and alien - sometimes used to install software packages
sudo apt-get install rpm -y -f
sudo apt-get install alien dpkg-dev debhelper -y -f

# Calibre - Ebook reader and converter
sudo -v && wget -nv -O- https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py | sudo python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()"
sudo apt-get update
sudo apt-get upgrade 

########################################################################
#	                 Install Archive extractors	               #
########################################################################
#Archive Extractors  
echo Install archive extractor	
# Archive Extractors
sudo apt-get install unace -y -f
sudo apt-get install unrar -y -f
sudo apt-get install zip -y -f
sudo apt-get install unzip -y -f
sudo apt-get install p7zip-full	-y -f

  
sudo apt-get update
sudo apt-get upgrade




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

	sudo apt-get install tlp tlp-rdw  -y -f
	sudo tlp start
	sudo tlp stat
  	sudo apt-get update
 	sudo apt-get upgrade

else
	echo no TLP
fi


########################################################################
#	                 Dictionary client server	               #
########################################################################
# Dictionary Client and Server with Thesaurus
sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
sudo apt-get install dict -y -f
sudo apt-get install dictd -y -f
sudo apt-get install dict-gcide	-y -f
sudo apt-get install dict-wn -y -f
sudo apt-get install dict-devil -y -f
sudo apt-get install dict-moby-thesaurus -y -f
sudo apt-get update
sudo apt-get upgrade

########################################################################
#	                 	   Golang          	               #
########################################################################

sudo apt-get install golang -y -f
sudo apt-get update
sudo apt-get upgrade
  
########################################################################
#	           	          IDE			               #
########################################################################
#IDE

#Install Netbeans
cd ~/temp
wget -O netbeans8.sh $Netbeans
bash netbeans8.sh
echo End of netbeans installationgnupg 	
cd -

sudo apt-get update
sudo apt-get upgrade


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



sudo apt-get update
sudo apt-get upgrade


#Install Netbeans
#AndroidStudio (need to create shortcut /opt/android-studio)
sudo apt-get install -y lib32stdc++6 -y -f
cd ~/temp && wget -O android.tar.gz $Android 
tar -xvf android.tar.gz
sudo mv android-studio /opt/
sudo rm android.tar.gz
#Location of softwares file

echo Android-Studio : opt/android-studio >> locate.txt 


#intelliJ community (need to create shortcut /opt/idea-IC-192.6603.28 AFTER)
cd ~/temp && wget -O intelliJ.tar.gz $IntelliJ 
tar -xvf intelliJ.tar.gz
sudo mv idea-IC-192.6603.28 /opt
#Location of softwares file
echo IntelliJ : opt/idea-IC-192.6603.28 >> locate.txt 

#Arduino
sudo apt-get install arduino -y -f
#Location of softwares file
echo Arduino : etc/Arduino >> locate.txt 


sudo apt-get update
sudo apt-get upgrade

########################################################################
#	           	          DOCKER    			       #
########################################################################

# Docker
sudo apt-get install docker -y -f
cd ~/temp
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
cd -

# Docker-compose
sudo pip install docker-compose
	
#read -p "Install Kubernetes ? yes or no" -n 1 -r
#if [[ $REPLY =~ ^[Yy]$ ]]
#then
#	sudo apt-get update && sudo apt-get install -y apt-transport-https curl
#	sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
#	sudo cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
#	deb https://apt.kubernetes.io/ kubernetes-xenial main
#	EOF
#	sudo apt-get update
#	sudo apt-get install -y kubelet kubeadm kubectl
#	sudo apt-mark hold kubelet kubeadm kubectl
#fi

sudo apt-get update
sudo apt-get upgrade 


########################################################################
#	           	      Multimedia			       #
########################################################################
#Multimedia
sudo apt-get install vlc -y -f
sudo apt-get install kazam -y -f
sudo apt-get install clementine -y -f
sudo apt-get install audacity -y -f

sudo apt-get update
sudo apt-get upgrade 
  



########################################################################
#	           	         Onenote		 	       #
########################################################################

#Onenote
#With npm
sudo npm install -g p3x-onenote --unsafe-perm=true --allow-root 
p3x-onenote &

########################################################################
#	           	         Slack		 	       #
########################################################################
#Slack 
cd ~/temp
wget -O Slack.deb $Slack
sudo dpkg -i Slack.deb
cd -

########################################################################
#	           	         Teamviewer		 	       #
########################################################################
#Teamviewer
cd ~/temp && wget -O teamviewer.deb https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo dpkg -i teamviewer.deb
sudo apt-get install -f
cd -

########################################################################
#	           	         Dropbox		 	       #
########################################################################
#dropbox
#URL 09/2019
#cd ~/temp && wget -O dropbox.deb https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2019.02.14_amd64.deb
#sudo ~/temp/.dropbox-dist/dropboxd
#cd ~/temp
#git clone $Dropbox
#cd dropbox-sdk-python
#sudo python setup.py install
#cd -
sudo apt-get install dropbox -y -f




########################################################################
#	           	       Sublimetext			       #
########################################################################
#sublimText
#URL 09/2019
cd ~/temp && wget -qO - $SublimeTxt | sudo apt-key add -
sudo apt-get update
sudo apt-get install sublime-text -y -f

########################################################################
#	           	          VsCode			       #
########################################################################
#VsCode
#URL 09/2019
cd ~/temp
wget -O vscode.deb $VsCode
sudo dpkg -i vscode.deb
sudo apt-get install -f
cd -

########################################################################
#	           	          LAMPP				       #
########################################################################
#LAMPP:
#Mysql
cd ~/temp
wget http://repo.mysql.com/mysql-apt-config_0.8.13-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.13-1_all.deb
cd -


sudo apt-get install mysql-workbench -y -f
  
#Apache server
#sudo apt-get install apache2 apache2-doc apache2-npm-prefork apache2-utils libexpat1 ssl-cert -y

	#Install PHP (php7.0 latest version of PHP)
sudo apt-get install php7.2 -y -f
sudo apt-get install php7.2-cli php7.2-common php7.2-json php7.2-opcache php7.2-mysql php7.2-zip php7.2-fpm php7.2-mbstring -y -f
  
#Install Phpmyadmin(for database)
#sudo apt-get install phpmyadmin

cd ~/temp
sudo wget -O xampp.run $Xampp
sudo ./xampp.run
cd -


########################################################################
#	           	       MongoDB				       #
########################################################################
# Mongodb, Installing and starting server
sudo apt install gnupg -y -f
cd ~/temp
wget -qO - $Mongodb | sudo apt-key add -
#Already done
#echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.2 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org


sudo apt-get update -y
sudo apt-get upgrade -y

#########################################################################


########################################################################
#	           	    KDE DESKTOP CUSTOM		    	       #
########################################################################
sudo apt-get install latte-dock -y -f


########################################################################
#                                 END                                  #
########################################################################

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get autoremove

