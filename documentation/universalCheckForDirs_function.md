# universalCheckForDirs function

- *dev doc note to self*: 
  - MAKE this section more generic so i can reference it elsewhere when other arguments are passed to it
  - This function mentioned is used elsewhere in the script too, meaning it's NOT meant **only** the main "tvshow" or "movies" check
  
- **What this function does**:
  - This function looks for the arguments passed (exactly as they are typed, case and all ) in the root folder of the drive
  - IF found a variable for a filename is created that will store the "catalog" made from a *tree* command, later
  - Passes to [*universalGetReports* function](/documentation/univesalGetsReports_function.md)
