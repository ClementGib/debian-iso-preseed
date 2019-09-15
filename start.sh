#!/bin/bash

read -p "Nom de l'utilisateur :" -n 24 User

#add sudo user
echo "Root 1"
su - -c "usermod -aG sudo $User"
echo "Root 2"
su root -c "sed '21i$User    ALL=(ALL:ALL) ALL' sudofile > /etc/sudoers"




read -p "Exec Install.sh bash for install software ? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "Connexion $User and execute the install.sh script"
	sudo -u $User bash install.sh $User 2>1 log.txt



else
	read -p "Exec Install-debug.sh for debug mode ? yes or no " -n 1 -r
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
        	echo "Connexion $User and exec the install-debug.sh script"
        	sudo -u $User bash install-debug.sh 2>&1 | tee log.txt
        fi


fi

