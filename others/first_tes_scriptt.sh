#!/bin/bash

for dir in */; do
	echo "$dir"
done
read -p "hit any key"
clear
######################################################

## idea ... testVar here looks for files in a dir based on things ... could (vs using if statements) use another find inside
## of the search function

testVar=$(find . -iname "*.cfg" -printf '%f\n')

####################################################

# Search function idea 
function searchPatternIF()
{
    if [[ $1 == *"Vids"* ]]; then
        echo -e "Yay"
    else
        echo -e "aww :("
    fi
}

function searchPatternFind()
{
    

}


################################################
# Loop through files in the dir 
for var in $testVar
do
   searchPattern $var 

done 

#########
# This looks good ... I need to know what subdir section i am in so i know what sort function to trigger 