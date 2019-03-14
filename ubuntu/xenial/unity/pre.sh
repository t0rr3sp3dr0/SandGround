#!/bin/bash
export container=docker
export DEBIAN_FRONTEND=noninteractive
export DISPLAY=:11
export LANG=C.UTF-8

apt-get -y update
apt-get -y install --no-install-recommends xterm
apt-get -y clean
apt-get -y autoremove
rm -fRv /var/lib/apt/lists/*

until snap install core --edge
do
    sleep 0
done

apt-get -y update
apt-get -y install --no-install-recommends iptables libnss3-tools

iptables -F
iptables -A INPUT -i lo -j ACCEPT
for HOST in 127.0.0.1
do
    iptables -A INPUT -s $HOST -j ACCEPT
    iptables -A OUTPUT -d $HOST -j ACCEPT
done
iptables -A INPUT -j DROP
iptables -A OUTPUT -j DROP
iptables -A FORWARD -j DROP

apt-get remove iptables
apt-get -y clean
apt-get -y autoremove
rm -fRv /var/lib/apt/lists/*

{
    echo 1!P@ssword
    echo 1!P@ssword
    echo user
    echo
    echo
    echo
    echo
    echo Y
} | adduser user
usermod -aG sudo user
ID=`id -u user`
mkdir -p /run/user/$ID
chown user:user /run/user/$ID
unset ID
