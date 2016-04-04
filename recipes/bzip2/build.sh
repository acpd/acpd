#!/bin/bash

if [ `uname` == Darwin ]; then
    make
else
    make -f Makefile-libbz2_so
fi
make
make install PREFIX=$PREFIX

rm -rf $PREFIX/bin
rm -rf $PREFIX/man
