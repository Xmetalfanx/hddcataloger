#!/bin/bash

# loading config files 
. configs/variables.cfg
. configs/universal.cfg
. configs/customVids.cfg
. configs/subDirSearches.cfg
. configs/music.cfg

#clear
####################################################################

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
