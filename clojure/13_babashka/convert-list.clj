#!/home/benoit/bin/bb

;; https://www.karimarttila.fi/clojure/2020/09/01/using-clojure-in-command-line-with-babashka.html

(def argument (first *command-line-args*))

(->> argument
     (#(str/split % #", "))
     (map #(str "\"" % "\""))
     (str/join ", ")
     println
     )