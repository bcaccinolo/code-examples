(ns server.main
  (:require [clojure.core.async :as a :refer [>! <! go chan timeout]]))

; source http://swannodette.github.io/2013/07/12/communicating-sequential-processes

(def c (chan))
(go (while true
      (<! (timeout 500))
      (prn "coucou2")
      (>! c 1)))

(defn peekn [v n]
  (if (> (count v) n)
    (subvec v (- (count v) n))
    v))

(defn reload! []
  (println "Code updated."))

(defn main! []
  (println "App loaded!"))
