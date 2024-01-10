#' @keywords internal
"_PACKAGE"

## usethis namespace: start
#' @importFrom shiny actionButton
#' @importFrom shiny checkboxInput
#' @importFrom shiny div
#' @importFrom shiny fillCol
#' @importFrom shiny observeEvent
#' @importFrom shiny reactive
#' @importFrom shiny req
#' @importFrom shiny tabPanelBody
#' @importFrom shiny tabsetPanel
#' @importFrom shiny tags
#' @importFrom shiny textAreaInput
#' @importFrom shiny textInput
#' @importFrom shiny updateTabsetPanel
## usethis namespace: end
NULL

# enable mocking of Sys.Date() during testing
Sys.Date <- NULL
