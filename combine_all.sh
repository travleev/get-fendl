#!/bin/bash

# ITER uses fendl21, therefore place these data first
for T in 1 2; do
    if [ -f xsdir21.$T ]; then
        cat xsdir21.$T > xsdir.$T
    fi
    if [ -f xsdir30.$T ]; then    
        csplit -q xsdir30.$T '/directory/1'
        cat xx01 >> xsdir.$T
        rm xx??
    fi        
done;    

