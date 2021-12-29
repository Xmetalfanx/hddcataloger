#!/bin/bash

getFreeSpaceReport(){
    
    driveName=$(grep -irw . -e "Freespace left on drive" | awk -F/ '/.hdd./ {print $2}' |  awk '/^hdd/' | sort -V | uniq)

    # sort -V: human readable numbers (10 will not be above "7" due to the "1" )

    # sed info source: https://stackoverflow.com/questions/32084533/how-to-match-until-the-last-occurrence-of-a-character-in-bash-shell


    # for eachDrive in $driveName
    # do
    #     echo -e "eachDrive: $eachDrive"
    #     #grep -irw . -e "Freespace left on drive" | awk '/Freespace left on drive/ && ! /freespaceReport.sh:/ {print $1 "\t" $2}' | sort -V | uniq 

    #     # sed 's/\(.*\)//\/' - match until last forward slash aka / 

    #     currentDrive=$(grep -irw . -e "Freespace left on drive" | awk -F/ '/^.\/[hH]dd/ {print $2}' | sort -V | uniq)

    #     ##############################################################################################
    #     #grep -irw . -e "Freespace left on drive" | awk '/$currentDrive == $eachDrive/ {print}' | sed 's/\(.*\)\///' | sort -V

    #     grep -irw . -e "Freespace left on drive" | awk -v currentDrive="$currentDrive" '/currentDrive/ {print "\n"}'  

    #     # idea 
    #     #sed 's/left on drive//;s/[Summary|Detailed]_Catalog//'


    # done 

        driveList=$(grep -irw . -e "Freespace left on drive" | awk -F/ '/^.\/[hH]dd/ {print $2}' | sort -V | uniq)
        

        for currentDrive in $driveList
        do 
            
            freeSpaceAmount=$(grep -irw . -e "Freespace left on drive" | awk -v currentDrive="$currentDrive" -F/ '/^.\/[hH]dd/ && $2 ~ currentDrive {print}' | sed 's/^.* //' | uniq )
            echo -e "$currentDrive \t$freeSpaceAmount\n"
        done 

        ##############################################################################################
        #grep -irw . -e "Freespace left on drive" | awk '/$currentDrive == $eachDrive/ {print}' | sed 's/\(.*\)\///' | sort -V

        #grep -irw . -e "Freespace left on drive" | awk -v currentDrive="$currentDrive" '/currentDrive/ {print "\n"}'  

}

getFreeSpaceReport