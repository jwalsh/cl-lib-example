;;; example.el --- cl-lib examples
;;
;; Filename: example.el
;; Description: API review for cl-lib
;; Author: Jason Walsh
;; Maintainer: Jason Walsh
;; Created: Mon Sep 24 11:03:38 2018 (-0400)
;; Version: 0.1
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 0
;; URL:
;; Doc URL:
;; Keywords:
;; Compatibility:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(provide 'ex)

;; https://www.gnu.org/software/emacs/manual/html_node/cl/index.html#Top
(require 'cl-lib)


(cl-function (lambda (x) x))

;; Numbers

(print (cl-plusp 1))
(print (cl-minusp -2))
(print (cl-oddp 3))
(print (cl-evenp 2))
(print (logand 1 1))

(defvar ex-digits (make-vector 256 nil))

(defun populate (start end base)
  "Populate START and END using BASE."
  (mapc (lambda (i)
          (aset ex-digits i (+ base (- i start))))
        (number-sequence start end)))

(populate 0 100 20)
ex-digits

(defvar ex-cl-custom-print-functions '(lambda (object stream level)
                                        (print object stream level)))

;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Setting-Generalized-Variables.html
;; The setf form is like setq, except that it accepts arbitrary place
;; forms on the left side rather than just symbols.
(setf (car a) b)
(setf ex-x 3)
(cl-incf ex-x 2)
(setf ex-l '())
(cl-pushnew 1 ex-l)

(cl-digit-char-p 123)

;; Debugging
(defun fac (n)
  (cond ((< 0 n) (* n (fac (1- n))))
        (t 1)))
(fac 5)

;; Sequences

(cl-copy-seq '())
(cl-mapcar (lambda (i) (* 2 i)) '(1 2 3 4 5 6))
(cl-first '(1 2 3 4 5 6 7))

(cl-first (seq--into-list ex-digits))





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; example.el ends here
