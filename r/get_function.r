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

    func_collapse = paste0(func_list, collapse = "|")

    funcs <- readLines(here(file)) %>%
        str_match(func_collapse)

    funcs[!is.na(funcs)]
}

## Test
## files <- get_files(here("test"))
## func_list <- lapply(files, get_func_list) %>% unlist

## func <- sapply(files, get_function, func_list)
## func

