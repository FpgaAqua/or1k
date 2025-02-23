#!/bin/sh

INSTALL_DIR=`pwd`/toolchain
TARGET=or1k-elf

wget -c https://github.com/openrisc/binutils-gdb/archive/refs/tags/or1k-2.38.50-20220202.tar.gz

tar xf or1k-2.38.50-20220202.tar.gz

patch -p1 -d binutils-gdb-or1k-2.38.50-20220202 < patches/binutils-no-sim-gdb.patch

mkdir build-binutils
cd build-binutils
../binutils-gdb-or1k-2.38.50-20220202/configure --target=$TARGET --prefix=$INSTALL_DIR/$TARGET \
  --disable-itcl --disable-tk --disable-tcl --disable-winsup --disable-gdbtk --disable-rda --disable-sid \
  --with-sysroot --disable-newlib --disable-libgloss --disable-checking --disable-werror --enable-static --disable-shared
make -j16
make install

rm -rf $INSTALL_DIR/include
rm -rf $INSTALL_DIR/share
