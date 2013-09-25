#!/bin/bash
platform=intel_64
dir=`pwd`
target=${dir##*/}

source $IFORT_COMPILER/bin/compilervars.sh $platform

echo Building $target
make VPATH=".." -f ../makefile $target
