#!/bin/bash

touch /etc/apt/sources.list.d/dropbox.list
echo deb [arch=i386,amd64] http://linux.dropbox.com/debian jessie main > /etc/apt/sources.list.d/dropbox.list
