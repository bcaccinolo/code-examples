#!/home/benoit/bin/bb

;; https://www.karimarttila.fi/clojure/2020/09/01/using-clojure-in-command-line-with-babashka.html

;; read the file path of the CSV from the command line args
(def argument (first *command-line-args*))

(->> argument
     (#(str/split % #", "))
     (map #(str "\"" % "\""))
     (str/join ", ")
     println
     )