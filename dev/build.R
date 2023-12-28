usethis::use_tidy_description()

rcmdcheck::rcmdcheck() # testthat
lintr::lint_package()

devtools::document()

sass::sass(
    sass_file("scss/style.scss"),
    output = "inst/assets/style.css",
    options = sass_options(output_style = "compressed")
)

devtools::build()
