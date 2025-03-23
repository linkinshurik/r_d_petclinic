#!/bin/bash
sudo apt update -y
sudo apt install -y curl git
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs
node -v
npm -v
sudo npm install -g create-react-app
cd /vagrant_shared
create-react-app my-app
cd my-app
npm start