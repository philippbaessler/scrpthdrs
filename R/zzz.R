.onAttach <- function(...) {
    if (!rstudioapi::isAvailable()) {
        packageStartupMessage(paste("RStudio is not available. Core features will not work as intended. \n",
                                    "Consider using `scrpthdrs` in RStudio."))
    }
}
