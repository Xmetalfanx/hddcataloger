# Known variables

## General

- `currentDate=$(date +"%B_%d_%Y")`
  - example output: October_24_2020

### Drive related variables

```bash
driveRoot=$(lsblk /dev/sdb | awk '/part/  { print $7 } ')
driveLabel=$(basename $driveRoot)
```

### For where to store the created catalog files

```bash
catalogHomeDir="$HOME/Documents/Catalog/"`
localCatalogDir="$HOME/Documents/Catalog/"
hddCatalogDir="$driveRoot/Catalogs"
```

## Music variables

```bash
musicDir="$driveRoot/music"
musicCatalogDir="$musicDir/catalog"
```

- Comments:
  - For *musicCatalogDir*, I think my idea was to have a dir to store the catagory files to keep things clean and not have a ton of catagory files in different dirs

### Genre related variables

```bash
rockDir="$musicDir/Rock"
rockSubDirs=("$rockDir/AtoG" "$rockDir/HtoN" "$rockDir/OtoZ" )

rapDir="$musicDir/Rap"
othersDir="$musicDir/Others"
classicalDir="$othersDir/Classical"
jazzDir="$othersDir/Jazz"
moreDir="$othersDir/more"
OTRDir="$othersDir/OTR"
relaxingDir="$othersDir/Relaxing"

othersSubDirs=("$classicalDir" "$jazzDir" "$moreDir" "$OTRDir")

```
- note: with so many Rock related mp3s I sub-divided my collection Alphabetically (based on band name or say an artist's LAST name )

### Video Related variables

```bash
# this would be in the root folder to make it easier to see
christmasRelatedDir="$dirRoot/christmasRelated"

customVidsDir="$driveRoot/videos"

homevidsDir="$customVidsDir/homevids"
themeparkDir="$customVidsDir/themeparks"
educationalDir="$customVidsDir/educational"
TheGreatCoursesDir="$educationalDir/tgc"
JGibsonDir="$educationalDir/jasongibson"
```
