#!/bin/bash

# download all files.
if [ ! -d downloads21 ]; then
    mkdir downloads21
    cd downloads21
    mwget='wget -U Mozilla/5.0'
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/H001mc.zip
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/H001mc.zip
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/H002mc.zip
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/H003mc.zip
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/He003mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/He004mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Li006mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Li007mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Be009mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/B010mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/B011mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/C012mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/N014mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/N015mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/O016mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/F019mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Na023mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Mg000mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Al027mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Si028mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Si029mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Si030mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/P031mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/S000mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Cl035mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Cl037mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/K000mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Ca000mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Ti046mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Ti047mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Ti048mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Ti049mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Ti050mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/V000mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Cr050mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Cr052mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Cr053mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Cr054mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Mn055mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Fe054mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Fe056mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Fe057mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Fe058mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Co059mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Ni058mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Ni060mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Ni061mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Ni062mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Ni064mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Cu063mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Cu065mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Ga000mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Zr000mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Nb093mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Mo092mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Mo094mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Mo095mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Mo096mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Mo097mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Mo098mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Mo100mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Sn000mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Ta181mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/W182mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/W183mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/W184mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/W186mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Au197mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Pb206mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Pb207mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Pb208mc.zip 
    $mwget https://www-nds.iaea.org/fendl21/fendl21mc/Bi209mc.zip 
    cd ..
else
    echo 'To download fendl21 files from web, remove folder "downloads21"'
fi;

###  # unzip files
rm -rf ace21
mkdir ace21
if [ -d downloads21 ]; then
    cd ace21
    for z in $(ls ../downloads21/*.zip); do
        unzip $z;
    done;
fi;


