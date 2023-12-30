attachment::att_amend_desc()

source("dev/compile_sass.R")

devtools::test()
devtools::run_examples()

rcmdcheck::rcmdcheck(args = c("--no-manual", "--as-cran"))

devtools::check_win_devel()
devtools::check_mac_release()

usethis::use_cran_comments(open = rlang::is_interactive())

usethis::use_version(which = "minor")

devtools::release()
