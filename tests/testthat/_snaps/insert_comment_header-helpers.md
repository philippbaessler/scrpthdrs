# enframe_text() works

    Code
      cat(enframe_text("hello", "how", "are", "you"))
    Output
      # hello                                          #
      # how                                            #
      # are                                            #
      # you                                            #

---

    Code
      cat(enframe_text("hello", NULL, "you"))
    Output
      # hello                                          #
      # you                                            #

