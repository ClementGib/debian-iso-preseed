1. extract an iso:

	`./extract-iso.sh /path/to/iso/file.iso`

2. `cp preseed.cfg.example preseed.cfg`, customize iso and preseed.cfg file

3. Adapt the install.sh, comment or uncomment:

# Bower - a dependency manager
#sudo npm install -g bower

# Yeoman - for generators
sudo npm install -g yo


4. build the custom iso:

	`./build-iso.sh`

# info
https://www.debian.org/releases/stable/amd64/apbs01.fr.html

the `preseed.cfg.example` file is a copy of http://www.debian.org/releases/squeeze/example-preseed.txt
