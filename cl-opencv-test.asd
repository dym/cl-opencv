;;; -*- mode: lisp; -*-

(defpackage :cl-opencv-test-asd
  (:use :cl
        :asdf))

(in-package :cl-opencv-test-asd)

(defsystem #:cl-opencv-test
  :description "Test programs for cl-opencv."
  :author "J. Bromley <jbromley@gmail.com>"
  :version "0.1"
  :depends-on (#:cl-opencv)
  :components
  ((:module "test"
    :components
    ((:file "package")
     (:file "test" :depends-on ("package"))))))
  