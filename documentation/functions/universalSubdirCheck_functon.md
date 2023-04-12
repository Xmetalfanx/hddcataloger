# The universalSubdirCheck function

- Uses a for loop to go through each element in the array passed
  - each element is a sub directory being searched for

  - 1 - Create a variable for a file name that will contain the results of the sub directory search
    - The idea is that this will be easy to search through on larger sub directories than that prior mentioned "master /video catalog file"

function universalSubdirCheck() {

    # subdirSearch = array passed

    # subDir: each element in the array
    for subDir in "${subDirSearch[@]}";
    do
        currentsubDirOutputFile="$driveLabel"_"$currentDate"_"$sectionTitle"_"$subDir"_Summary.txt
        case $dirLevel in

            "root")
                subDirLocation="$subDir"
                [ -d $subDirLocation ] && echo -e "$sectionTitle - $subDir DIR found" && subDirReports $subDir  ;;

            "customVids")
                subDirLocation="$customVidsDir/$subDir"
                [ -d $subDirLocation ] && echo -e "$sectionTitle - $subDir DIR found" && subDirReports $subDir ;;

            *) echo -e "dirLevel variable not set/set correctly"

        esac
    done
}
