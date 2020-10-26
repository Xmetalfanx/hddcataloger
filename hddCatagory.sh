#!/bin/bash

# I need to know the date that this was collected
currentdate=$(date +"%B_%d_%Y")
# example output: October_24_2020

function getHDDName()
{
  driveLabel=$(blkid | grep "/dev/sdb" | awk '/PARTLABEL/ { print $2 }' | sed 's/LABEL=//g;s/"//g')

  # test 
  #echo $driveLabel_$currentdate
  #echo "foobar"_$currentdate
}


####################################################################
####################################################################

# Idea 
# 1 - scan for (tip: make the folder names universal maybe?) TTC, movies, and show dirs 

function checkForDirs()
{
    # $1 for now ... i should see if that $ without unlimited arguements is better 
    # $1 = "movies"  "tvshows"

    # 2> /dev/null = to not display the output 

    dirExistResult=$(find $(pwd) -type d -iname $1)

    if [[ -z $dirExistResult ]]; then
        echo -e "$1 dir NOT found"
    else
        echo -e "$1 dir found"
        tree --dirsfirst --prune -I "*.jpg|*.png|*.nfo|*.tbn|*.txt|*.sh" -o $driveLabel_$1_$currentdate.txt $dirExistResult
    fi


}

function catalogVideoFiles()
{
    # Looks for movies directory and outputs if found
    checkForDirs "movies"

    # look for tvshows directory 
    checkForDirs "tvshows"

}



getHDDName

catalogVideoFiles