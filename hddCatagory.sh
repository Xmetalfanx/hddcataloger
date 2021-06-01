#!/bin/bash

. configs/variables.cfg
. configs/universal.cfg
. configs/customVids.cfg
. configs/subDirSearches.cfg
. configs/music.cfg

#clear
####################################################################
function catalogMusicFiles()
{
    clear
    echo -e "Checking for Music files"
    # if the music dir exists ... the echo here is sort of a test and can be removed later 
    [ -d "$musicDir" ] && mainGenreCheck
}

# not really needed but for the "root folders" that have audio and video files INSIDE
function catalogMultiRoot()
{
    clear 
    echo -e "Checking for Christmas and TGC related content"

    universalCheckForDirs "christmas_related" "tgc"
}

function catalogVideoFiles()
{
    clear
    echo -e "Checking for Video Directories"

    ## Checks for a movies and tvshows dir in the root of the ext. hdd being checked
    # things here should be in the root folder of the external hdd 
    universalCheckForDirs "movies" "tvshows"

    # run check for custom vids
    checkForVideoDir
}

# Checks the tvshow, movies, and /videos dir
catalogVideoFiles

# checks for non-movie and non-tvshow root level items "Christmas Related" (name not exact in code) and "tgc" that have different SORTS of content inside 
catalogMultiRoot

# Checks for music directories
catalogMusicFiles

# Moved here to stop this from being run each pass through a check if a dir exists
# this should target any catalog files in the script folder
# ALSO i can probably put the purge code inside here now (once done right) so there is no need for another function
# Function call to copy reports
universalCopyReportFiles
