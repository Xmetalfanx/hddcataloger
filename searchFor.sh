#!/bin/bash

## This is here so i dont forget the code ... this is to search the COMPLETE dir of cat files

function searchFor()
{
    clear
    echo -e "Search Results for \"$searchTerm\" in $(pwd)"

    ###########################################################
    # grep 
    # -i, --ignore-case         ignore case distinctions in patterns and data
      ## --no-ignore-case      do not ignore case distinctions (default)
    # d-r, --recursive           like --directories=recurse
    # -w, --word-regexp         match only whole words
    ##############################################################

    ################################################################
    ## sort 
    # -b: ignore leading blank's 
    # -f: ignore cases 

    #######################################################################
    
    
    grep -irw -m 1 . --color -e "$searchTerm" | sort -bf
}

clear

read -p "What do you want to search for?:  "  searchTerm
echo -e "\n\nSearch Term: $searchTerm"

searchFor "$searchTerm"