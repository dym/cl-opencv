;;;; -*- mode: lisp; -*-
;;;; cl-opencv.lisp
;;;; OpenCV bindings for SBCL
;;;; Library loading and common code
(in-package :cl-opencv)

;;; Foreign library setup
(when (member :darwin cl:*features*)
  (pushnew #p"/opt/local/lib/" cffi:*foreign-library-directories*))

(cffi:define-foreign-library opencv_highgui
                             (:darwin (:or "libopencv_highgui.2.2.0.dylib" "libopencv_highgui.dylib"))
                             (:unix (:or "libopencv_highgui.so.2.4.4" "libopencv_highgui.so" ))
                             (t (:default "libopencv_highgui")))
(cffi:use-foreign-library opencv_highgui)

(cffi:define-foreign-library opencv_imgproc
                             (:darwin (:or "libopencv_imgproc.2.2.0.dylib" "libopencv_imgproc.dylib"))
                             (:unix (:or "libopencv_imgproc.so.2.4.4" "libopencv_imgproc.so" ))
                             (t (:default "libopencv_imgproc")))
(cffi:use-foreign-library opencv_imgproc)

(cffi:define-foreign-library cl-opencv-glue
                             (:darwin "libcl-opencv-glue.dylib")
                             (:unix "libcl-opencv-glue.so")
                             (t (:default "libcl-opencv-glue")))
(cffi:use-foreign-library cl-opencv-glue)

;;; General macros and functions
(defmacro defanonenum (&body enums)
  "Converts anonymous enums to Lisp constants."
  `(cl:progn ,@(cl:loop for value in enums
                        for index = 0 then (cl:1+ index)
                        when (cl:listp value) 
                        do (cl:setf index (cl:second value)
                                    value (cl:first value))
                        collect `(cl:defconstant ,value ,index))))
