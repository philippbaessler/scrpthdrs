test_that("css file did not change", {
    expect_snapshot_file(path = system.file("assets/style.css", package = "scrpthdrs"),
                         compare = compare_file_text)
})

test_that("gadget ui is created correctly", {
    ui <- as.character(create_gadget_ui())
    ui <- gsub("tab\\-\\d{4}\\-\\d", "XTABIDX", ui)
    ui <- gsub("(data\\-tabsetid=)\"\\d{4}\"", "\\1XTABSETIDX", ui)

    expect_snapshot(ui)
})

test_that("gadget server switch button works", {
    shiny::testServer(create_gadget_server(), {
        session$setInputs(toggle_size_large = TRUE)
        expect_equal(insert_type(), "large")

        session$setInputs(toggle_size_large = FALSE)
        expect_equal(insert_type(), "small")
    })
})

test_that("gadget server passes user inputs to insert_comment_header", {
    env <- new.env()

    local_mocked_bindings(
        do_call = \(fn, args) mapply(assign, names(args), args, MoreArgs = list(envir = env))
    )

    shiny::testServer(create_gadget_server(), {
        session$setInputs(toggle_size_large = TRUE)

        session$setInputs(txt_author = "My name")
        session$setInputs(txt_email = "My email")
        session$setInputs(txt_header = "Header")
        session$setInputs(txt_description = "Some description")
        session$setInputs(cb_include_script_title = TRUE)

        session$setInputs(bt_insert = 1)

    })

    passed_args <- Map(\(x) get(x, envir = env), ls(envir = env))
    expect_snapshot(passed_args)
})

test_that("gadget app works", {
    skip_on_ci()
    skip_on_cran()
    skip_if_not_installed("scrpthdrs")

    app_object <- shiny::shinyApp(create_gadget_ui(), create_gadget_server())

    suppressWarnings(
        app <- shinytest2::AppDriver$new(app_dir = app_object,
                                         variant = shinytest2::platform_variant(),
                                         shiny_args = list(test.mode = TRUE))
    )


    app$set_window_size(width = 971, height = 944)
    app$expect_screenshot()
    app$set_inputs(toggle_size_large = TRUE)
    app$wait_for_idle(duration = 500) # ensure button animation finished before saving screenshot
    app$expect_screenshot()
    app$set_inputs(txt_author = "Hello")
    app$set_inputs(txt_email = "World")
    app$set_inputs(txt_header = "Header Test")
    app$set_inputs(cb_include_script_title = TRUE)
    app$set_inputs(txt_description = "Ok")
    app$expect_values()
})
