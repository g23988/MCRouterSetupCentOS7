#!/bin/bash

#by WeiJ 20150113
#use for setup MCRoute in CentOS7

echo "start"

#add proxy


#yum download depending

yum install -y boost-devel gcc libevent libevent-devel libcap-devel openssl-devel make wget unzip \
autoconf automake libtool gcc-c++ gcc cmake snappy-devel numactl-devel python-devel flex bison cyrus-sasl cyrus-sasl-devel;

ldconf=$(cat /etc/ld.so.conf | grep "/usr/local/lib/")
if [ "$ldconf" != "/usr/local/lib/" ];then
	echo "/usr/local/lib/" >> /etc/ld.so.conf
	echo "Add /ld.so.conf ok!"
	ldconfig
else
	echo "Already have /usr/local/lib in ld.so.conf";
fi

orangepath=$(pwd)


#install google-glog
mkdir -p /opt/google-glog
cp "$orangepath"/glog-0.3.3.tar.gz /opt/google-glog
cd /opt/google-glog
tar -zxvf glog-0.3.3.tar.gz
cd glog-0.3.3
./configure
make && make install

#install google-gflags
mkdir -p /opt/google-gflags
cp "$orangepath"/v2.1.1.tar.gz /opt/google-gflags
cd /opt/google-gflags
tar -zxvf v2.1.1.tar.gz
cd gflags-v2.1.1
cmake -DBUILD_SHARED_LIBS=true .
make && make install

#install double-conversion
mkdir -p /opt/double-conversion
cp "$orangepath"/double-conversion-2.0.1.tar.gz /opt/double-conversion
cd /opt/double-conversion
tar -zxvf double-conversion-2.0.1.tar.gz
cd double-conversion
cmake -DBUILD_SHARED_LIBS=true .
make && make install


#install folly
ldconfig
mkdir -p /opt/folly
cp "$orangepath"/folly.zip /opt/folly/folly.zip
cd /opt/folly
unzip -o -d /opt/folly folly.zip
cd /opt/folly/folly-master/folly
autoreconf --install
./configure
make && make install

#install fbthrift
ldconfig
mkdir -p /opt/fbthrift
cp "$orangepath"/fbthrift.zip /opt/fbthrift/fbthrift.zip
cd /opt/fbthrift
unzip -o -d /opt/fbthrift fbthrift.zip
cd fbthrift-master/thrift/
autoreconf --install
./configure
make && make install

#install ragel
mkdir -p /opt/ragel
cp "$orangepath"/ragel-6.9.tar.gz /opt/ragel
cd /opt/ragel
tar -zxvf ragel-6.9.tar.gz
cd ragel-6.9
./configure
make && make install

#install mcrouter
ldconfig
mkdir -p /opt/mcrouter
cp "$orangepath"/mcrouter.tar.gz /opt/mcroutercd /opt/mcrouter
cd /opt/mcrouter
tar -zxvf mcrouter.tar.gz
cd mcrouter
autoreconf --install
./configure
make && make install

mkdir /var/spool/mcrouter