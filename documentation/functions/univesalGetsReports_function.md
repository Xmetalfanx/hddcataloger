# what happens in the UnivesalGetsReport function

## 1 - Creates detailed report

- Code:

  - `$(tree -I "*.jpg|*.png|*.nfo|*.tbn|*.txt|*.sh" --dirsfirst --prune --du -h -o $detailedOutputFilename $driveRoot/$search)`

  - Explanation
    - **-I**: Ignore
      - ignores jpg, png, nfo, tbn, txt, and sh files in report
        - this is because I am more focussed on the video file itself then what metadata files i have for said video file
    - **--dirsfirst**: Sort directories before files
    - **--prune**: prune out empty directories
    - **--du -h**: prints the dir/folder size next to the dir name
      - _-h_: use a "human readable format"
    - **-o <filename>**: where to output all of this

## 2 - Creates a Summary report

- code/command:

  - `$(tree -d --prune -o $summaryOutputFilename $driveRoot/$search)`

  - Explanation
    - **--prune**: prune out empty directories
    - **-o** for the output file location

  - Comments:
    - say on tvshow directories, this report can list the name and year or whatever of a show, but not all the episodes inside the folder (that'd be for the detailed report, above ... this idea is for easier readability)

## 3 - Calls function to add free space info to end of report files

- **universalOutputFreeSpace** function called and both the summary and detailed file vars, are passed:
  - $summaryOutputFilename $detailedOutputFilename

### universalOutputFreeSpace function

- the detailed and summary file (vars) are passed

```bash

function universalOutputFreeSpace() {

    freespaceLeft=$(df -h /dev/sdb* | grep "/dev/sdb*"| awk ' { print $4 } ')

    # if the freespace line DOESN'T exist (the grep check)
    if ! grep -Fxq "Freespace" $@; then

        for currentCatalogFile in $@
        do
            echo -e "\nFreespace left on drive: $freespaceLeft" >> "$currentCatalogFile"
        done
    fi
}
```

1. Assigns _freespaceLeft_ var to the following code
   - `freespaceLeft=$(df -h /dev/sdb* | grep "/dev/sdb*"| awk ' { print $4 } ')`
  
2. [Outer Loop]

- Check for the "Freespace" related line in the catalog file (as an argument passed)

3. [Inner Loop]

- for as long as there is another catalog file passed, that doesn't have the freespace line (thanks to the first loop), THEN add the Freespace line in the echo statement.