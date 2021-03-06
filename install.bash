#!/usr/bin/bash

# 1. Create a folder raspi-iot in your home directory (/home/pi/raspi-iot/)
# 2. Download the entire repository to this folder, so you have /home/pi/raspi-iot/src/agent, daemon, etc.
# 3. Run this: bash /home/pi/raspi-iot/src/install.bash

mkdir /home/pi/raspi-iot
mkdir /home/pi/raspi-iot/state # This might already exist...
sudo apt-get update
sudo apt-get -y install git

# Go fetch the full code:
cd /home/pi/raspi-iot/
git clone https://github.com/svenlatham/raspi-iot.git src

# Prerequisites:
sudo apt-get -y install php-cli network-manager tcpdump
sudo apt -y purge openresolv dhcpcd5

# Installation of service:
sudo cp /home/pi/raspi-iot/src/daemon/raspi-iot.service /etc/systemd/system/raspi-iot.service

# Now run it
sudo systemctl enable raspi-iot.service
sudo systemctl start raspi-iot.service

# reboot - needed because of networking changes
sudo reboot
