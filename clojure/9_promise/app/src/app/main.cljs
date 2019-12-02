(ns app.main
  (:require
   [cljs.core.async :refer [go put! chan <!]]))

; The returned value is put on a 'chan'. 
; The 'chan' is then returned. 
(defn async [promise]
  (let [c (chan)
        resolver (fn [v] (put! c v))]
    (.then promise resolver)
    c))

(def promise1 (new js/Promise (fn [res _rej] (js/setTimeout #(res 42) 5000))))
(def promise2 (new js/Promise (fn [res _rej] (js/setTimeout #(res 67) 2000))))

(defn init []
  (go
    (prn (<! (async promise1)))
    (prn (<! (async promise2)))))

(defn main! []
  (println "[main]: loading")
  (init))

(defn reload! []
  (println "[main] reloaded:")
  (init))
