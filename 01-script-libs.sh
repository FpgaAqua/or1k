#!/bin/sh

LIBS_DIR=`pwd`/libs

wget -c https://gmplib.org/download/gmp/gmp-6.2.1.tar.lz
wget -c https://ftp.gnu.org/gnu/mpc/mpc-1.3.1.tar.gz
wget -c https://www.mpfr.org/mpfr-current/mpfr-4.2.1.tar.xz

tar xf gmp-6.2.1.tar.lz
tar xf mpc-1.3.1.tar.gz
tar xf mpfr-4.2.1.tar.xz

cd gmp-6.2.1
./configure --prefix=$LIBS_DIR --enable-static --disable-shared
make -j16
make install
cd ..

cd mpfr-4.2.1
./configure --prefix=$LIBS_DIR --enable-static --disable-shared --with-gmp=$LIBS_DIR
make -j16
make install
cd ..

cd mpc-1.3.1
./configure --prefix=$LIBS_DIR --enable-static --disable-shared --with-gmp=$LIBS_DIR --with-mpfr=$LIBS_DIR
make -j16
make install
cd ..
