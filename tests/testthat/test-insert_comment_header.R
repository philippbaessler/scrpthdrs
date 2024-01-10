test_that("insert_comment_header() throws descriptive errors on bad inputs", {
    local_mocked_bindings(insert_header = function(...) list(...))

    expect_error(insert_comment_header(1, target = NULL),
                 regexp = "`author`.+is\\.null.+is\\.character")
    expect_error(insert_comment_header(c("a", "b"), target = NULL),
                 regexp = "`author`.+length\\(x)[ ]*<=[ ]*1")
    expect_error(insert_comment_header(NULL, email = 1, target = NULL),
                 regexp = "`email`.+is\\.null.+is\\.character")
    expect_error(insert_comment_header(NULL, header = 1, target = NULL),
                 regexp = "`header`.+is\\.null.+is\\.character")
    expect_error(insert_comment_header(NULL, description = 1, target = NULL),
                 regexp = "`description`.+is\\.null.+is\\.character")
})

test_that("insert_comment_header() can be called", {
    local_mocked_bindings(insert_header = function(...) list(...))
    local_mocked_bindings(Sys.Date = function() as.Date("2024-01-01"))

    expect_no_error(insert_comment_header("Test", target = NULL))
    expect_no_error(insert_comment_header(NULL, script_title = "Test", target = NULL))
    expect_no_error(insert_comment_header("Test", type = "large", target = NULL))

    result <- insert_comment_header("Test", target = NULL)
    expect_snapshot(result)
})



test_that("insert_comment_header() passes fuzzing", {
    local_mocked_bindings(insert_header = function(...) list(...))

    # fuzz test 'author'
    fuzz_author <- fuzzr::fuzz_function(insert_comment_header,
                                        arg_name = "author",
                                        target = NULL,
                                        tests = fuzzr::test_all())

    # fuzz test 'email'
    fuzz_email <- fuzzr::fuzz_function(insert_comment_header,
                                       arg_name = "email",
                                       target = NULL,
                                       tests = fuzzr::test_all())

    # fuzz test 'header'
    fuzz_header <- fuzzr::fuzz_function(insert_comment_header,
                                        arg_name = "header",
                                        target = NULL,
                                        tests = fuzzr::test_all())

    # fuzz test 'description'
    fuzz_description <- fuzzr::fuzz_function(insert_comment_header,
                                             arg_name = "description",
                                             target = NULL,
                                             tests = fuzzr::test_all())

    # check fuzz results
    expect_snapshot(as.data.frame(fuzz_author))
    expect_snapshot(as.data.frame(fuzz_email))
    expect_snapshot(as.data.frame(fuzz_header))
    expect_snapshot(as.data.frame(fuzz_description))
})
