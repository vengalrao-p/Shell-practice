#!/bin/bash
num=1
i="$2"
while [[ "$num" -le "$i" ]]; 
do
  mkdir "$1$num"
  ((num++))
done
