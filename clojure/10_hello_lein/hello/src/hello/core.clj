(ns hello.core
  (:require [hello.hellos :as hh])
  ;; (:use [hello.hellos :as hh])
  (:gen-class))

(def scenes [{:subject  "Frankie"
              :action   "say"
              :object   "relax"}

             {:subject  "Lucy"
              :action   "❤s"
              :object   "Clojure"}

             {:subject  "Rich"
              :action   "tries"
              :object   "a new conditioner"}])

(print "coucou")

(require '[clojure.string :as str])



(str/blank? "")
(def l (str/split s #", "))
(def ff #(str "\"" % "\""))


(def ll (map ff l))
(str/join ", " ll)

(print (ff "coucou"))

(def s "Belmondo, Gabin, Luchini")

(->> s
     (#(str/split % #", "))
     (map #(str "\"" % "\""))
     (str/join ", ")
     print
     )


(defn people-in-scenes [scenes]
  "get subjects"
  (->> scenes
       (map :action)
       (interpose ", ")
       (reduce str)))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (println "Hello, World!")

  (println hh/hello)

  (println (people-in-scenes scenes)))
