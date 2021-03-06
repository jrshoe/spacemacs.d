;;; packages.el --- taoline layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2020 Sylvain Benner & Contributors
;;
;; Author: Xu Xue <xuxue@Xus-MacBook-Pro.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `taoline-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `taoline/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `taoline/pre-init-PACKAGE' and/or
;;   `taoline/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst taoline-packages
  '((taoline :location local)))

(defun taoline/init-taoline ()
  (use-package taoline
    :custom
    (taoline-show-directory nil)
    (taoline-show-buffer-name t)
    (taoline-show-git-branch t)
    :config (taoline-mode t)))

;;; packages.el ends here
