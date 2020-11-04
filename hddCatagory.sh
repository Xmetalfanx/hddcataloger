#!/bin/bash
. configs/universal.cfg
. configs/shows_and_movies.cfg
. configs/customVids.cfg
. configs/music.cfg

####################################################################
function catalogVideoFiles()
{
    
    #checkForDirs "movies" "tvshows" 

    # run check for custom vids
    checkForMoreVids
}

#catalogVideoFiles

reportMusicDirs $othersDir 
#$rockDir $rapDir