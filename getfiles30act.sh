#!/bin/bash

# download all files.
tgt=downloads30a
if [ ! -f $tgt/fendl30-neutron-activ-ace.zip ]; then
    rm -rf $tgt
    mkdir $tgt
    cd $tgt
    # wget -U Mozilla/5.0 https://www-nds.iaea.org/fendl/data/neutron/fendl31b-neutron-ace.zip
    # wget                https://www-nds.iaea.org/fendl/data/neutron/fendl31b-neutron-ace.zip

    curl https://www-nds.iaea.org/fendl31d/data/neutron-activ/fendl30-neutron-activ-ace.zip -o fendl30-neutron-activ-ace.zip 
    cd ..
fi

if [ -f $tgt/fendl30-neutron-activ-ace.zip ]; then
    rm -rf ace30a
    mkdir ace30a
    unzip $tgt/fendl30-neutron-activ-ace.zip -d ace30a
    cd ace30a/ace
    dos2unix *
    cd ../..
fi;    


if [ ! -d ace30a/ace ]; then
    echo "Folder ace30a/ace does not exist. Why?"
    exit 1
fi


cd ace30a/ace


# prepare single xsdir from separate *.xdr files:
cat ../../awr.xsdir > xsdir.1 


# ace/*.dir data contain 'filename' and 'route' instead of actual xslib name and 0. Fix this.
# TODO: this approach does not take into account metastable nuclides. For example, Am242m is called
#       in this set 92242, i.e. exactly as the nuclide in the ground state.
for d in $(ls *[^mn].dir); do
    n=${d%.dir}
    sed 's/filename/'$n'/g; s/route/0/g' $d >> xsdir.1 
done

# Replace ZZZAAA for metastable nuclides with AAA + 300 + i*100
for d in $(ls *[mn].dir); do
    case $d in
        *m.dir)
            da=400
            ;;
        *n.dir)
            da=500
            ;;
    esac

    n=${d%.dir}  #  name of xs file 
    # Read ZZZAAA.NNy from dir file: 
    IFS='. ' read -a zaid < $d  # get ZZZAAA from *.dir file
    a=${zaid[0]: -3}
    z=${zaid[0]%$a}
    b=$(expr $a + $da)
    zaold=$z$a.${zaid[1]}
    zanew=$z$b.${zaid[1]}
    echo $d $n $zaold $z $a $b $zanew
    sed "s/$zaold/$zanew/g; s/filename/$n/g; s/route/0/g" $d >> xsdir.1
    sed -i "1 s/$zaold/$zanew/g" $n
done

dos2unix -q xsdir.1

