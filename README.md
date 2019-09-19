# MY DEBIAN'S INSTALLATION AND CONFIG
 `DEFAULT : BUSTER version in FRENCH with KDE for DEV and MULTIMEDIA`

1. download an iso of debian BUSTER NetInstall

2. extract the iso:

	`./extract-iso.sh /path/to/iso/file.iso`

3. `cp preseed.cfg.example preseed.cfg`, customize your iso with preseed.cfg file (User, password...)
And `cp isolinux.cfg.autostart-example isolinux.cfg`

4. customize with comment or uncomment:
`auto-install.sh script `(auto install without touching)
AND 
`install-debug.sh `(Install step by step with choices)

5. build the custom iso:

	`./build-iso.sh`
	
6. make bootable your iso on USB-KEY, CD-ROM (or PXE server)

7. Get the debian-iso-preseed (in a USB for example) and installl the firmware : 
7.1 sudo dmesg | grep firmware, 7.2 apt-cache search NAME_OF_FIRMWARE (NAME of missing firmware), 7.3 apt-get install NAME_OF_PACKAGE

8. execute start.sh:
8.1. Sudoer config for user
8.2. Execution of install.sh (auto install of every package) OR install-debug.sh for choose which package you wish.
8.3. If you have some dependencies problem correct your source.list file and start it again (with source.list provided for example)

9. Custom your Desktop :
9.1 Use KDE-Desktop for follow my KDE customization :)
# Contains : 

BUILD ISO IMAGE (FORK):

|     	  Name     		|     Type      |     Detail    			 |
| ----------------------------- | ------------- | -------------------------------------- |
|extract-iso.sh 		| Script bash   | Extractor of ISO file  		 |
|build-iso.sh   		| Script bash   | Builder of your ISO after modification |
|preseed.cfg.example		| cfg file      | Basic example of preseed file		 |
|isolinux.cfg.autostart-example | cfg file      | Basic example of isolinux file 	 |



INSTALL PACKAGES :

|	      Name 		|      Type     |     			    Detail				|
| ----------------------------- | ------------- | ------------------------------------------------------------- |
|start.sh			| Script bash   | Start file for sudo right and choose auto or debug mode  	|
|install.sh  			| Script bash   | Auto install script 						|
|install-debug.sh		| Script bash   | install with choice						|
|test.sh			| Script bash   | Unit testing file						|
|PubKey.sh  			| Script bash   | Script for add pubkey for source list				|
|log.txt		        | Text file     | logs of scripts	 					|
|source.list			| file of config| File of config apt : /etc/apt/source.list		 	|
|source.list-empty 		| file of config| "basic" file to config apt : /etc/apt/source.list  		|
|sudoers		        | file of config| "empty" file to config sudoers 	 			|
|.bashrc 			| file of config| My config of bash 						|
|vim 				| Directory     | My config of Vim		 				|
|zsh 				| Directory     | My config of ZSH						|



DOCS :

|     	  Name     		|     Type      |     Detail    			 |
| ----------------------------- | ------------- | -------------------------------------- |
|KDE-Desktop.txt 		| text file  	| My steps for config my KDE desktop	 |
|README.md 			| README file   | [YOU ARE HERE] 			 |
|Step.txt			| text file     | XXX					 |
|list_ubuntu 			| text file     | List of software of my WSL ubuntu	 |
|locate.txt 			| text file     | XXX	 |
|IMAGE 				| Directory     | contain some pictures for fix source.list KDE problems	 |


# info
https://www.debian.org/releases/stable/amd64/apbs01.fr.html

`preseed.cfg.example` http://www.debian.org/releases/buster/example-preseed.txt

