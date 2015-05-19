# MCRouterSetupCentOS7
```



tar -zxvf glog-0.3.3.tar.gz
./configure
make -j4
make install

tar -zxvf cmake-3.2.2.tar.gz
./bootstrap --datadir=share/cmake --docdir=doc/cmake
make -j4
make install

tar -zxvf gflags.tar.gz
cmake -DBUILD_SHARED_LIBS=true .
make -j4
make install

mkdir boost
cd boost/
rpm -Uvh boost*

rpm -Uvh libevent-devel-2.0.21-4.el7.x86_64.rpm
rpm -Uvh libcap-devel-2.22-8.el7.x86_64.rpm 


mkdir openssl
rpm -Uvh *.rpm

mkdir double-conversion
cd double-conversion/

tar -zxvf double-conversion.tar.gz
cmake -DBUILD_SHARED_LIBS=true .
make -j4
make install

vi /etc/ld.so.conf
/usr/local/lib
ldconfig

tar -zxvf folly.tar.gz
autoreconf --install
./configure
make -j4
make install
ldconfig

tar -zxvf ragel-6.9.tar.gz
./configure
make -j4
make install

tar -zxvf mcrouter.tar.gz
autoreconf --install
./configure
make -j4
make install

```
