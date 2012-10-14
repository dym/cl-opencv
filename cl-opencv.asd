;;; -*- mode: lisp; -*-

(defpackage :cl-opencv-asd
  (:use :cl
        :asdf))

(in-package :cl-opencv-asd)

(defsystem #:cl-opencv
 :name "cl-opencv"
 :author "J. Bromley <jbromley@gmail.com>"
 :version "0.1"
 :description "OpenCV bindings for SBCL"
 :depends-on (:cffi)
 :serial t
 :components ((:file "package") 
     (:file "cl-opencv" :depends-on ("package"))
     (:file "core" :depends-on ("package" "cl-opencv"))
     (:file "imgproc" :depends-on ("package" "cl-opencv" "core"))
     (:file "highgui" :depends-on ("package" "cl-opencv" "core"))))
