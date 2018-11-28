#!/bin/bash

sudo systemctl stop wpantund.service
./bootstrap.sh
./configure --prefix=/usr --sysconfdir=/etc --disable-ncp-dummy --enable-static-link-ncp-plugin=spinel
make && sudo make install
sudo systemctl start wpantund.service
