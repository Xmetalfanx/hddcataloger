#!/bin/bash
. configs/universal.cfg
. configs/shows_and_movies.cfg
. configs/customVids.cfg

####################################################################
function catalogVideoFiles()
{
    
    checkForDirs "movies" "tvshows" 

    # run check for custom vids

}

catalogVideoFiles
