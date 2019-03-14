FROM ubuntu:16.04
MAINTAINER Pedro Tôrres <phts@cin.ufpe.br>

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8
RUN mkdir -p /var/run/dbus && \
    apt-get -y update && \
    apt-get -y install --no-install-recommends curl default-jdk evince file-roller firefox gcc gedit git gnome-calculator gnome-calendar gnome-panel gnome-screenshot gnome-system-monitor gnome-terminal inetutils-ftp inetutils-ftpd inetutils-inetd inetutils-ping inetutils-syslogd inetutils-talk inetutils-talkd inetutils-telnet inetutils-telnetd inetutils-tools inetutils-traceroute libcanberra-gtk3-module metacity nano nautilus net-tools psmisc python remmina rhythmbox sudo tar thunderbird ubuntu-desktop unity-lens-applications unzip vim wget xterm zip && \
    apt-get -y autoclean && \
    apt-get -y autoremove && \
    rm -fRv /var/lib/apt/lists/*

COPY xsession.sh /root/.xsession
CMD ["/bin/bash", "/root/.xsession"]
