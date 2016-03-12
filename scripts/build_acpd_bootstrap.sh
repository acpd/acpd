# Build the acpd bootstrap installer using constructor

# Stop at any error, show all commands
set -ex

constructor -v /acpd/acpd_bootstrap_specifications
mv acpd_bootstrap*.sh /acpd/
