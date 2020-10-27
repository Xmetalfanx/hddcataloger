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
    # $@ = "movies"  "tvshows"
    # 2> /dev/null = to not display the output 

    for results in $@
    {         
        dirExists=$(find $(pwd) -type d -iname $results)
        
        #outputFile=$driveLabel_$results_$currentdate.txt 
        outputFile="$results"_$currentdate.txt 

        if [[ -z $dirExists ]]; then
            # Dir not found / command output is null 
            echo -e "$results dir NOT found"
            return
        else

            echo -e "$results dir found"
            
            tree -I "*.jpg|*.png|*.nfo|*.tbn|*.txt|*.sh" --dirsfirst --prune -o $outputFile -- $results
        fi
    }

}

function catalogVideoFiles()
{
    # Looks for movies directory and outputs if found
    checkForDirs Movies tvshows

    # look for tvshows directory 
    #checkForDirs "tvshows"

}



getHDDName

catalogVideoFiles