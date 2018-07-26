FROM centos/systemd

MAINTAINER "Owen Boberg" <boberg37@gmail.com>

ENV USER ${USER:-opsim}
ENV HOME /home/opsim

RUN groupadd opsim && adduser -m -g opsim -s /bin/bash opsim

WORKDIR /home/opsim

RUN yum -y install firewalld \
    bzip2 \
    git \
    boost-python \
    mesa-libGL-devel \
    libXrender-devel \
    libSM-devel \
    libICE-devel \
    xorg-x11-fonts-100dpi \
    xorg-x11-fonts-Type1 \
    xorg-x11-fonts-ISO8859-1-100dpi \
    xorg-x11-fonts-misc \
    gnu-free-sans-fonts \
    liberation-*-fonts \
    dejavu-*-fonts \
    open-sans-fonts \
    bison \
    curl \
    blas \
    bzip2-devel \
    flex \
    fontconfig \
    freetype-devel \
    gcc-c++ \
    gcc-gfortran \
    libuuid-devel \
    libXext \
    libXrender \
    libXt-devel \
    make \
    openssl-devel \
    patch perl \
    readline-devel \
    tar zlib-devel \
    ncurses-devel \
    cmake \
    glib2-devel \
    java-1.8.0-openjdk \
    gettext \
    perl-ExtUtils-MakeMaker \
    g++ \
    ncurses-libs \
    xterm \
    java-1.7.0-openjdk-devel-oost-python \
    boost-python-devel \
    maven \
    python-devel \
    python36-devel \
    swig \
    tk-devel \
    which \
    yum clean all && \
    systemctl enable firewalld.service

RUN yum -y update
RUN yum -y install yum-utils
RUN yum -y groupinstall development
RUN yum -y install https://centos7.iuscommunity.org/ius-release.rpm
RUN yum -y install python36u
RUN yum -y install python36u-devel


EXPOSE 80

RUN mkdir dds repos && \
    cd repos && \
    git clone https://github.com/lsst-ts/ts_opensplice.git && \
    git clone https://github.com/lsst-ts/ts_sal.git && \
    git clone https://github.com/lsst-ts/ts_xml.git

ADD ./setup.env /home/opsim/dds/setup.env

RUN mkdir /home/opsim/sal_libs

CMD ["/usr/sbin/init"]
