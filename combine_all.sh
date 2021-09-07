#!/bin/bash

for T in 1 2; do
    rm -f xsdir.$T
    # ITER uses fendl21, therefore place these data first
    for v in 21 30 31; do
        if [ -f xsdir$v.$T ]; then
            if [ -f xsdir.$T ]; then
                csplit -q xsdir$v.$T '/directory/1'
                cat xx01 >> xsdir.$T
                rm xx??
            else
                cp xsdir$v.$T xsdir.$T
            fi
        fi
    done; 
    # TODO Add activation XS
done;    

