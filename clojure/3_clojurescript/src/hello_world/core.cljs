(ns hello-world.core)

(enable-console-print!)

(defn hello [] "hello Thersse")

;; ADDED
(defn average [a b]
  (/ (+ a b) 2.0))

(println (hello))

