#!/bin/bash

# I need to know the date that this was collected
currentdate=$(date +"%B_%d_%Y")
# example output: October_24_2020

# Gets the name of sdb 
driveLabel=$(lsblk -o LABEL /dev/sdb | sed 's/LABEL//g' | awk NF)


function outputfreeSpace() { 

    freespaceLeft=$(df -h /dev/sdb* | grep "/dev/sdb*"| awk ' { print $4 } ')

    # not sure if this is the most elegant way to do it ... just want to add a SPACE before the output of this command 

    # Blank line
    echo >> $outputFileSummary
    echo >> $outputFileDetailed

    echo -e "freespace left on drive: $freespaceLeft" >> $outputFileSummary
    echo -e "freespace left on drive: $freespaceLeft" >> $outputFileDetailed
}


function copyToHomeFolder()
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
    cp $outputFileSummary $catalogHomeDir 
    cp $outputFileDetailed $catalogHomeDir

    # just shows the user that the file is now in their home folder 
    ls $catalogHomeDir

}

####################################################################
####################################################################

# Idea 
# 1 - scan for (tip: make the folder names universal maybe?) TTC, movies, and show dirs 



function getReport() 
{
    extendedResuts=$(tree -I "*.jpg|*.png|*.nfo|*.tbn|*.txt|*.sh" --dirsfirst --prune -o $outputFileDetailed $results)
    summaryResults=$(tree -d --prune -o $outputFileSummary $results)

}


function checkForDirs()
{
    # $@ = "movies"  "tvshows"
    # 2> /dev/null = to not display the output 

    for results in $@
    {   
        
        dirExists=$(find $(pwd) -type d -iname $results -print 2>/dev/null)
        
        #outputFile=$driveLabel_$results_$currentdate.txt 
        outputFileSummary="$driveLabel"_"$results"_$currentdate"_Summary".txt 
        outputFileDetailed="$driveLabel"_"$results"_$currentdate"_Detailed".txt 
    
        
        if [ ! -z "$dirExists" ]; then
            
            echo -e "$results dir found"

            # get summary if dir exists 
            getReport

            # add message about free space to the end of the outputed file from "getReport"
            outputfreeSpace
            
            # Copy file to home folder subdir so if i forget to do this, i dont have to plug each drive back in to do it 
            copyToHomeFolder
        else
            echo -e "$results dir NOT found"
            ls

        fi
    }

}

function catalogVideoFiles()
{
    # Looks for movies directory and outputs if found
    checkForDirs "movies" "tvshows"

    #checkForDirs "movies"
}


catalogVideoFiles

