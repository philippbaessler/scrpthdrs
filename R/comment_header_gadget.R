#' Script Header RStudio Addin
#'
#' @export
commentHeaderAddin <- function() {
    ui <- miniUI::miniPage(
        miniUI::miniContentPanel(
            padding = "20px",
            shiny::includeCSS(path = system.file("assets/style.css", package = "scrpthdrs")),
            fillCol(
                flex = c(NA, NA, 1, NA),
                div(
                    class = "toggle-switch",
                    tags$label(
                        class = "switch",
                        checkboxInput("toggle_size_large", label = "small")
                    )
                ),
                div(
                    class = "ui-container ui-inline",
                    textInput("txt_author", "Author", width = "200px"),
                    textInput("txt_email", "Email", width = "200px")
                ),
                tabsetPanel(
                    id = "ui_switcher",
                    type = "hidden",
                    tabPanelBody(
                        "ui_small",
                        NULL
                    ),
                    tabPanelBody(
                        "ui_large",
                        div(
                            class = "ui-container",
                            div(
                                class = "ui-inline",
                                textInput("txt_header", "Header", width = "200px"),
                                checkboxInput("cb_include_script_title",
                                              "Include file name",
                                              width = "200px")
                            ),
                            textAreaInput("txt_description", "Description",
                                          width = "420px", height = "100px", resize = "none")
                        )
                    )
                ),
                actionButton("bt_insert", "insert", style = "float:right;", class = "btn-primary")
            )
        )
    )

    server <- function(input, output, session) {

        insert_type <- reactive({
            if (input$toggle_size_large) {
                "large"
            } else {
                "small"
            }
        })


        observeEvent(insert_type(), {
            updateTabsetPanel(inputId = "ui_switcher", selected = paste0("ui_", insert_type()))
        })

        observeEvent(input$bt_insert, {
            req(input$txt_author)

            insert_options <- list(
                author = input$txt_author,
                email  = parse_user_input(input$txt_email),
                header = parse_user_input(input$txt_header),
                description = parse_user_input(input$txt_description),
                type = insert_type()
            )

            if (!input$cb_include_script_title)
                insert_options <- c(insert_options, list(script_title = NULL))

            do.call(insert_comment_header, args = insert_options)

            shiny::stopApp()
        })
    }

    shiny::runGadget(ui, server,
                     viewer = shiny::dialogViewer("Add Comment Header", width = 520, height = 445))
}



# helpers -------------------------------------------------------------------------------------

parse_user_input <- function(value) {
    if (!shiny::isTruthy(value))
        return(NULL)

    value
}
