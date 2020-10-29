#!/bin/bash

############################### Vars #####################################

# I need to know the date that this was collected
currentdate=$(date +"%B_%d_%Y")
# example output: October_24_2020

# Gets the name of sdb 
# driveLabel seems to be better for when i am not running the script in the root of the ext drive
driveLabel=$(lsblk -o LABEL /dev/sdb | sed 's/LABEL//g' | awk NF)

# simpiler way to get the drivelabel i think .. now planning to run the scripts from the internal drive 
pwdDriveLabel=$(basename $PWD)

# make check ignore case 
TheTeachingCompanyDir="$(pwd)/videos/educationial/ttc"
homevidsDir="$(pwd)/videos/homevids"
themeparkDir="$(pwd)/videos/themeparks"

############################### End Vars #####################################


function outputfreeSpace() { 

    freespaceLeft=$(df -h /dev/sdb* | grep "/dev/sdb*"| awk ' { print $4 } ')

    # not sure if this is the most elegant way to do it ... just want to add a SPACE before the output of this command 

    # Blank line
    echo >> $outputFileSummary
    echo >> $outputFileDetailed

    echo -e "freespace left on drive: $freespaceLeft" >> $outputFileSummary
    echo -e "freespace left on drive: $freespaceLeft" >> $outputFileDetailed
}

# Universal 
function copyToHomeFolder()
{
    catalogHomeDir="/home/$USER/Documents/Catalog"

    echo -e "Copying created text files to Home/Documents/Catalog folder"

    if [ ! -d $catalogHomeDir ]; then
        mkdir $catalogHomeDir
    else
        return
    fi 
    
    ######
    echo -e "test: still inside copyToHomeFolder function"
    ##


    ## Here i should be in the hdd's root folder (when this script is placed there )
    cp $outputFileSummary $catalogHomeDir 
    cp $outputFileDetailed $catalogHomeDir

    # just shows the user that the file is now in their home folder 
    #ls $catalogHomeDir

}

####################################################################
####################################################################

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
        
        # Place to put output 
        outputFileSummary="$pwdDriveLabel"_"$results"_$currentdate"_Summary".txt 
        outputFileDetailed="$pwdDriveLabel"_"$results"_$currentdate"_Detailed".txt 
    
        
        if [ ! -z "$dirExists" ]; then
            
           read -p "$results dir found"

            # get summary if dir exists 
            getReport

            # add message about free space to the end of the outputed file from "getReport"
            outputfreeSpace
            
            # Copy file to home folder subdir so if i forget to do this, i dont have to plug each drive back in to do it 
            copyToHomeFolder
        else
            read -p "$results dir NOT found"
            

        fi
    }

}

function catalogVideoFiles()
{
    # Looks for movies directory and outputs if found
    
    checkForDirs "movies" "tvshows" 

    checkForCustomDirs "$TheTeachingCompanyDir" "$homevidsDir" "$themeparkDir"
}

#################### code for non-movie and non-tv shows ##############################

function getReportCustomDirs() 
{
    # results is the same var in both getReport functions 
    extendedResuts=$(tree -I "*.jpg|*.png|*.nfo|*.tbn|*.txt|*.sh" --dirsfirst --prune -o $outputFileDetailed $results)
    summaryResults=$(tree -d --prune -o $outputFileSummary $results)

}

function checkForCustomDirs()
{
 for results in $@
    {           

        customDirName=$(basename $results)
        read -p "customDirName: $customDirName"
       

        # this will not work .. $results is a full path 
        outputFileSummary="$pwdDriveLabel"_"$customDirName"_$currentdate"_Summary".txt 
        outputFileDetailed="$pwdDriveLabel"_"$customDirName"_$currentdate"_Detailed".txt 
    
        
        if [ -d "$results" ]; then
            
        read -p "$results dir found"

            # get summary if dir exists 
            getReport

            # add message about free space to the end of the outputed file from "getReport"
            outputfreeSpace
            
            # Copy file to home folder subdir so if i forget to do this, i dont have to plug each drive back in to do it 
            copyToHomeFolder
        else
            read -p "$results dir NOT found"
            

        fi
    }


}

#######################################################################################

catalogVideoFiles
