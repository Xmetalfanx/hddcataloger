# Hard drive catagorizing scripts

## What happens when you run the script

## 1 - [Read in Variables](variables.md)

## 2 - *catalogVideoFiles* function runs

- Check for movies and/or tv shows - using *[universalCheckForDirs](functions/universalCheckForDirs_function.md)* function

- *[checkForVideoDir](functions/checkforVideoDir_function.md)* function runs, checking for */videos* folder in the root of the target drive

## 3 - catalogMultiRoot function, ran

- This checks for *"christmas"* and TGC "The Great Courses" directories IN the target drive's root location.
  - *christmas* contains various content ... music, movies, wallpapers etc
  - *note to self*: despite overlap with a potention "history" sub directory, in "/videos" that may be created later (history content not related to TGC would be in the "educational" sub-directory now).... KEEP ALL TGC content here and not in that sub directory ... just for organization it keeps things neater if i forget if i mixed the content ... I may "waste" space by having like 5+ backups of the same thing  if i am unorganized
- function used:
  - [universalCheckForDirs](functions/universalCheckForDirs_function.md)

## 4 - catalogMusicFiles

- functions used:
  - [musicRootDirCheck](functions/musicRootDirCheck_function.md)
  - [musicSubDirCheck](functions/musicSubDirCheck_function.md)

- Checks for a */music* folder in the target drive's root location
  - if found, the *mainDirMusicCheck* function is ran
    1. Checks for */music/others* directory
       - If found, uses the *otherSubDir* array to check for sub-directories inside
       - function:
         - *musicSubDirCheck*
       - *otherSubDir array (for now):
         - `othersSubDirs=("$classicalDir" "$jazzDir" "$moreDir" "$OTRDir")`
         - Classical Music Directory, Jazz Directory, OTR (Old Time Radio Shows) Directory
