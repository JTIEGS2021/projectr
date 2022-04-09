## ---------------------------
## Name: get_function
## Purpose: Return internally defined functions
## Author: Jacob Tiegs
## Date Created: 2022-03-31
##
## ---------------------------
## Notes:
##
##
## ---------------------------


get_function <- function(file,
                         func_list){
    funcs = tryCatch({
        func_collapse = paste0(func_list, collapse = "|") %>% str_replace('\\"', "")
        funcs <- readLines(here(file)) %>%
            str_match(func_collapse)
        funcs = funcs[!is.na(funcs)]
        funcs},
        error = function(c){
            message("Error: get_function.r")
            message(c)
        })
    funcs
}

## Test
## files <- get_files(here("test"))
## func_list <- lapply(files, get_func_list) %>% unlist

## func <- sapply(files, get_function, func_list)
## func

