#!/bin/bash

make -f Makefile-libbz2_so
make
make install PREFIX=$PREFIX

rm -rf $PREFIX/bin
rm -rf $PREFIX/man
