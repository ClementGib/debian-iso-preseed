#!/bin/bash

read -p "Nom de l'utilisateur :" -n 24 User

#add sudo user
echo "Root 1"
su root -c "usermod -aG sudo $User"
echo "Root 2"
su root -c "sed '21i$User    ALL=(ALL:ALL) ALL' sudofile > /etc/sudoers"




read -p "Exec Install.sh bash for install software ? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "Connexion $User and execute the install.sh script"
	sudo -u $User bash install.sh $User > log.txt

fi

