#!/bin/bash

# download all files.
if [ ! -d downloads31 ]; then
    mkdir downloads31
    cd downloads31
    # wget -U Mozilla/5.0 https://www-nds.iaea.org/fendl/data/neutron/fendl31b-neutron-ace.zip
    wget                https://www-nds.iaea.org/fendl/data/neutron/fendl31b-neutron-ace.zip
    cd ..
else
    echo 'To download fendl31 files from web, remove folder "downloads31"'
fi;

if [ -d downloads31 ]; then
    rm -rf ace31
    mkdir ace31
    unzip downloads31/fendl31b-neutron-ace.zip -d ace31
fi;    

