test_that("insert_comment_header() throws descriptive errors on bad inputs", {
    local_mocked_bindings(insertText = function(...) list(...), .package = "rstudioapi")
    local_mocked_bindings(document_range = function(...) list(...), .package = "rstudioapi")

    expect_error(insert_comment_header(1, target = "none"),
                 regexp = "`author`.+is\\.null.+is\\.character")
    expect_error(insert_comment_header(NULL, email = 1, target = "none"),
                 regexp = "`email`.+is\\.null.+is\\.character")
    expect_error(insert_comment_header(NULL, header = 1, target = "none"),
                 regexp = "`header`.+is\\.null.+is\\.character")
    expect_error(insert_comment_header(NULL, description = 1, target = "none"),
                 regexp = "`description`.+is\\.null.+is\\.character")
})

test_that("insert_comment_header() can be called", {
    local_mocked_bindings(insertText = function(...) list(...), .package = "rstudioapi")
    local_mocked_bindings(document_range = function(...) list(...), .package = "rstudioapi")


    expect_no_error(insert_comment_header("Test", target = "none"))
    expect_no_error(insert_comment_header(NULL, script_title = "Test", target = "none"))
    expect_no_error(insert_comment_header("Test", type = "large", target = "none"))

    result <- insert_comment_header("Test", target = "none")
    expect_snapshot(result)
})



test_that("insert_comment_header() passes fuzzing", {
    local_mocked_bindings(insertText = function(...) list(...), .package = "rstudioapi")
    local_mocked_bindings(document_range = function(...) list(...), .package = "rstudioapi")

    # fuzz test 'author'
    fuzz_author <- fuzzr::fuzz_function(insert_comment_header,
                                        arg_name = "author", target = "none",
                                        tests = test_all())

    # fuzz test 'email'
    fuzz_email <- fuzzr::fuzz_function(insert_comment_header,
                                       arg_name = "email", target = "none",
                                       tests = test_all())

    # fuzz test 'header'
    fuzz_header <- fuzzr::fuzz_function(insert_comment_header,
                                        arg_name = "header", target = "none",
                                        tests = test_all())

    # fuzz test 'description'
    fuzz_description <- fuzzr::fuzz_function(insert_comment_header,
                                             arg_name = "description", target = "none",
                                             tests = test_all())

    # check fuzz results
    expect_snapshot(as.data.frame(fuzz_author))
    expect_snapshot(as.data.frame(fuzz_email))
    expect_snapshot(as.data.frame(fuzz_header))
    expect_snapshot(as.data.frame(fuzz_description))
})
