# Install acpd_bootstrap
bash /acpd/acpd_bootstrap-0.1.0-Linux-x86_64.sh -b -p /opt/conda
mv /acpd/acpd_bootstrap-0.1.0-Linux-x86_64.sh \
    /acpd/acpd_bootstrap-0.1.0-Linux-x86_64.sh.orig
export PATH=/opt/conda/bin:$PATH

# Set offline mode to prevent any packages not included in the bootstrap
# installed from being installed
conda config --set offline True
