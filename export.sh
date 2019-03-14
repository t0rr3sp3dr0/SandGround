#!/bin/bash
sudo docker save sandground:payload | gzip -c > sandground:payload.tar.gz
sudo docker save sandground:xenial | gzip -c > sandground:xenial.tar.gz
sudo docker save sandground:xenial-unity | gzip -c > sandground:xenial-unity.tar.gz
sudo docker save sandground:xenial-unity-full | gzip -c > sandground:xenial-unity-full.tar.gz
sudo docker save sandground:xenial-metacity | gzip -c > sandground:xenial-metacity.tar.gz
