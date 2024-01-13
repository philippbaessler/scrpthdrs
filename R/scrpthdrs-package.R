#' Script Headers package
#'
#' @description
#' Insert comment headers in your R script files opened in RStudio to include basic meta data.
#' Learn more about this package in the vignette "insert_script_headers":
#' `vignette(insert_script_headers, package = "scrpthdrs")`
#'
#' @keywords internal
"_PACKAGE"

## usethis namespace: start
#' @importFrom shiny actionButton
#' @importFrom shiny checkboxInput
#' @importFrom shiny div
#' @importFrom shiny exportTestValues
#' @importFrom shiny fillCol
#' @importFrom shiny observeEvent
#' @importFrom shiny reactive
#' @importFrom shiny req
#' @importFrom shiny stopApp
#' @importFrom shiny tabPanelBody
#' @importFrom shiny tabsetPanel
#' @importFrom shiny tags
#' @importFrom shiny textAreaInput
#' @importFrom shiny textInput
#' @importFrom shiny updateTabsetPanel
## usethis namespace: end
NULL

# enable mocking of base functions during testing
Sys.Date <- NULL
