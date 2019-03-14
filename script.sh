#!/bin/bash
sudo docker version
if [ $? -ne 0 ]
then
	exit 1
fi

if [ "$(sudo docker images sandground:payload -q)" != "d1ee4fad4dd0" ]
then
	sudo docker image rm --force $(sudo docker images -q a)
	wget -qO- https://cin.ufpe.br/~phts/sandground/payload.tar.gz | sudo docker load
fi

if [ "$(sudo docker images sandground:xenial-unity-full -q)" != "71253eab3419" ]
then
	sudo docker image rm --force $(sudo docker images -q sandground)
	wget -qO- https://cin.ufpe.br/~phts/sandground/xenial-unity-full.tar.gz | sudo docker load
fi

sudo docker run -v `pwd`:/home sandground:payload && ./a.out
