usethis::use_tidy_description()

source("dev/compile_sass.R")

devtools::document()

rcmdcheck::rcmdcheck() # testthat
lintr::lint_package()

devtools::build()
