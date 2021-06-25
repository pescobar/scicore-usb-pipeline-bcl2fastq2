FROM centos:7
MAINTAINER Pablo Escobar <pablo.escobarlopez@unibas.ch>

RUN yum makecache fast && \
    yum -y install epel-release && \
    yum -y groupinstall 'Development Tools' \
 && yum -y clean all

RUN yum makecache fast && \
    yum -y install epel-release && \
    yum -y install \
    unzip \
    wget \
    zlib-devel \
    zlib-static \
    libxml2-devel \
    ncurses-devel \
    ncurses-static \
    bzip2-devel \
    libcurl-devel \
 && yum -y clean all

WORKDIR /usr/local/src
RUN wget ftp://webdata2:webdata2@ussd-ftp.illumina.com/downloads/Software/bcl2fastq/bcl2fastq2-v2.17.1.14.tar.zip

WORKDIR /usr/local/src
RUN unzip bcl2fastq2-v2.17.1.14.tar.zip && \
    tar xf bcl2fastq2-v2.17.1.14.tar.gz && \
    mkdir -p /usr/local/src/bcl2fastq/build && \
    cd /usr/local/src/bcl2fastq/build && \
    ../src/configure --prefix==/usr/local && \
    make && \
    make install
