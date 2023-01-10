#/bin/bash

DIR=`pwd`

# Copy deb to repo
/bin/mkdir -p apt-repo/pool/main
/bin/cp peervpn_1.0_amd64.deb apt-repo/pool/main

# Create Packages file
/bin/mkdir -p apt-repo/dists/stable/main/binary-amd64
cd apt-repo
dpkg-scanpackages --arch amd64 pool/ > dists/stable/main/binary-amd64/Packages

# Generate Release file
cd dists/stable
$DIR/generate-release.sh > Release

# Configure repository
echo "deb [arch=amd64] http://127.0.0.1:8000/apt-repo stable main" > /etc/apt/sources.list.d/example.list

# Start web server
cd $DIR
python3 -m http.server &
sudo apt-get update --allow-insecure-repositories

# Install package
#apt install peervpn -y --allow-unauthenticated
