(ns app.core
  (:gen-class))

(require '[app.family-name :as family])

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  
(println (family/generate))
  
(println "Hello, World!"))
