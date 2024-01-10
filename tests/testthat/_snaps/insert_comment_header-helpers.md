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

# small_header_constructor() works

    Code
      header
    Output
      [1] "##################################################\n#                     hello                      #\n# Created: 2024-01-01 with R 4.3.2               #\n# Author:  world                                 #\n#          foo                                   #\n##################################################\n\n"

---

    Code
      header
    Output
      [1] "##################################################\n#                     hello                      #\n# Created: 2024-01-01 with R 4.3.2               #\n# Author:  world                                 #\n#          foo                                   #\n# ---------------------------------------------- #\n# bar                                            #\n# ok                                             #\n##################################################\n\n"

# large_header_constructor() works

    Code
      header
    Output
      [1] "##########################################################\n#                         hello                          #\n#                                                        #\n# bar                                                    #\n# ok                                                     #\n#                                                        #\n# Created: 2024-01-01 with R 4.3.2                       #\n# Author:  world                                         #\n#          foo                                           #\n# Last modified: -                                       #\n#                                                        #\n#                              do not remove this header #\n##########################################################\n\n"

---

    Code
      header
    Output
      [1] "##########################################################\n#                         hello                          #\n#                                                        #\n# bar                                                    #\n# ok                                                     #\n#                                                        #\n# Created: 2024-01-01 with R 4.3.2                       #\n# Author:  world                                         #\n#          foo                                           #\n# Last modified: -                                       #\n#                                                        #\n# ------------------------------------------------------ #\n# abc                                                    #\n# def                                                    #\n# ------------------------------------------------------ #\n#                                                        #\n#                              do not remove this header #\n##########################################################\n\n"

