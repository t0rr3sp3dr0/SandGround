FROM sandground:xenial
MAINTAINER Pedro Tôrres <phts@cin.ufpe.br>

RUN apt-get -y update && \
    apt-get -y install --no-install-recommends firefox gedit gnome-terminal libcanberra-gtk3-module metacity nautilus ubuntu-desktop && \
    apt-get -y purge xterm && \
    apt-get -y autoclean && \
    apt-get -y autoremove && \
    rm -fRv /var/lib/apt/lists/* && \
    bash -c 'cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -fRv $i; done'; \
    rm -fRv /etc/systemd/system/*.wants/*; \
    rm -fRv /lib/systemd/system/anaconda.target.wants/* \
    rm -fRv /lib/systemd/system/basic.target.wants/*; \
    rm -fRv /lib/systemd/system/local-fs.target.wants/*; \
    rm -fRv /lib/systemd/system/multi-user.target.wants/*; \
    rm -fRv /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -fRv /lib/systemd/system/sockets.target.wants/*udev*; \
    systemctl disable display-manager

COPY xsession.sh /root/.xsession
CMD ["/bin/bash", "/root/.xsession"]
