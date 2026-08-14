# check_for_custom_video_dir Function

- **Main Function** -  Look for a "videos" directiory in the root folder of the drive

- *Directory Structure*:
  - This */videos* dir is for any videos  that are not *movie* or *tvshow* related.
    - (note: i am not totally sure about where to put say "DVD extras", for now)
      - Sept 2025: the fact some dvd extra maybe TV shows and/or some movies makes "where to put them" confusing
  - Subdirectories are searched for and the idea with this is that while, there is a mass catalog file for everything in a root directories "videos" folder,
    - The goal is to is to make things easier with certain sub directories I search for having their OWN catalog file too in additon to it all being listed in a "master /videos catalog file"

- *Code path*
  - 1 - check for the */videos* directory
  - 2 - IF found, create a "master" (all sub-directories i check for later, ARE included) list for the */videos* directory found.
    - this task is done by using the *[universalCheckForDirs](universalCheckForDirs_function.md)* function
      - the same function used already used once by this step for the *movies* and *tvshows* check that happened "first"
  - 3 - Check for "/videos" subdirectories contained in an array, using the *[universal_subdir_check](universal_subdir_check_function.md)* function
    - array I have, for now is:
      - `subDirSearch=("educational" "homevids" "themeparks")`
      - *educational* - includes mainly random tutorials and stuff like that.
        - I THINK I may have put some history related documentary time videos here, but i (note to self should move them to a "history" sub directory later)
      - *homevids* - Home videos
      - *themepark* - Related to various themeparks and should be sub-catagories inside
