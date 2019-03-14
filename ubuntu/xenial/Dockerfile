FROM ubuntu:16.04
MAINTAINER Pedro Tôrres <phts@cin.ufpe.br>

ENV container docker
ENV DEBIAN_FRONTEND noninteractive
ENV DISPLAY :11
ENV LANG C.UTF-8
RUN mkdir -p /var/run/dbus && \
    apt-get -y update && \
    apt-get -y install --no-install-recommends curl default-jdk gcc g++ git inetutils-ftp inetutils-ftpd inetutils-inetd inetutils-ping inetutils-syslogd inetutils-talk inetutils-talkd inetutils-telnet inetutils-telnetd inetutils-tools inetutils-traceroute nano net-tools psmisc python sudo tar unzip vim wget xterm zip && \
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
    rm -fRv /lib/systemd/system/sockets.target.wants/*udev*

ENTRYPOINT ["/bin/systemd"]
CMD ["/usr/bin/xterm"]
