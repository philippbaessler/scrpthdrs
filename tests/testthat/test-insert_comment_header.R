test_that("insert_comment_header() throws descriptive errors on bad inputs", {
    local_mocked_bindings(insertText = function(...) list(...), .package = "rstudioapi")
    local_mocked_bindings(document_range = function(...) list(...), .package = "rstudioapi")

    expect_error(insert_comment_header(1),
                 regexp = "`author`.+is\\.null.+is\\.character")
    expect_error(insert_comment_header(c("a", "b")),
                 regexp = "`author`.+length\\(x)[ ]*<=[ ]*1")
    expect_error(insert_comment_header(NULL, email = 1),
                 regexp = "`email`.+is\\.null.+is\\.character")
    expect_error(insert_comment_header(NULL, header = 1),
                 regexp = "`header`.+is\\.null.+is\\.character")
    expect_error(insert_comment_header(NULL, description = 1),
                 regexp = "`description`.+is\\.null.+is\\.character")
})

test_that("insert_comment_header() can be called", {
    local_mocked_bindings(insertText = function(...) list(...), .package = "rstudioapi")
    local_mocked_bindings(document_range = function(...) list(...), .package = "rstudioapi")


    expect_no_error(insert_comment_header("Test"))
    expect_no_error(insert_comment_header(NULL, script_title = "Test"))
    expect_no_error(insert_comment_header("Test", type = "large"))

    result <- insert_comment_header("Test")
    expect_snapshot(result)
})



test_that("insert_comment_header() passes fuzzing", {
    local_mocked_bindings(insertText = function(...) list(...), .package = "rstudioapi")
    local_mocked_bindings(document_range = function(...) list(...), .package = "rstudioapi")

    # fuzz test 'author'
    fuzz_author <- fuzzr::fuzz_function(insert_comment_header,
                                        arg_name = "author",
                                        tests = test_all())

    # fuzz test 'email'
    fuzz_email <- fuzzr::fuzz_function(insert_comment_header,
                                       arg_name = "email",
                                       tests = test_all())

    # fuzz test 'header'
    fuzz_header <- fuzzr::fuzz_function(insert_comment_header,
                                        arg_name = "header",
                                        tests = test_all())

    # fuzz test 'description'
    fuzz_description <- fuzzr::fuzz_function(insert_comment_header,
                                             arg_name = "description",
                                             tests = test_all())

    # check fuzz results
    expect_snapshot(as.data.frame(fuzz_author))
    expect_snapshot(as.data.frame(fuzz_email))
    expect_snapshot(as.data.frame(fuzz_header))
    expect_snapshot(as.data.frame(fuzz_description))
})
