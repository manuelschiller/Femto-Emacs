; define a *lisp-path* (quoted, since we want to evaluate it later in the
; Femto-Emacs binary)
(set! *lisp-path* '(list (string (os.getenv "HOME") *directory-separator*
				".config" *directory-separator* "Femto-Emacs")
			(os.getenv "HOME")
			(string *install-dir* *directory-separator* ".."
				*directory-separator* "share"
				*directory-separator* "Femto-Emacs")
			*install-dir*))
; find-in-lisp-path looks through the (evaluated) *lisp-path* and returns
; the first filename constructed from a prefix from *lisp-path*, the
; *directory-separator*, and f, that exists (or #f on failure)
(define (find-in-lisp-path f)
  ((lambda (f lisp-path)
  ((lambda (fn f sfx lst) (fn fn f sfx lst))
   (lambda (fn f sfx lst)
     (if (path.exists? f) f
       (if (eq? 0 (length lst))
	 #f (fn fn (string (car lst) *directory-separator* sfx)
		  sfx (cdr lst)))))
   (string (car lisp-path) *directory-separator* f)
   f (cdr lisp-path))) f (eval *lisp-path*)))
