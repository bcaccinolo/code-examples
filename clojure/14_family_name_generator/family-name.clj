#!/home/benoit/bin/bb

(def debuts ["dog" "cat" "horse" "frog" "stone"
             "gold" "hyper"])

(def fins ["sky" "stein" "gar" "man"])

(defn generator [list-start list-end]
  (let [start (rand-nth list-start)
        end (rand-nth list-end)]
    (str/capitalize (str start end))
    ))

(defn generate []
  (generator debuts fins))

(println (generate))
