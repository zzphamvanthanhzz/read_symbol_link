#!/bin/sh

ABS_PATH=$1
FILE=$2
CMD="ln -s"

if [ ! -e "$FILE" ]
then
echo $CMD $ABS_PATH $FILE
$CMD $ABS_PATH $FILE
fi

