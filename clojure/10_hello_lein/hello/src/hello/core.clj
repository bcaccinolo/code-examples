(ns hello.core
  (:use [hello.hellos :as hh])
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
