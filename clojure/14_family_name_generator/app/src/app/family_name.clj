(ns app.family-name)

(def debuts ["dog" "cat" "stone" "gold" "hyper"])

(def fins ["sky" "stein" "gar" "man"])

(defn generator [list-start list-end]
  (let [
        start (rand-nth list-start)
        end (rand-nth list-end)
        ]
    (str start end)
    ))

(defn generate []
  (generator debuts fins))
