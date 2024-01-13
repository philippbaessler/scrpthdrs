# test css file

# test_that("gadget ui is created correctly", {
#     ui <- as.character(create_gadget_ui())
#
#     expect_snapshot(ui)
# })

test_that("gadget server switch button works", {
    shiny::testServer(create_gadget_server(), {
        session$setInputs(toggle_size_large = TRUE)
        expect_equal(insert_type(), "large")

        session$setInputs(toggle_size_large = FALSE)
        expect_equal(insert_type(), "small")
    })
})

test_that("gadget server passes the inputs to insert_comment_header()", {
    skip_on_cran()
    skip_if_not_installed("scrpthdrs")

    temp_file <- file.path(tempdir(), "passed_args.rds")
    on.exit(file.remove(temp_file), add = TRUE, after = FALSE)

    local_mocked_bindings(
        do_call  = \(...) saveRDS(list(...), temp_file),
        stop_app = \() return()
    )

    app_object <- shiny::shinyApp(create_gadget_ui(), create_gadget_server())

    suppressWarnings(
        app <- shinytest2::AppDriver$new(app_dir = app_object,
                                         variant = shinytest2::platform_variant(),
                                         shiny_args = list(test.mode = TRUE))
    )


    app$set_window_size(width = 971, height = 944)
    app$set_inputs(toggle_size_large = TRUE)
    app$wait_for_idle(duration = 500) # ensure button animation finished before saving screenshot
    app$expect_screenshot()
    app$set_inputs(txt_author = "Hello")
    app$set_inputs(txt_email = "World")
    app$set_inputs(txt_header = "Header Test")
    app$set_inputs(cb_include_script_title = TRUE)
    app$set_inputs(txt_description = "Ok")
    app$click(selector = "#bt_insert")
    app$wait_for_idle(duration = 500) # ensure button animation finished before saving screenshot
    app$expect_values()


    do_call_state <- readRDS(temp_file)
    expect_snapshot(do_call_state$args)
})
