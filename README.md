# MCRouterSetupCentOS7

For source code builder


Install glog
```
# tar -zxvf glog-0.3.3.tar.gz
# cd glog-0.3.3
# ./configure
# make -j4
# make install
```

Then u maybe need cmake ...
```
# tar -zxvf cmake-3.2.2.tar.gz
# cd cmake-3.2.2
# ./bootstrap --datadir=share/cmake --docdir=doc/cmake
# make -j4
# make install
```

Install gflags
```
# tar -zxvf gflags.tar.gz
# cd gflags
# cmake -DBUILD_SHARED_LIBS=true .
# make -j4
# make install
```

Combin boost_1_53_0.tar.gz and install it

This is one of the c++ lib  (do not use boost_1_58_0. If u use that, folly will be crash!!)

We only need context,thread,regex,system,filesystem libraries
```
# ./catfile.sh
# tar -zxvf boost_1_53_0.tar.gz
# cd boost_1_53_0
# ./bootstrap.sh --with-libraries=context,thread,regex,system,filesystem
# ./b2 install --with-context --with-thread --with-regex --with-system --with-filesystem
```

Add path to ld.so.conf
```
# vi /etc/ld.so.conf
/usr/local/lib
# ldconfig -v
```

Install libevent-2.0.22-stable.tar.gz (need by folly)
```
# tar -zxvf libevent-2.0.22-stable.tar.gz
# cd libevent-2.0.22-stable/
# ./configure
# make -j4
# make install
```

Install libpcap-1.7.3.tar.gz (need by folly)
```
# tar -zxvf libpcap-1.7.3.tar.gz
# cd libpcap-1.7.3
# ./configure
# make -j4
# make install
```

If u dont have openssl...(need by folly)
```
# tar openssl-1.0.2-latest.tar.gz
# cd openssl-1.0.2-latest
# ./config --prefix=/usr --openssldir=/etc/ssl --libdir=lib shared
# vi /etc/ld.so.conf
/usr/local/ssl/lib
# ldconfig -v
```

Install double-conversion.tar.gz (need by folly)
```
# tar -zxvf double-conversion.tar.gz
# cd double-conversion
# cmake -DBUILD_SHARED_LIBS=true .
# make -j4
# make intall
# ldconfig -v
```

Install folly.tar.gz (need by mcrouter)
```
# tar -zxvf folly.tar.gz
# cd folly/folly
# autoreconf --install
# ./configure
# make -j4
# make install
# ldconfig -v
```

Install ragel if u dont have (need by mcrouter)
```
# tar -zxvf ragel-6.9.tar.gz
# cd ragel-6.9
# ./configure
# make -j4
# make install
```

Finally, MCRouter!!
```
# tar -zxvf mcrouter.tar.gz
# cd mcrouter
# autoreconf --install
# ./configure
# make -j4
# make install
# ldconfig -v
```
And then test it
```
# ./mcrouter
```



RPM install

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

