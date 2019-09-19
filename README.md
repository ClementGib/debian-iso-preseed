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
1.1. Sudoer config for user
1.2. Execution of install.sh (auto install of every package) OR install-debug.sh for choose which package you wish.
1.3. If you have some dependencies problem correct your source.list file and start it again (with source.list provided for exemple)

# Contains : 
BUILD ISO IMAGE:
extract-iso.sh,
build-iso.sh,
preseed.cfg.example,
isolinux.cfg.autostart-example,

INSTALL PACKAGES :
start.sh (start file for sudo right and choose auto or debug mode),
install.sh (auto install),
install-debug.sh (install with choice),
log.txt (logs of scripts ),
source.list (source list config for buster with package net PubKey),
PubKey.sh (Script for add pubkey for source list),
source.list-empty (basic source list for debian buster),
sudoers ("empty" file of sudoers),
.bashrc (with my config of bash),
vim directory (with my config of vim),
zsh directory (with my config of zsh),
test.sh (Unit testing file),

|     Name      |     Type      |     Detail    |
| ------------- | ------------- | ------------- |
| Content Cell  | Content Cell  | Content Cell  |
| Content Cell  | Content Cell  | Content Cell  |

DOC :
IMAGE directory (contain some pictures for fix source.list KDE problems),
KDE-Desktop.txt file,
README.md,
Step.txt,
list_ubuntu,
locate.txt,

# info
https://www.debian.org/releases/stable/amd64/apbs01.fr.html

`preseed.cfg.example` http://www.debian.org/releases/buster/example-preseed.txt

