#/bin/bash

# this script will setup the environment and install all necessary components 
# of Data Stack Academy (DSA) Chapter 2 Episode 1

# update pip
python3.7 -m pip install --upgrade pip setuptools wheel virtualenv

# create and run a python3.7 virtual env
python3.7 -m venv ch2e1_venv
source venv/bin/activate

# install/upgrade pip
python3.7 -m pip install --upgrade pip setuptools wheel

# install and setup jupyter notebooks 
pip3 install jupyterlab notebook jupyterthemes
# change default theme and fonts
jt -t onedork -T -tf sourcesans -nf sourcesans -tfs 12

# pip install pypi packages
pip3 install -r requirements.txt
