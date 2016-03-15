acpd : Another conda-based Python distribution
==============================================

acpd is a [conda](http://conda.pydata.org/)-based Python distribution which
anyone, including you, can build from scratch.  

Why would you want to use acpd as opposed to a different conda-based
Python distribution?  Maybe you want to know where your binaries come from.
Perhaps you are worried about depending on a single supplier for your conda
goodness, or maybe you are just curious if such a feat can be done.  
Regardless, acpd is the distribution for you if you want to build your stack
from scratch.

### What works

Currently acpd only supports 64-bit Linux and builds a minimal set of Python 3.5 packages which allows the distribution to be rebuilt from the installer.  
Support for other operating systems, additional packages, and other Python 
versions is planned and contributions are welcome.  

### How to build

acpd uses a CentOS 5 Docker image similar to the 
[manylinux](https://github.com/pypa/manylinux) image to build conda packages 
which should work across a number of modern Linux distributions.  All of the
build tools required for acpd come pre-installed in the Docker image.  
If you do not have Docker installed on you machine, first follow the 
[instruction](https://docs.docker.com/engine/installation/) for installing
Docker.  Then pull the image off Docker Hub:

```
docker pull jjhelmus/acpd-x86_64
```

The Dockerfile used to create this image is included in this repo.  You can
build the image from this file using the following:

```
docker build -t jjhelmus/acpd-x86_64 -f docker/Dockerfile-x86_64 docker/
```

Once the Docker image is available, clone this repository. Then download the
`acpd_bootstrap` installer which is required to bootstrap the conda build
system.  Then from the root folder run the following to build the 
`acpd_bootstrap` installer from source.  The original installer will be renamed
to end with .orig.

```
docker run -v `pwd`:/acpd -t -i jjhelmus/acpd-x86_64 /bin/bash -c "\
    /acpd/scripts/install_acpd_bootstrap.sh; \
    /acpd/scripts/restore_src_dirs.sh; \
    /acpd/scripts/build_packages.sh; \
    /acpd/scripts/cache_src_dirs.sh; \
    /acpd/scripts/build_acpd_bootstrap.sh"
```

Alternatively [Miniconda](http://conda.pydata.org/miniconda.html) can be used
to bootstrap the conda build system:

```
docker run -v `pwd`:/acpd -t -i jjhelmus/acpd-x86_64 /bin/bash -c "\
    /acpd/scripts/install_miniconda.sh; \
    /acpd/scripts/restore_src_dirs.sh; \
    /acpd/scripts/build_packages.sh; \
    /acpd/scripts/cache_src_dirs.sh; \
    /acpd/scripts/build_acpd_bootstrap.sh"
```

The source code for the various packages is cached in the `cache` folder.
Rebuilding the installer after the first run should require less time and may
even be done while offline.

### License

All conda recipes except those listed below are either derived from 
[conda/conda-recipes](https://github.com/conda/conda-recipes) or were created
for this project and are in the public domain.  

The `readline`, `sqlite`, `xz`, `zlib` and `python-3.5` recipes were derived
from recipes in 
[ContinuumIO/anaconda-recipes](https://github.com/ContinuumIO/anaconda-recipes)
which does not specify a license.  Clarification of the license of these
recipes would be appreciated. 

The other portions of this project are covered by either a BSD or MIT license,
please see the LICENSE file for details
