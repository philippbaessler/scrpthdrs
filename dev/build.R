usethis::use_tidy_description()

rcmdcheck::rcmdcheck() # testthat
lintr::lint_package()

devtools::document()

source("dev/compile_sass.R")

devtools::build()
