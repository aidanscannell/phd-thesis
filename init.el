;;; init.el --- Minimal emacs config for exporting phd-thesis.org to phd-thesis.pdf -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2022 Aidan Scannell
;;
;; Author: Aidan Scannell <scannell.aidan@gmail.com>
;; Maintainer: Aidan Scannell <scannell.aidan@gmail.com>
;; Created: August 18, 2022
;; Modified: August 18, 2022
;; Version: 0.0.1
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize) ;; Initialize & Install Package

;; (unless package-archive-contents    ;; Refresh the packages descriptions
;; (package-refresh-contents))
;; (setq package-load-list '(all))     ;; List of packages to load
;; (unless (package-installed-p 'org)  ;; Make sure the Org package is
;;   (package-install 'org))           ;; installed, install it if not
;; (unless (package-installed-p 'org-ref)  ;; Make sure the Org-Ref package is
;;   (package-install 'org-ref))           ;; installed, install it if not

;; (eval-when-compile
;; (require 'use-package))
;; Always download packages defined with use-package if not already installed
;; (require 'use-package-ensure)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(use-package org
  :config

  (use-package org-ref)

  (use-package org-contrib
    :config
    (require 'ox-extra)
    (ox-extras-activate '(latex-header-blocks ignore-headlines)))

<<<<<<< HEAD
=======
  (setq org-latex-pdf-process
        '("latexmk -interaction=nonstopmode -output-directory=./tex -output-format=pdf %f"))

>>>>>>> corrections
  (unless (boundp 'org-latex-classes)
    (setq org-latex-classes nil))

  (add-to-list 'org-latex-classes
               '("mimosis"
                 "\\documentclass{mimosis-class/mimosis}
                 [NO-DEFAULT-PACKAGES]
                 [PACKAGES]
                 [EXTRA]"
                 ("\\chapter{%s}" . "\\addchap{%s}")
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}\\newline" . "\\paragraph*{%s}\\newline")
                 ("\\subparagraph{%s}\\newline" . "\\subparagraph*{%s}\\newline"))))




;; (setq org-latex-hyperref-template
;;       "\\\hypersetup{
;;     pdfauthor={%a},
;;     pdftitle={%t},
;;     pdfkeywords={%k},
;;     pdfsubject={%d},
;;     pdfcreator={%c},
;;     pdflang={%L}}\n")


(provide 'init)
;;; init.el ends here
