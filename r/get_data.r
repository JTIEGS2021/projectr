## ---------------------------
## Name: get data
## Purpose: Get all of the data components and compile as RDS
## Author: Jacob Tiegs
## Date Created: 2022-03-31
##
## ---------------------------
## Notes:
##
##
## ---------------------------

get_data <- function(file_list, dtst_list) {
    ## Set search lists
    files <- file_list
    dtst_obj <- dtst_list
    func_list <- lapply(files, get_func_list) %>% unlist

    ## Get search datasets
    dtst_int <- lapply(files, get_internal_dtsts)
    comments <- lapply(files, get_comments)
    func <- lapply(files, get_function, func_list)

    ## Apply Names
    names(dtst_int) <- files
    names(comments) <- files
    names(func) <- files

    ## Get dtst data
    names(dtst_obj) <- dtst_obj
    meta <- lapply(dtst_obj, get_dtst_meta) %>% bind_rows(.id = "dtst")

    ## Bind rows
    data <- list(
        dtst_int = bind_rows(dtst_int, .id = "file") %>%
            rename(datasets = value),
        comments = bind_rows(lapply(comments, as_tibble), .id = "file") %>%
            rename(comments = value),
        func = bind_rows(lapply(func, as_tibble), .id = "file") %>%
            rename(functions = value),
        dtst_meta = meta
    )


    data
}



