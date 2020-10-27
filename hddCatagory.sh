#!/bin/bash

# I need to know the date that this was collected
currentdate=$(date +"%B_%d_%Y")
# example output: October_24_2020

# Gets the name of sdb 
function getHDDName()
{
  driveLabel=$(blkid | grep "/dev/sdb" | awk '/PARTLABEL/ { print $2 }' | sed 's/LABEL=//g;s/"//g')
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

function copyToHomeFolder
{
    catalogHomeDir="/home/$USER/Documents/Catalog"

    echo -e "Copying created text files to Home/Documents/Catalog folder"

    if [ ! -d $catalogHomeDir ]; then
        mkdir $catalogHomeDir
    else
        echo "$catalogHomeDir already exists"
    fi 

    # note to self: I think it's safe to say that all the catalog files I make will be .txt format so since the idea 
    # is to have this script copied to the root of each hdd and ran from there maybe ... just cp'ing any txt file in the 
    # hdd's root folder (only the root folder) should work ... no need to get hyper-specific 
    
    ## Here i should be in the hdd's root folder (when this script is placed there )
    cp *.txt $catalogHomeDir 

}


getHDDName

catalogVideoFiles