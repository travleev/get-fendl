#!/bin/bash

# download all files.
if [ ! -d downloads30 ]; then
    mkdir downloads30
    cd downloads30
    # wget -U Mozilla/5.0 https://www-nds.iaea.org/fendl30/data/neutron/fendl30-neutron-ace.zip
    # wget -U Mozilla/5.0 https://www-nds.iaea.org/fendl30/data/neutron-activ/fendl30-neutron-activ-ace.zip
    curl -o fendl30-neutron-ace.zip https://www-nds.iaea.org/fendl30/data/neutron/fendl30-neutron-ace.zip
    cd ..
else
    echo 'To download fendl30 files from web, remove folder "downloads30"'
fi;

# unzip files
if [ -d downloads30 ]; then
    rm -rf ace ace30
    unzip downloads30/fendl30-neutron-ace.zip 
    mv ace ace30
    cd ace30
    dos2unix *
fi;    
