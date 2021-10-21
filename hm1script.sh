#!/bin/bash

# our script

if git remote add qq $1
then
   printf "%s\n" "add remote repository"
fi

if git fetch qq
then
   printf "%s\n" "receive changes"
fi
if git diff qq/$2 qq/$3 > res.txt
then
   printf "%s\n" "form TXT"
fi   
