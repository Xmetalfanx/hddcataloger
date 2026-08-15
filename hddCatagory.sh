#!/bin/bash

# loading config files


echo "Loading config files"

. configs/includes.cfg


#clear
####################################################################

# Checks the tvshow, movies, and /videos dir
# location: configs/cataloging.cfg
catalog_video_files

# checks for non-movie and non-tvshow root level items "Christmas Related" (name not exact in code) and "tgc" that have different SORTS of content inside
# location: configs/cataloging.cfg
catalog_multi_root

# Checks for music directories
# location:  configs/universal.cfg
# catalog_music_files


# Moved here to stop this from being run each pass through a check if a dir exists
# this should target any catalog files in the script folder
# ALSO i can probably put the purge code inside here now (once done right) so there is no need for another function
# Function call to copy reports
universalCopyReportFiles
