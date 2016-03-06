#!/usr/bin/env bash
set -x

# install and update Miniconda
cp /vagrant/vendor/Miniconda3-latest-Linux-x86_64.sh .
chmod +x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh -b
export PATH=/home/vagrant/miniconda3/bin:$PATH
echo "export PATH=/home/vagrant/miniconda3/bin:\$PATH " >> ~/.bashrc;

# install build tools
conda update --yes conda
conda install --yes conda-build jinja2
