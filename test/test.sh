
function sortCatalogs() {
    # $1 search term passed 
    
    sortResults = $(s "$1.txt")

    for eachResult in $sortResults
    {
        echo -e "$eachResult"
    }
}