#!/bin/bash

. configs/variables.cfg
. configs/universal.cfg
. configs/customVids.cfg
. configs/music.cfg

####################################################################
function catalogVideoFiles()
{
    ## Checks for a movies and tvshows dir in the root of the ext. hdd being checked
    universalCheckForDirs "movies" "tvshows" "christmasMovies"

    # run check for custom vids
    #checkForVideoDir
}

catalogVideoFiles

# remove any cat files in the script dir
echo -e "\n Removing catalog files in the script directory"
rm *.txt