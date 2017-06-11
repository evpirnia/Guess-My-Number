;;;; -*- Mode: LISP; Syntax: Common-lisp; Package: USER; Base: 10 -*-
;;;; File description: In this file, the Guess-My-Number Game is implemented in
;;;; Lisp where the user picks a number from 1 to 100, and the computer has to guess
;;;; it. The user aids the computer in guessing by either saying the number guessed is
;;;; (smaller) or (bigger) until the number is guessed.

(in-package :User) ; optional - this is also in the top line above

(defparameter *small* 1) ; define global variable with initial state as 1
(defparameter *big* 100) ; define global variable with initial state as 100

(defun guess-my-number () ; binary shifts the sum of small and big
     (ash (+ *small* *big*) -1))

(defun smaller ()
     (setf *big* (1- (guess-my-number))) ; sets big as the previously guessed number
     (guess-my-number))                  ; calls guess-my-number function

(defun bigger ()
     (setf *small* (1+ (guess-my-number))) ; sets small as the previously guessed number
     (guess-my-number))                    ; calls guess-my-number function

(defun start-over ()
   (defparameter *small* 1) ; redefines lower boundary for guessing to initial state
   (defparameter *big* 100) ; redefines upper boundary for guessing to initial state
   (guess-my-number))       ; calls guess-my-number function
