## ---------------------------
## Name: get_files
## Purpose: Returns project files
## Author: Jacob Tiegs
## Date Created: 2022-03-30
##
## ---------------------------
## Notes: Looks for .r .Rmd .sas .sh files
##
##
## ---------------------------
##
## ---------------------------
## Functions:

## ---------------------------


## Get list of files
get_files <- function(dir,
                      include =  c("\\.r",
                                   "\\.Rmd",
                                   "\\.sas",
                                   "\\.sh"),
                      exclude =  c("~",
                                   "#",
                                   "[Rr][Dd][Ss]"),
                      root = here()) {

    ## 1. Set project root
    ## 2. Set search extension terms
    ## p_root <- here()
    ## include <- c("\\.r",
    ##          "\\.Rmd",
    ##          "\\.sas",
    ##          "\\.sh")
    ## exclude <- c("~",
    ##              "#",
    ##              "[Rr][Dd][Ss]")

    files <- list.files(dir,
                        recursive = TRUE,
                        full.names = TRUE)

    include_files <-files[grepl(paste0(include, collapse = "|"),
                             files)]

    exclude_files <- include_files[!grepl(paste0(exclude, collapse = "|"),
                                         include_files)]

    p_files <- gsub(root, "", exclude_files) %>%
        gsub("^\\/", "",.)

    p_files
}


## Test
## f <- get_files(here("test"))
## f
