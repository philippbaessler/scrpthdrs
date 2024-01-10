test_that("gadget ui is created correctly", {
    ui <- create_gadget_ui()

    expect_snapshot(ui)
})

test_that("gadget server switch button works", {
    shiny::testServer(gadget_server, {
        session$setInputs(toggle_size_large = TRUE)
        expect_equal(insert_type(), "large")

        session$setInputs(toggle_size_large = FALSE)
        expect_equal(insert_type(), "small")
    })
})

# test_that("gadget server switches the ui", {
#     env <- new.env()
#     local_mocked_bindings(
#         insert_comment_header = function(...) {
#             mapply(assign, names(list(...)), list(...), envir = env)
#         }
#     )
#
#     app <- shinytest::ShinyDriver$new(shiny::shinyApp(create_gadget_ui(), gadget_server))
#
#     app$setInputs(toggle_size_large = TRUE)
#     shinytest::expectUpdate(app, "ui_switcher")
#     expect_equal(app$getValue("ui_switcher"), "ui_large")
#
#     app$setInputs(toggle_size_large = FALSE)
#     shinytest::expectUpdate(app, "ui_switcher")
#     expect_equal(app$getValue("ui_switcher"), "ui_small")
#
#     app$setInputs(toggle_size_large = TRUE,
#                   txt_author = "Test_Name",
#                   txt_email = "test@email.com",
#                   txt_header = "HEADER",
#                   txt_description = "some description",
#                   cb_include_script_title = FALSE)
#
#     app$click("bt_insert")
#
#     expect_snapshot(env)
# })
