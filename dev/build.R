usethis::use_tidy_description()

source("dev/compile_sass.R")

devtools::document()

rcmdcheck::rcmdcheck() # testthat
devtools::test_coverage()
lintr::lint_package()


devtools::build()
