# musicSubDirCheck_function

```bash

# function that is passed an array of sub dirs from (for now i know it works ... not sure about nested things) the root /music dir 
function musicSubDirCheck() {

    # "as long as there is another subdir to check for"
    for subDirCheckFullPath in "${@}";  do

        # IF the currently passed subdir (checking for) ACTUALLY EXISTS 
        if [ -d "${subDirCheckFullPath}" ]; then

           
            read -p "${subDirCheckFullPath} dir found"

            # i dont want to use "genre" in the var name in case the name of the nested folder is not a genre
            currentSubCheck=$(basename ${subDirCheckFullPath})

            music_subDirReports=$driveLabel"_"$currentDate"_"$eachMainDir"_"$currentSubCheck"_music_Catalog.txt"

            tree -P "*.mp3" --dirsfirst $subDirCheckFullPath -o "$music_subDirReports" >/dev/null

        else
            echo -e "\n$subDirCheckFullPath directory, not found"

        fi

    done
    
}


```