#!/bin/bash

# display free space tv_shows catalog files 
    # remember i dont need the tvShows_detailed here ... 
    # as long as they were cataloged the same day, the summary file is fine ot use 

# display free space movies 


## THESE ONLY GET THE FILE NAMES ... do i need the full path?  just leaving off the -exec base... part get the paths? 
# to get TV Show cat filenames: find . -iname "*tvshows*Summary*" -exec basename {} \;
# to get movies cat filenames: find . -iname "*movies*Summary*" -exec basename {} \;
 
# find . -iname "*movies*Summary*"  -exec grep "freespace" {} \;   outputs what i need BUT it doesn't have the filename in the line 
# i can update the script to show the filename when i MAKE new catagory files later but how can i add that here ?

#######################################################




# Idea: to combine the two var declarations below 
function summaryFile()
{
    $summaryFile=$(find . -iname "*'$1'*Summary*";)
    
    echo -e "$summaryFile"
    echo 


}

movies_SummaryFiles=$(find . -iname "*movies*Summary*";)
tvshow_SummaryFiles=$(find . -iname "*tvshows*Summary*";)

# keep 
#summaryFile "movies"
#summaryFile "tvshows"


function displayFreespace(){
    echo -e "Inside test Function "
    #echo -e "${tvshow_SummaryFiles[@]}"

    for results in $tvshow_SummaryFiles[@]
    do
        catagoryFilenameOnly=$(basename $results );
        echo -e "\n$catagoryFilenameOnly"
        
        cat $results | grep "freespace"

    done 

}

displayFreespace 
