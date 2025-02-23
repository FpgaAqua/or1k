#!/bin/sh

INSTALL_DIR=`pwd`/toolchain
LIBS_DIR=`pwd`/libs
TARGET=or1k-elf

wget -c https://github.com/openrisc/or1k-gcc/archive/refs/tags/or1k-12.0.1-20220210-20220304.tar.gz

tar xf or1k-12.0.1-20220210-20220304.tar.gz

patch -p1 -d or1k-gcc-or1k-12.0.1-20220210-20220304 < patches/gcc-12-avoid-poisoning.patch

export PATH=$PATH:$INSTALL_DIR/$TARGET/bin

mkdir -p build-gcc
cd build-gcc
../or1k-gcc-or1k-12.0.1-20220210-20220304/configure --target=$TARGET --prefix=$INSTALL_DIR/$TARGET \
    --with-gnu-as --with-gnu-ld --disable-objc-gc --disable-libada --disable-shared \
    --disable-libssp --enable-languages=c --enable-static --disable-multilib \
    MAKEINFO=missing --with-gmp=$LIBS_DIR --with-mpfr=$LIBS_DIR --with-mpc=$LIBS_DIR
make -j16
make install
