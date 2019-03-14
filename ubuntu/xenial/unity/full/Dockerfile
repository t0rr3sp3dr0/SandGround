FROM sandground:xenial-unity
MAINTAINER Pedro Tôrres <phts@cin.ufpe.br>

RUN apt-get -y update && \
    apt-get -y install --no-install-recommends evince file-roller gnome-calculator gnome-calendar gnome-screenshot gnome-system-monitor remmina rhythmbox thunderbird && \
    apt-get -y autoclean && \
    apt-get -y autoremove && \
    rm -fRv /var/lib/apt/lists/*
