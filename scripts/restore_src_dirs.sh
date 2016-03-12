# Restore the conda-bld source directories from cache
mkdir -p /opt/conda/conda-bld
cp -r /acpd/cache/src_cache /opt/conda/conda-bld/src_cache
cp -r /acpd/cache/git_cache /opt/conda/conda-bld/git_cache
