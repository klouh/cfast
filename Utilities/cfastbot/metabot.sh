#!/bin/bash

CFASTBOT_HOME_DIR=~
CFASTBOT_DIR="$CFASTBOT_HOME_DIR/CFASTBOT"
CFAST_SVNROOT="$CFASTBOT_HOME_DIR/cfast"
RUNNING=$CFASTBOT_DIR/running
QUEUE="-q fire7080s"

while getopts 'q:' OPTION
do case $OPTION in
  q)
   QUEUE="-q $OPTARG"
  ;;
esac
done

for f in r30 r35 r40 r45 r50 r55 r60 r65 r70 
do
   while [ -e $RUNNING ]; do
      echo trying to run case $f
      echo cfastbot already running
      sleep 30
   done
   echo cfastbot finished
   echo now running case $f
   cp ~/radtest/$f $CFAST_SVNROOT/CFAST/Source/radiation.f90

   cd $CFASTBOT_DIR
   ./run_cfastbot.sh $QUEUE -s -l $f
   sleep 30
done
echo metabot complete

