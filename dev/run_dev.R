sass::sass(
    sass::sass_file("scss/style.scss"),
    output = "inst/assets/style.css",
    options = sass::sass_options(output_style = "compressed"),
    cache = FALSE
)

devtools::load_all()
commentHeaderAddin()
