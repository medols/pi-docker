#!/bin/bash

locale-gen en_US.UTF-8
apt-get update
apt-get -y upgrade
apt-get -y install make clang-3.6 g++ ruby-dev libncurses-dev zlib1g-dev libssl-dev libedit-dev libncursesw5-dev git
ln -s /usr/bin/llvm-config-3.6 /usr/bin/llvm-config
mkdir -p /home/pi
cd /home/pi
git clone https://github.com/medols/rubinius.git
cd rubinius
LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8 ./configure --prefix=/opt/rubinius/4.0 --llvm-config=llvm-config-3.6 --cc=clang-3.6 --cxx=clang++-3.6
#LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8 rake
