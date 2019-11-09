(ns try.core
  (:require [promesa.core :as p])
  )

(println "coucou")
(p/resolve 1)

;; ADDED
(defn average [a b]
  (/ (+ a b) 2.0))
