#! /usr/bin/env bash

passw=$1
length=${#passw} 
RED='\033[0;31m'
GREEN='\033[0;32m'
x=0 #numerator for each rule validaion 


if (($length < 8))
then
    echo -e $RED "*The password should be at least 8 character"
else 
    let x+=1
fi 


if ! grep -q "[a-z]" <<< $passw
then
    echo -e $RED "*The password should contain at least 1 lower case latter"
else 
    let x+=1
fi

if ! grep -q "[A-Z]" <<< $passw
then
    echo -e $RED "*The password should contain at least 1 upper case latter"
else 
    let x+=1
fi

if ! grep -q "[0-9]" <<< $passw
then
    echo -e $RED "*The password should contain at least 1 number"
else 
    let x+=1
fi


if [ $x -eq 4 ]
then
    echo -e $GREEN  "Awesome password!"
fi