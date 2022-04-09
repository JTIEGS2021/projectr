## ---------------------------
## Name: get dtst meta
## Purpose: Returns the meta data for any given dataset
## Author: Jacob Tiegs
## Date Created: 2022-03-31
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




get_dtst_meta <- function(dtst) {
    ## Define missing function
    missing <- function(x){
        missing = x[x == ""] %>% length
        missing
    }

    ## Load dtst with try catch
    dtst1 <- tryCatch(
    {
        if(str_detect(dtst, "csv|tsv")){
            dtst_o = read_csv(here(dtst), show_col_types = FALSE)
        } else if(str_detect(dtst, "xlsx")) {
            dtst_o = read_xlsx(here(dtst))
        } else if(str_detect(dtst, "sas7bdat")) {
            dtst_o = read_sas(here(dtst))
        }

        ## switch variable name (fix later)
        dtst1 <- dtst_o

        ## Get values
        l_nrow <- dtst1 %>% nrow
        l_names <- dtst1 %>% names
        type <- sapply(dtst1, class)
        l_na <- sapply(dtst1, function(x) missing(x))
        ## mod <- file.mtime(here(dtst))

        ## Combine values in df
        meta_dtst <- tibble(## modify_date = mod,
                            nrow = rep(dtst1 %>% nrow, length(l_names)),
                            var = l_names,
                            class = type,
                            missing = l_na,
                            )

        ## Get top values of each variable
        top_val <- lapply(dtst1, function(x){
            x %>%
                th(head = TRUE) %>%
                rename(val = var)
        }) %>% bind_rows(.id = "var")

        ## Output
        out <- meta_dtst %>% left_join(top_val, by = "var")
        out

    },
    error = function(cond){
        message("Error: get_dtst_meta.r")
        message(paste("File extension not supported, file overview not possible: ",
                      dtst))
        message(c)
    }
    )
    dtst1


}

## ## ## Test
## dtsts <- get_file_dtst(here("test"))
## dtsts

##  names(dtsts) <- dtsts
##  names(dtsts)
## meta <- lapply(dtsts, get_dtst_meta) %>% bind_rows(.id = "dtst")
## meta

## ## meta$`test/dat/test.csv`$meta
