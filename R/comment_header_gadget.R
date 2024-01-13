#' Script Header RStudio Addin
#'
#' @export
commentHeaderAddin <- function() {
    shiny::runGadget(create_gadget_ui(), create_gadget_server(),
                     viewer = shiny::dialogViewer("Add Comment Header", width = 520, height = 445))
}

### DEV ONLY
insert_comment_header2 <- function(...) stop()
abc <- function() {
    message("hello")
    insert_comment_header2(m = "abc")
    return("done")
}
###


# shiny gadget definition ---------------------------------------------------------------------

create_gadget_ui <- function() {
    miniUI::miniPage(
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
}

create_gadget_server <- function() {
    function(input, output, session) {
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

            do_call(insert_comment_header, args = insert_options)

            stopApp()
        })

        exportTestValues(insert_type = insert_type())
    }
}


# helpers -------------------------------------------------------------------------------------
do_call <- function(fn, args) {
    do.call(fn, args)
}

parse_user_input <- function(value) {
    if (!shiny::isTruthy(value))
        return(NULL)

    value
}
