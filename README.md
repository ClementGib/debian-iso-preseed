MY DEBIAN (BUSTER) INSTALLATION AND CONFIG

1. download iso debian netinstall


2. extract an iso:

	`./extract-iso.sh /path/to/iso/file.iso`

3. `cp preseed.cfg.example preseed.cfg`, customize iso and preseed.cfg file

4. Adapt the install.sh, comment or uncomment:

5. build the custom iso:

	`./build-iso.sh`

# info
https://www.debian.org/releases/stable/amd64/apbs01.fr.html

the `preseed.cfg.example` file is a copy of http://www.debian.org/releases/squeeze/example-preseed.txt

