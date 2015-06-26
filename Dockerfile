FROM ubuntu:12.04
MAINTAINER Laszlo Budai <laszlo.budai@balabit.com>

RUN echo "deb http://packages.madhouse-project.org/ubuntu precise syslog-ng-devel" >> /etc/apt/sources.list.d/syslog-ng-dev.list
RUN apt-get update
RUN apt-get install -y --force-yes \ 
    python-software-properties \
    git \
    gcc \
    autoconf \
    automake \
    make \
    libtool \
    flex \
    libbison-dev \
    libcap-dev \
    libdbi-dev \
    libesmtp-dev \
    libevtlog-dev \
    libfl-dev \
    libgeoip-dev \
    libglib2.0-dev \
    python-dev \
    libhiredis-dev \
    libivykis-dev \
    libjson0-dev \
    libltdl-dev \
    libmongo-client-dev \
    libnet1-dev \
    libpcre3-dev \
    libriemann-client-dev \
    libssl-dev \
    manpages-dev \
    zlib1g-dev \
    xsltproc \
    wget

RUN echo "deb http://download.opensuse.org/repositories/home:/laszlo_budai:/syslog-ng-ose-deps/Debian_8.0 ./" >> /etc/apt/sources.list.d/syslog-ng-dev.list
RUN wget -qO - http://download.opensuse.org/repositories/home:/laszlo_budai:/syslog-ng-ose-deps/Debian_8.0/Release.key| apt-key add -



RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN apt-get install riemann-c-client=1.7.0-1

RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections 
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
RUN apt-get install -y oracle-java7-installer

COPY build.sh /

RUN chmod +x build.sh
