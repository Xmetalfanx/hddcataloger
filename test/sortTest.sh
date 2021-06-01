#!/bin/bash

function sortTopLevel()
{
    # May not be the best way but the idea is to NOT create the dirs if there are none of those catalog files on that drive ... the problem i see already is that .... it DOES create empty dirs 
    
    #This code SEEMS redundent ... 

    # I NEED TO MAKE SURE that stuff IN the christmas or tgc dirs doesn't get sorted into other folders ... these two top levels should be sorted first
    find ./ -type f -iname "*christmas*" && mkdir christmasCatalogs && mv *christmas* -t christmasCatalogs 
    find ./ -type f -iname "*tgc*" && mkdir tgcCatalogs && mv *tgc* -t tgcCatalogs
    find ./ -type f -iname "*videos*" && mkdir customVideosCatalogs && mv *videos* -t customVideosCatalogs
    

    # there is no reason Music should be in caps ... fix that for consistancy 
    find ./ -type f -iname "*Music*" && mkdir musicRelatedCatalog && mv *Music* -t musicRelatedCatalog
    find ./ -type f -iname "*tvshows*" && mkdir tvshowsCatalogs && mv *tvshows* -t tvshowsCatalogs
    find ./ -type f -iname "*movies*" && mkdir moviesCatalogs && mv *movies* -t moviesCatalogs

}

# ?? where am i calling this from? 
function sortSubCatagoryFiles() {
    subSortTerm=$1

    #sortDestination


}

function sortTopLevelLoop() {
    
    for eachTopLevelCatPresent in $@
    {
        # where to put the sorted catagory files IF found 
        # This is a folder name
        sortDestination=$eachTopLevelCatPresent"_Catalogs"
        
        search4CatFiles=$(ls *$eachTopLevelCatPresent*.txt 2>/dev/null)

        [ ! -d $sortDestination ] && mkdir $sortDestination


        for eachMainCatFileFound in ${search4CatFiles[@]};
        do 
            # changed to cp for testing 
            # mv when done 
            mv $eachMainCatFileFound -t $sortDestination 

            # ?? call sub-sorting here? 
        done 
         
    }
    

}

sortTopLevelLoop "movies" "tvshows" "christmas" "Music"