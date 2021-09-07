#!/bin/bash

./get_awr.sh "$@"

if [[ "0" -ne $? ]]; then 
    # previous script exited with an error.
    exit $?
fi    

if [ ! -d ace30a/ace ]; then
    echo "Directory ace30a/ace does not exist. Run first getfiles30a.sh to download files."
    exit 1
fi

cd ace30a/ace

# Prepare specs file for makxsf that is used to put all cross-sections into a single file
T=${2:-1}
sed "s/XX/30a/g; s/T/$T/g" ../../specs.head > specs  # specs line header
csplit -q xsdir.1 '/directory/1'
awk '{ print $1 }' xx01 >> specs       # list of nuclides
echo >> specs                          # final empty line


# Check separate data files
mv specs specs.all
csplit -q specs.all /^$/
rm good.txt bad.txt
cat > specs.pattern <<EOSPECS
xsdir.1 zaid.xsdir
zaid.data 1 

zaid

EOSPECS
for zaid in $(cat xx01); do
    sed "s/zaid/$zaid/g" specs.pattern > specs
    rm $zaid.xsdir $zaid.data
    if  makxsf &>/dev/null ; then 
        echo "$zaid Ok"; 
        echo $zaid >> good.txt 
    else
        echo "$zaid bad"; 
        echo $zaid >> bad.txt
    fi
done

# Put all good data into single file
cat xx00 > specs
echo >> specs
cat good.txt >> specs
echo >> specs


# run makxsf
rm xsdir30a.$T fendl30a.$T;
makxsf

# copy resulted files to current dir
if [ -f fendl30a.$T ]; then
   cp fendl30a.$T ../. 
   cp xsdir30a.$T ../. 
fi; 





