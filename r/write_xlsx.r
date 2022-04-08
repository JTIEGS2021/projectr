## ---------------------------
## Name: write_xlsx
## Purpose: saves the merged current and dbs xlsx data
## Author: Jacob Tiegs
## Date Created: 2022-04-08
##
## ---------------------------
## Notes:
##
##
## ---------------------------
## Packages:

##
## ---------------------------
## Functions:

## ---------------------------

save_xlsx <- function(active, file){
    #print("Save file to:", here(file))
    write.xlsx(active, here(file))
}
