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



get_func_list <- function(file) {
    func <- readLines(here(file)) %>%
        str_subset("function") %>%
        gsub("^(.*) <.*", "\\1", .)

    func
}


## ##
## files <- get_files(here("test"))
## funcs <- lapply(files, get_func_list)
## funcs
