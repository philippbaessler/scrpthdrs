#' Title
#'
#' @return
#' @export
#'
#' @examples
commentHeaderAddin <- function() {
    ui <- miniUI::miniPage(
        miniUI::miniContentPanel(
            shiny::includeCSS(path = system.file("assets/style.css", package = "scrpthdrs")),
            fillCol(
                flex = c(NA, NA, 1, NA),
                div(
                    class = "toggle-switch",
                    tags$label(
                        class = "switch",
                        checkboxInput("toggle_size", label = "large")
                    )
                ),
                div(
                    class = "ui-inline",
                    textInput("txt_author", "Author"),
                    textInput("txt_email", "Email")
                ),
                tabsetPanel(
                    id = "ui_switcher",
                    type = "hidden",
                    tabPanelBody(
                        "ui_small",
                        "ABC"
                    ),
                    tabPanelBody(
                        "ui_large",
                        "Hello World!"
                    )
                ),
                actionButton("bt_insert", "insert", style = "float:right;", class = "btn-primary")
            )
        )
    )

    server <- function(input, output, session) {

    }

    shiny::runGadget(ui, server,
                     viewer = shiny::dialogViewer("Add Comment Header", width = 600, height = 600))
}
