sass::sass(
    sass::sass_file("scss/style.scss"),
    output = "inst/assets/style.css"
)

devtools::load_all()
commentHeaderAddin()
