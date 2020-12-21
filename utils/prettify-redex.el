;;; -*- lexical-binding: t; -*-
(provide 'prettify-redex-alist)
(require 'prettify-utils)
(defvar prettify-redex-alist
  (prettify-utils-generate
	 ("|>"		"▷")
	 ("<|"		"◁")
	 ("->>"		"↠")
	 ("->"		"→")
	 ("<-"		"←")
	 ("=>"		"⇒")
	 ("<="		"⇐")
   ("|->"   "↦")
   ("tau"   "τ")
   ("lambda" "λ")
   ("|-"  "⊢")
   ("-->" "⟶")
   ))
