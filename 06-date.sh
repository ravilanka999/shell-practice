#!/bin/bash 

NUMBER1=100
NUMBER2=200


TIMESTAMP=$(date)
echo "Script executed at $TIMESTAMP"

SUM=$(($NUMBER1+$NUMBER2))

echo "The sum of N1+N2 is $SUM"