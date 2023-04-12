# musicRootDirCheck_function

```bash
# the name of the function seems ok BUT ... it seems like the purpose of the function is the same as what is right below (function below )
# I THINK this was suppose to be for the main (Rock. others) "root" level checking 
function musicRootDirCheck() {

    # what gets passed here IS a full path 
    mainDirFullPath="$@"

    # ?? will the in part of this and the var above get the ARRAY? 
        # I think my thinking was that i could pass various "main music folder" paths to this at a single time 
    for eachMainDirPath in "${mainDirFullPath}"
    do
        # if this doesnt exist, what's the point of going further 
        [ ! -d "${eachDirPath}" ] && echo -e "${eachMainDirPath} not found" && return 
        
        # the name of the main dir being searched for.  I was going to have "genre" in var names here
            # HOWEVER, this info may not always be a genre 
        eachMainDirName=$(basename ${eachMainDirPath})

        # File to store current ("current", in for loop) main Dir "Catalog file"
        # the idea here is to have a "master" catalog file of these main dirs ... sub sorting and whatnot is done later, IF needed
        musicRootOutputFile=${driveLabel}"_"${currentDate}"_"${eachMainDirPath}"_music_MASTER_catalog.txt"

        # this check for and sets up (if not there) locations in $HOME and/or the target drive to STORE the catalog files 
        setupCatagoryDir

        # if the mainDir path DOES exist create (after letting the user know the dir was found) the catalog file
        [ -d ${eachMainDirPath} ] && clear && echo -e "${eachMainDirPath} directory was found" && tree --dirsfirst -n -P "*.mp3" ${eachMainDirPath} -o  "${musicRootOutputFile}"

        # April 2023: ?? ok but where is the catalog file PATH here? 
    done
}
```
