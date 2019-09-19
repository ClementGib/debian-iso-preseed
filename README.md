# MY DEBIAN'S INSTALLATION AND CONFIG WITH PRESEED AND BASH (DEFAULT FRENCH)

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

7. execute start.sh:
7.1. Sudoer config for user
7.2. Execution of install.sh (auto install of every package) OR install-debug.sh for choose which package you wish.
7.3. If you have some dependencies problem correct your source.list file and start it again (with source.list provided for exemple)

8. Custom your Desktop :
8.1 Use KDE-Desktop for follow my KDE customization :)
# Contains : 

BUILD ISO IMAGE:

|     	  Name     		|     Type      |     Detail    			 |
| ----------------------------- | ------------- | -------------------------------------- |
|extract-iso.sh 		| Script bash   | Extractor of ISO file  		 |
|build-iso.sh   		| Script bash   | Builder of your ISO after modification |
|preseed.cfg.example		| cfg file      | Basic exemple of preseed file		 |
|isolinux.cfg.autostart-example | cfg file      | Basic exemple of isolinux file 	 |



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
|source.list-empty 		| file of config| "basic" file of config apt : /etc/apt/source.list  		|
|sudoers		        | file of config| "empty" file of config for sudoers 	 			|
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

