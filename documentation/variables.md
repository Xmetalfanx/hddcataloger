# Known variables

## General

- `currentDate=$(date +"%B_%d_%Y")`
  - example output: October_24_2020

### Drive related variables

```
driveRoot=$(lsblk /dev/sdb | awk '/part/  { print $7 } ')
driveLabel=$(basename $driveRoot)
```

### For where to store the created catalog files

```
catalogHomeDir="$HOME/Documents/Catalog/"
hddCatalogDir="$driveRoot/Catalogs"
```

## Music variables

```
music_main_dir="$driveRoot/music"
musicCatalogDir="$music_main_dir/catalog"
```

- Comments:
  - For *musicCatalogDir*, I think my idea was to have a dir to store the catagory files to keep things clean and not have a ton of catagory files in different dirs

### Genre related variables

```
rockDir="$music_main_dir/Rock"
rockSubDirs=("$rockDir/AtoG" "$rockDir/HtoN" "$rockDir/OtoZ" )

rapDir="$music_main_dir/Rap"
othersDir="$music_main_dir/Others"
classicalDir="$othersDir/Classical"
jazzDir="$othersDir/Jazz"
moreDir="$othersDir/more"
OTRDir="$othersDir/OTR"
relaxingDir="$othersDir/Relaxing"

othersSubDirs=("$classicalDir" "$jazzDir" "$moreDir" "$OTRDir")

```
- note: with so many Rock related mp3s I sub-divided my collection Alphabetically (based on band name or say an artist's LAST name )

### Video Related variables

```
# this would be in the root folder to make it easier to see
christmasRelatedDir="$dirRoot/christmasRelated"

custom_vids_dir="$driveRoot/videos"

homevidsDir="$custom_vids_dir/homevids"
themeparkDir="$custom_vids_dir/themeparks"
educationalDir="$custom_vids_dir/educational"
TheGreatCoursesDir="$educationalDir/tgc"
JGibsonDir="$educationalDir/jasongibson"
```
