#' Insert a comment header into am R script
#'
#' @param author Name of the creator of the script.
#' @param email Email of the creator of the script.
#' @param header Brief title of the script
#' @param description Description of the script.
#' @param script_title The name of the script.
#' @param type Appearance of the header. Either \emph{"small"} (the default) to create a smaller
#'   format with a lesser footprint, or \emph{"large"} to create a larger header comprising more
#'   details.
#' @param target The name of the target R script. It must be opened in RStudio's editor pane. By
#'   default the currently focused file is used.
#'
#' @export
#'
#' @examples
insert_comment_header <- function(author,
                                  email = NULL,
                                  header = NULL,
                                  description = NULL,
                                  script_title = basename(rstudioapi::documentPath(id = target)),
                                  type = c("small", "large"),
                                  target = rstudioapi::documentId(allowConsole = FALSE)) {

    type <- match.arg(type)

    if (is.null(author))
        author <- "-"


    if (is.null(email))
        email <- " "


    if (!is.null(script_title) && !is_try_success(script_title))
        script_title <- NULL


    make_comment <- switch(type,
        small = small_header_constructor,
        large = large_header_constructor
    )

    range <- rstudioapi::document_range(c(1, 0), c(1, 0))
    rstudioapi::insertText(location = range,
                           text = make_comment(header, author, email, script_title, description),
                           id = target)

}


# helpers -------------------------------------------------------------------------------------

is_try_success <- function(input) {
    res <- try(input, silent = TRUE)

    class(res) != "try-error"
}

parse_input <- function(x, width) {
    if (nchar(x) > width - 4)
        x <- paste0(substr(x, 0, width - 7), "...")

    x
}

many <- function(x, times, edges = NULL) {
    paste0(edges, paste0(rep(x, times), collapse = ""), edges, sep = "", collapse = "")
}

left_fn <- function(width) {
    function(x) {
        if (is.null(x) || length(x) == 0)
            return(" ")

        x <- parse_input(x, width)

        paste0("# ", x, many(" ", width - nchar(x) - 3), "#")
    }
}

right_fn <- function(width) {
    function(x) {
        if (is.null(x) || length(x) == 0)
            return(" ")

        x <- parse_input(x, width)

        paste0("#", many(" ", width - nchar(x) - 3), x, " #")
    }
}

center_fn <- function(width) {
    function(x) {
        if (is.null(x) || length(x) == 0)
            return(" ")

        x <- parse_input(x, width)

        n_blank <- (width - nchar(x) - 3) / 2

        paste0("#", many(" ", floor(n_blank)), x, many(" ", ceiling(n_blank)), " #")
    }
}

format_Rversion <- function() {
    paste0(R.version$major, ".", R.version$minor)
}

format_date <- function() {
    as.character(Sys.Date())
}

spacer_if_present <- function(...) {
    vars_are_null <- vapply(list(...), is.null, logical(1))

    if (!all(vars_are_null))
        return(" ")
}

small_header_constructor <- function(header, author, email,
                                     ..., include_additional = FALSE) {
    merge_text(
        many("#", 50),
        enframe_text(header, align_fn = center_fn(50)),
        enframe_text(c("Created:", format_date(), "with R", format_Rversion()),
                     c("Author: ", author),
                     c(many(" ", 8), email),
                     align_fn = left_fn(50)),
        if (include_additional && length(list(...)) > 0) enframe_text(many("-", 46), ...),
        many("#", 50), "", ""
    )
}

large_header_constructor <- function(header, author, email, script_title, description,
                                     ..., include_additional = FALSE) {

    additional_text <- if (include_additional && length(list(...)) > 0) {
        enframe_text(many("-", 54), ..., many("-", 54), " ",
                     align_fn = left_fn(58))
    }

    merge_text(
        many("#", 58),
        enframe_text(header, align_fn = center_fn(58)),
        enframe_text(spacer_if_present(header),
                     script_title,
                     description,
                     spacer_if_present(description, script_title),
                     c("Created:", format_date(), "with R", format_Rversion()),
                     c("Author: ", author),
                     c(many(" ", 8), email),
                     c("Last modified:", "-"),
                     " ",
                     align_fn = left_fn(58)
        ),
        additional_text,
        enframe_text("do not remove this header", align_fn = right_fn(58)),
        many("#", 58), "", ""
    )
}

enframe_text <- function(..., align_fn = left_fn(50)) {
    enf <- vapply(list(...),
                  FUN = \(x) align_fn(do.call(paste, args = as.list(x))),
                  FUN.VALUE = character(1))

    enf <- grep("^#", enf, value = TRUE)

    if (length(enf) == 0)
        return(NULL)

    paste(enf, collapse = "\n")
}

merge_text <- function(...) {
    text_parts <- list(...)

    text_parts <- text_parts[!vapply(text_parts, is.null, logical(1))]

    do.call(paste, args = c(text_parts,
                            list(sep = "\n")))
}
