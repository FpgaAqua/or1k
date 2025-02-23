#!/bin/sh

INSTALL_DIR=`pwd`/toolchain
TARGET=or1k-elf

rm -rf vasm
git clone https://github.com/FpgaAqua/vasm.git

export PATH=$PATH:$INSTALL_DIR/$TARGET/bin

cd vasm
make CPU=m68k SYNTAX=mot -j16
cp vasm_m68k_mot $INSTALL_DIR/$TARGET/bin/vasmm68k_mot
