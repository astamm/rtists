## code to prepare `uf_left` dataset goes here

library(riot)
uf_left  <- read_fascicles(system.file("extdata", "UF_left.vtp",  package = "riot"))
usethis::use_data(uf_left, overwrite = TRUE, compress = "xz", version = 3)
