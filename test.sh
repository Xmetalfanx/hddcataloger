
function getDirList() {

    # takes dir names you want to check for as arguements... at least ones you'd want to have a sorted sub_catagory files

    for eachDir in "${checkForDir[@]}"
    do


        echo -e "\n Directory Name: $eachDir"
        tree -I "*.nfo|*.jpg|*.png|*.log|*.txt" -P "*.mp3" "$eachDir" > "$eachDir""_Catalog.txt"

        #read -p "Pause"
    done

}
rm *.txt

checkForDir=("Easy Listening" "Jazz" "more")

getDirList $checkForDir

ls *.txt