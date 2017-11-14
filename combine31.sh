#!/bin/bash

./get_awr.sh "$@"

if [[ "0" -ne $? ]]; then 
    # previous script exited with an error.
    exit $?
fi    

cd ace31

# prepare single xsdir from separate *.xdr files:
cat ../awr.xsdir *.xsd > xsdir.1 

dos2unix -q xsdir.1

# Prepare specs file for makxsf that is used to put all cross-sections into a single file
T=${2:-1}
sed "s/XX/31/g; s/T/$T/g" ../specs.head > specs  # specs line header
csplit -q xsdir.1 '/directory/1'
awk '{ print $1 }' xx01 >> specs       # list of nuclides
echo >> specs                          # final empty line

# run makxsf
rm xsdir31.$T fendl31.$T;
makxsf

# copy resulted files to current dir
if [ -f fendl31.$T ]; then
   cp fendl31.$T ../. 
   cp xsdir31.$T ../. 
fi; 





