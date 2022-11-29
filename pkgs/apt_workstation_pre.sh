#!/bin/bash
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo echo -e '### THIS FILE IS AUTOMATICALLY CONFIGURED ###\n# You may comment out this entry, but any other modifications may be lost.\ndeb [arch=amd64] https://packages.microsoft.com/repos/edge/ stable main\n' > /etc/apt/sources.list.d/vscode.list
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge/ stable main" > /etc/apt/sources.list.d/microsoft_edge.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update

