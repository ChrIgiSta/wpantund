#!/bin/bash

sudo systemctl stop wpantund.service
./bootstrap.sh
./configure --prefix=/usr --sysconfdir=/etc --disable-ncp-dummy --enable-static-link-ncp-plugin=spinel
make && sudo make install
sudo sed -i '/Config:NCP:SocketPath "\/dev/i Config:NCP:SocketPath "/dev/ncpRadio"' /etc/wpantund.conf
sudo systemctl start wpantund.service
