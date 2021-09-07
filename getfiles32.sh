#!/bin/bash

# download all files.
tgt=downloads32
if [ ! -d $tgt ]; then
    mkdir $tgt
    cd $tgt
    curl https://www-nds.iaea.org/fendl/data/neutron/fendl32-neutron-ace.zip -o fendl32-neutron-ace.zip 
    cd ..
else
    echo "To download fendl32 files from web, remove folder $tgt"
fi;

if [ -d $tgt ]; then
    rm -rf ace32
    mkdir ace32
    unzip $tgt/fendl32-neutron-ace.zip -d ace32
    cd ace32
    dos2unix *
fi;    

