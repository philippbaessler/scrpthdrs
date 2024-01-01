# scrpthdrs

<!-- badges: start -->

[![](https://img.shields.io/badge/devel%20version-0.1.0-blue.svg)](https://github.com/scrpthdrs) [![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental) [![R-CMD-check](https://github.com/PhilippBaessler/scrpthdrs/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/PhilippBaessler/scrpthdrs/actions/workflows/R-CMD-check.yaml) [![codecov](https://codecov.io/gh/PhilippBaessler/scrpthdrs/graph/badge.svg?token=LK9VE1QU63)](https://codecov.io/gh/PhilippBaessler/scrpthdrs)

<!-- badges: end -->

`scrpthdrs` provides a very basic way to quickly insert a comment header at the top of an R script.

## Installation

You can install the development version of scrpthdrs from [GitHub](https://github.com/) with:

``` r
devtools::install_github("PhilippBaessler/scrpthdrs")
```

## Usage

The package provides a basic GUI via an RStudio Addin. It can be found in **Addins** ➔ `scrpthdrs` / *Insert comment header*

Alternatively, the function can be called directly in the console assuming the R script file to which the comment header shall be added is open and focused in RStudio:

``` r
scrpthdrs::insert_comment_header(author = "My Name", email = "my.name@domain.com")
```
