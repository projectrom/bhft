#!/bin/sh

# Run this script with root privileges!

SOURCE="https://github.com/peervpn/peervpn.git"

# Update or install usefull packages
apt update
apt install build-essential manpages-dev git automake autoconf -y

# Download source files from Github
git clone $SOURCE

/bin/cp build_script.sh ./peervpn
cd ./peervpn
/bin/bash ./build_script.sh
/bin/rm -f ./build_script.sh
