# What happens when you run the script

## 1 - [Read in Variables](/documentation/variables.md)

## 2 - *catalogVideoFiles* function

### universalCheckForDirs function

- dev doc note to self: MAKE this section more generic so i can reference it elsewhere when other arguments are passed to it
  - This function mentioned is used elsewhere in the script too, meaning it's NOT meant for only the main "tvshow" or "movies" check

- This function looks for the arguments passed (exactly as they are typed, case and all ) in the root folder of the drive
  - IF found a variable for a filename is created that will store the "catalog" made from a *tree* command, later
  - Passes to [*universalGetReports* function](/documentation/univesalGetsReports_function.md)

### 1 - Video check for Movies or TV Shows - using *universalCheckForDirs* function

### 2 - *checkForVideoDir* function

- **Main Function** -  Look for a "videos" directiory in the root folder of the drive

- *Directory Structure*:
  - This *videos* dir is for any videos (note: i am not totally sure about where to put say "DVD extras", for now) that are not *movie* or *tvshow* related.
  - Subdirectories are searched for and the idea with this is that while I remember creating a "videos" mass catalog file for everything in a root directories "videos" folder,
    - goal: these sub-directories I search for will make seperate "sub catagory" files that are easy to search through

- *Code path*
  - 1 - check for the */videos* directory
    - (if it's not there, there is no point to any of this other code)
  - 2 - IF found, create a "master" (all sub-directories i check for later, ARE included) list for the */videos* directory found.
    - this catalog file may be large and messy to read
    - this task is done by using the *universalCheckForDirs* function that was already used once by this step for the *movies* and *tvshows* check
  - 3 - Check for subdirectories contained in an array, using the *universalSubdirCheck* function
    - array I have, for now is:
      - `subDirSearch=("educational" "homevids" "themeparks")`
