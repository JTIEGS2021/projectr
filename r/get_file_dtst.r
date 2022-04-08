## ---------------------------
## Name: get_file_dtst
## Purpose: Gets the datasets used from the project directory
## Author: Jacob Tiegs
## Date Created: 2022-03-31
##
## ---------------------------
## Notes:
##
##
## ---------------------------
## Packages:
get_file_dtst <- function(dir,
                          include = c("\\.[Rr][Dd][Ss]",
                                       "\\.csv",
                                       "\\.tsv",
                                       "\\.[Xx][Ll][Ss][Xx]",
                                       "\\.sas7bdat"),
                          root = here()) {

    ## 1. Set project root
    ## 2. Set search extension terms
    ## p_root <- here()
    ## include <- c("\\.[Rr][Dd][Ss]",
    ##              "\\.csv",
    ##              "\\.tsv",
    ##              "\\.[Xx][Ll][Ss][Xx]",
    ##              "\\.sas7bdat")

    ## exclude <- c()
    ## Get list of files
    files <- list.files(dir,
                        recursive = TRUE,
                        full.names = TRUE)

    ## Subset by Incldue
    include_files <-files[grepl(paste0(include, collapse = "|"),
                             files)]

    ## exclude_files <- include_files[!grepl(paste0(exclude, collapse = "|"),
    ##                                      include_files)]

    ## Clean file name
    p_files <- gsub(root, "", include_files) %>%
        gsub("^\\/", "",.)

    p_files
}


## test
## write_csv(data.frame(x), here("test/dat/test.csv"))
## write_rds(x, here("test/dat/test.rds"))
## write_xlsx(data.frame(x), here("test/test.xlsx"))

## files <- get_file_dtst("test")
## files


