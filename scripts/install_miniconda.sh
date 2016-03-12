# install Miniconda
if [ -f /acpd/cache/installers/Miniconda3-latest-Linux-x86_64.sh ]; then
    echo "Restoring Miniconda installer from cache"
    cp /acpd/cache/installers/Miniconda3-latest-Linux-x86_64.sh .
else
    # Download the latest Miniconda installer
    wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

    # cache installer
    mkdir -p /acpd/cache/installers 
    cp Miniconda3-latest-Linux-x86_64.sh \
        /acpd/cache/installers/Miniconda3-latest-Linux-x86_64.sh
fi
bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda

# restore Continuum packages from cache if they exist
if ls /acpd/cache/continuum_pkgs/*.bz2 >/dev/null 2>&1; then
    echo "Restoring packages from cache"
    mkdir -p /opt/conda/pkgs
    cp /acpd/cache/continuum_pkgs/*.bz2 /opt/conda/pkgs/
fi

# install other build tools
export PATH=/opt/conda/bin:$PATH
conda update --yes conda
conda install --yes conda-build
conda install --yes constructor

# cache Continuum packages
mkdir -p /acpd/cache/continuum_pkgs
cp /opt/conda/pkgs/*.bz2 /acpd/cache/continuum_pkgs/
