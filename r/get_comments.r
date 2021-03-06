## ---------------------------
## Name: search_files
## Purpose: Search the files select
## Author: Jacob Tiegs
## Date Created: 2022-03-30
##
## ---------------------------
## Notes:
## start comment flag: <<c
## end comment flag c>>
##
## ---------------------------
## Packages:
##
## ---------------------------
## Functions
## ---------------------------

## Set replace characters
replace <- c("<<c",
             "c>>",
             "## ",
             "```")


## get comments
## 1. Read and collapse lines into single string
## 2. Exctract comments
## 3. Clean up comments
get_comments <- function(file,
                         replace = c("<<c",
                                     "c>>",
                                     "## ",
                                     "```")
                         ){
    file <- tryCatch({
        readLines(here(file)) %>%
            paste0(collapse = "|") %>%
            str_extract_all(regex("<<c.*?c>>")) %>%
            unlist() %>%
            str_replace_all(paste0(replace, collapse = "|"),"") %>%
            str_trim() %>%
            str_replace_all("\\|", "\n")},
        error = function(c){
            message("Error: get_comments.r")
            message(c)
        })
    file
    }



## Test
## files <- get_files(here("test"))
## comments <- lapply(files, get_comments)
## comments
