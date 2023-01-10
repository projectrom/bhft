#!/bin/sh

# Run this script with root privileges!

# Create directories
/bin/mkdir -p ./package/DEBIAN
/bin/mkdir -p ./package/usr/local/bin

# Create control file
cat <<EOF > ./package/DEBIAN/control
Package: peervpn
Version: 1.0
Section: unknown
Priority: optional
Depends: libc6
Architecture: amd64
Essential: no
Installed-Size: 5644
Maintainer: peervpn
Description: peer-to-peer vpn
EOF

/bin/cp ./peervpn/peervpn ./package/usr/local/bin

# Build package
dpkg-deb --build ./package

/bin/mv package.deb peervpn_1.0_amd64.deb
