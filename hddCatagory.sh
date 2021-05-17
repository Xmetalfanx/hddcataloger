#!/bin/bash

. configs/variables.cfg
. configs/universal.cfg
. configs/customVids.cfg
. configs/music.cfg

####################################################################
function catalogVideoFiles()
{
    ## Checks for a movies and tvshows dir in the root of the ext. hdd being checked
    universalCheckForDirs "movies" "tvshows"

    universalCheckForDirs "christmas_related"

    universalCheckForDirs "tgc"
    
    # run check for custom vids
    checkForVideoDir
}


catalogVideoFiles

purgeCatalogFilesFromScriptDir