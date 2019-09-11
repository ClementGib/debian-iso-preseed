# MY DEBIAN'S INSTALLATION AND CONFIG WITH PRESEED AND BASH (DEFAULT FRENCH)

1. download an iso of debian BUSTER NetInstall

2. extract the iso:

	`./extract-iso.sh /path/to/iso/file.iso`

3. `cp preseed.cfg.example preseed.cfg`, customize your iso with preseed.cfg file (User, password...)

4. customize with comment or uncomment:
`auto-install.sh script `(auto install without touching)
OR 
`install-debug.sh `(Install step by step with choices)

5. build the custom iso:

	`./build-iso.sh`
	
6. make bootable your iso on USB-KEY, CD-ROM (or PXE server)

7. execute start.sh at the root of your bootable device


# info
https://www.debian.org/releases/stable/amd64/apbs01.fr.html

the `preseed.cfg.example` file is a copy of http://www.debian.org/releases/buster/example-preseed.txt

