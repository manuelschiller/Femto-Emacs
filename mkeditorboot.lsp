(load "femtolisp/femtosystem.lsp")            ;; system without Read Eval Print Loop
(load "femtolisp/compiler.lsp")               ;; compiler exactly like femtolisp compiler
(load "findinlisppath.lsp")                   ;; *lisp-path*, find-in-lisp-path
(make-system-image "femto.boot")    ;; generate femto.boot
