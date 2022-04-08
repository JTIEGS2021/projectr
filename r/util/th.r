## ---------------------------
## Name: TH
## Purpose: Table header function for dtst reporting
## Author: Jacob Tiegs
## Date Created: 2022-04-03
##
## ---------------------------
## Notes:
##
##
## ---------------------------
## Packages:
## ---------------------------
## Functions:

## ---------------------------

## <<c th: Returns the top values of a dataset c>>
th <- function(var, head = F, space = F) {
    if(space == TRUE) {
        o <- as_tibble(table(var, useNA = "always")) %>%
            mutate(var = str_replace_all(var," ","")) %>%
            arrange(desc(n))
    } else {
        o <- as_tibble(table(var, useNA = "always")) %>%
            arrange(desc(n))
    }
    if(head == TRUE) {
        head(o)
    } else o
}

## <<c tht: Returns the top values of a dataset from dplyr flow c>>
tht <- function(dtst, var) {
    dtst %>%
        ungroup() %>%
        select({{var}}) %>%
        th()
}
