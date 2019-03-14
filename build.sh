#!/bin/bash
gcc ./payload/main.c -o ./payload/a.out -pthread -static
sudo docker build -t sandground:payload ./payload
sudo docker build -t sandground:xenial ./ubuntu/xenial
sudo docker build -t sandground:xenial-unity ./ubuntu/xenial/unity
sudo docker build -t sandground:xenial-unity-full ./ubuntu/xenial/unity/full
sudo docker build -t sandground:xenial-metacity ./ubuntu/xenial/metacity
