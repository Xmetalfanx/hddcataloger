#!/bin/bash

## This is here so i dont forget the code ... this is to search the COMPLETE dir of cat files

function searchFor()
{
    clear
    echo -e "Search Results for \"$searchTerm\" in $(pwd)"

    grep -irw . --color -e "$searchTerm"
}

clear

read -p "What do you want to search for?:  "  searchTerm
echo -e "\n\nSearch Term: $searchTerm"

searchFor "$searchTerm"