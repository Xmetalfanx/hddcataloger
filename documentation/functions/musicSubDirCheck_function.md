# musicSubDirCheck_function

```

# function that is passed an array of sub dirs from, the root /music dir 
function musicSubDirCheck() {

    # "as long as there is another subdir to check for"
    for subDirCheckFullPath in "${@}";  do


        
        [ ! -d "${subDirCheckFullPath}" ] && echo -e "\n$subDirCheckFullPath directory, not found" && return 

            
        read -p "${subDirCheckFullPath} dir found"

        # i dont want to use "genre" in the var name in case the name of the nested folder is not a genre
        currentSubCheck=$(basename ${subDirCheckFullPath})

        # subDir Report file name (NO PATH)
        music_subDirReports=$driveLabel"_"$currentDate"_"$eachMainDir"_"$currentSubCheck"_music_Catalog.txt"

        # match those files with mp3 ext (-P "*.mp3").... i think i should include opus (?) or some other files i have that i converted to mp3 (format name is escaping me atm)
        tree -P "*.mp3" --dirsfirst $subDirCheckFullPath -o "$music_subDirReports" >/dev/null

    done
    
}


```