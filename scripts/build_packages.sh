# Build conda packages required for the acpd bootstrap installer

# Stop at any error, show all commands
set -ex

# Do not install pip when python is listed as a dependency in a recipe
conda config --set add_pip_as_python_dependency false

# build Python requirements
conda build /acpd/recipes/bzip2
conda build /acpd/recipes/openssl
conda build /acpd/recipes/readline
conda build /acpd/recipes/sqlite
conda build /acpd/recipes/tk
conda build /acpd/recipes/xz
conda build /acpd/recipes/zlib

# build Python 3.5
conda build /acpd/recipes/python-3.5

# build pip and requirements
conda build /acpd/recipes/setuptools
conda build /acpd/recipes/wheel
conda build /acpd/recipes/pip

# build pyyaml and requirements
conda build /acpd/recipes/yaml
conda build /acpd/recipes/pyyaml

# build conda requirements
conda build /acpd/recipes/requests
conda build /acpd/recipes/conda-env  --no-test  # test depend on conda
conda build /acpd/recipes/pycosat
conda build /acpd/recipes/pycrypto

# build conda
conda build /acpd/recipes/conda
conda build /acpd/recipes/conda-env  --test

# build conda-build requirements
conda build /acpd/recipes/markupsafe
conda build /acpd/recipes/jinja2
conda build /acpd/recipes/patchelf

# build conda-build
conda build /acpd/recipes/conda-build

# build constructor
conda build /acpd/recipes/constructor
