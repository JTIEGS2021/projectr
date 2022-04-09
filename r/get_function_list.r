## ---------------------------
## Name: get_function_list
## Purpose: Return list of created functions
## Author: Jacob Tiegs
## Date Created: 2022-03-31
##
## ---------------------------
## Notes:
##
##
## ---------------------------

get_split <- function(x){
    split =  str_split(x, "<-")
    elem =  sapply(split, "[", 1)
    elem = gsub("##","", elem)
    elem = str_trim(elem, side = c("both"))
}


get_func_list <- function(file) {
    func <- tryCatch({
        if(file != "r/get_function_list.r") {
            func <- readLines(here(file)) %>%
                str_subset("<- function") %>%
                get_split()
            return(func)
        }
    },
    error = function(c){
        message("Error: get_funcction_list.r")
        message(c)
    })
    func
}


## ##
## files <- get_files(here("test"))
## funcs <- lapply(files, get_func_list)
## funcs
