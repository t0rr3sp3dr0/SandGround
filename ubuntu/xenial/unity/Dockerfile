FROM sandground:xenial
MAINTAINER Pedro Tôrres <phts@cin.ufpe.br>

RUN apt-get -y update && \
    apt-get -y install --no-install-recommends firefox gedit gnome-panel gnome-terminal libcanberra-gtk3-module metacity nautilus ubuntu-desktop && \
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

RUN apt-get -y update && \
    apt-get -y install fuse snapd snap-confine squashfuse && \
    apt-get -y autoclean && \
    apt-get -y autoremove && \
    rm -fRv /var/lib/apt/lists/* && \
    dpkg-divert --local --rename --add /sbin/udevadm && \
    ln -s /bin/true /sbin/udevadm && \
    systemctl enable snapd

RUN apt-get -y update && \
    apt-get -y install --no-install-recommends unity-lens-applications unity-lens-files && \
    apt-get -y clean && \
    apt-get -y autoremove && \
    rm -fRv /var/lib/apt/lists/*

COPY snaps /root/snaps
COPY extra /usr/share/ca-certificates/extra
COPY background.png /usr/share/backgrounds/warty-final-ubuntu.png
COPY pre.sh /root/pre.sh
COPY xsession.sh /root/.xsession
COPY sandground.service /etc/systemd/system/sandground.service
RUN update-ca-certificates && \
    chmod +x /root/pre.sh && \
    chmod +x /root/.xsession && \
    systemctl enable sandground

CMD []
