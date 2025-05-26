#!/bin/bash

MOVIES=("Kabali" "Badra" "Sankranti")

echo "the movies in an array are ${MOVIES[@]}"
echo "first movie is ${MOVIES[0]}"
echo "Second movie is ${MOVIES[1]}"

echo "which user is running the script $USER"
echo "Present working directory $PWd"
echo "the script that is being executed is $0"
