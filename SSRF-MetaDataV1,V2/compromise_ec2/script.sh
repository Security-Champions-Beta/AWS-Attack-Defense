#!/bin/bash
sudo su
sudo apt-get update -y
sudo apt install -y aptitude software-properties-common wget curl httpie git zip unzip python3-pip build-essential libssl-dev libffi-dev python3-dev python3-distutils supervisor
export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true
sudo ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
sudo dpkg-reconfigure --frontend noninteractive tzdata
sudo apt-get install -y build-essential python3-dev python3-pip python3-setuptools python3-wheel python3-cffi libcairo2 libpango-1.0-0 libpangocairo-1.0-0 libgdk-pixbuf2.0-0 libffi-dev shared-mime-info binwalk
sudo apt-get install python3.7 -y
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 2
sudo apt-get -y install python3-pip
sudo apt-get install python3-pip python3-setuptools python3.7-venv -y
sudo apt-get -y update
sudo apt-get install -y redis
sudo rm /etc/redis/redis.conf
sudo cp /tmp/redis.conf /etc/redis/
sudo service redis-server start
sudo service redis restart
sudo mv /tmp/weasyprint-ssrf/ /weasyprint-ssrf/
cd /weasyprint-ssrf/
python3 -m venv env
source env/bin/activate
pip3 install -r requirements.txt
cd app
python3 app.py
sudo apt-get update -y
