## <<c this is a coment c>>
dtst <- tibble(x = rnorm(10), y = rnorm(10), z = rnorm(10))
## <<c this is a second comment c>>

dtst$x[1] <- NA
dtst$y[1] <- 1
dtst$z[2] <- NA
dtst$z[3] <- ""
dtst$x[4] <- NA

dtst

write_csv(data.frame(dtst), here("test/dat/test.csv"))
write_rds(dtst, here("test/dat/test.rds"))
write_xlsx(data.frame(dtst), here("test/test.xlsx"))






test_func <- function(x = 1) {
    x
}

