#!/bin/bash

$PYTHON bootstrap.py
$PYTHON setup.py bdist_egg

unset CONDA_BUILD
$PYTHON setup.py install
