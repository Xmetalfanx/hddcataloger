#!/bin/bash

getFreeSpaceReport(){
    
    # sort -V: human readable numbers (10 will not be above "7" due to the "1" )

    # sed info source: https://stackoverflow.com/questions/32084533/how-to-match-until-the-last-occurrence-of-a-character-in-bash-shell
    ## 
    grep -irw . --color -e "Freespace left on drive" | sed 's/\(.*\)\///g' | awk -F: '/hdd/ {print $1 "\t" $3}' | sort -V | uniq

}

getFreeSpaceReport