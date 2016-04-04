#!/bin/bash

if [ `uname` == Darwin ]; then
    ./Configure darwin64-x86_64-cc shared --prefix=$PREFIX
    make depend
else
    ./config shared --prefix=$PREFIX
fi
make
make install

# remove man pages
rm -rf $PREFIX/ssl/man
