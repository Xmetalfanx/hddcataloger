#!/bin/bash

. configs/variables.cfg
. configs/universal.cfg
. configs/customVids.cfg
. configs/music.cfg

####################################################################
function catalogVideoFiles()
{
    ## Checks for a movies and tvshows dir in the root of the ext. hdd being checked
    # things here should be in the root folder of the external hdd 
    #universalCheckForDirs "movies" "tvshows" "christmas_related" "tgc"
    
    # run check for custom vids
    checkForVideoDir
}


catalogVideoFiles

purgeCatalogFilesFromScriptDir