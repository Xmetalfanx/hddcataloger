# Cataloging scripts

## Intial setup

1. ?? how am i detecting the drive again?

- these are ideas (order wise), in this section atm

1. Setup locations for report files
   1. Detect the drive (if "exists" )
    - Check for local catalog location (does it exist?)
      - [if it DOESN'T exist] create it
    - Check for "report" files on the drive itself in the root level
      - [if exists]
        - move to a backup (on drive?) location?
        - remove it? (i think move, then purge maybe later, is best "just in case)
    - Do the Scans (below)

## Scans

### Audiobooks and Podcasts

- (this is a new idea)
- scan for **/audiobooks_or_podcasts**
  - if in /music, that content should be moved to a root level location
  - there should (still an idea now) /audiobooks_or_podcasts/audiobooks and a /audiobooks_or_podcasts/podcasts sub-directories

### Music

- scan for **/music**
  - scan for */music/others*
    - This will need some sub-catagorizing
    - scan for */music/others/classical*
    - scan for */music/others/easy_listening*
    - scan for */music/others/jazz*
    - scan for */music/others/more*
  - scan for */music/rap*
  - scan for */music/rock*
    - ? Do i want to have JUST one massive Rock catalog file
    - ? OR one big file and a few smaller ones based on name (last name if person, and not a band)

### Movies

- scan for */movies* and catalog
- IDEA: Tiny Media Manager at least can do MOVIE SETS ... how can i add that and have sets organized but still cataloged?
  - also remember "collection" (i think) is at the end of the name

### TV Shows

- scan for "tvshows" (if spelled any other way, rename on the drive)

### the_great_courses (The Great Course/"The Teaching Company")

- original idea
  - scan for "the_great_courses" in the drive's root
    - layout info:
      - /the_great_courses/audio/<course_name>/
      - /the_great_courses/video/<course_name>/
      - NOT ORGANIZED like .. (though it can make sense this way too.. actually do i want to do it "this way"? ..)
        - /the_great_courses/<course_name>/audio
        - /the_great_courses/<course_name>/audio
- "new" idea (backwards, from above)
  - scan for "the_great_courses" in the drive's root
  - layout info:
    - /the_great_courses/<course_name>/audio
    - /the_great_courses/<course_name>/audio

### Custom Vids scan

- ? Where should i put "homevids".. thinking in /videos/homevids... may not be as good as /homevids, for clariity reasons

- inside */videos* inside of drive's root

- sub-directories to scan for:
  - educational
    - terminal
    - programming/scripting
    - ?? (placement here) jason_gibson
  - gameplay
    - Dashie
    - GTA
    - garrys_mod
    - kruz
    - sweattails
  - music_videos
  - scenic
  - themepark

---

I think tgc (The Great courses) and homevids being in the drive's ROOT folder would be "better"