(ns app.main
  (:require
   [goog.dom :as dom]
   [goog.events :as events]
   [cljs.core.async :refer [go put! chan <!]])

  (:import [goog.net Jsonp]
           [goog Uri]
           [goog.html TrustedResourceUrl]
           [goog.string Const]))

(def wiki-search-url
  "http://en.wikipedia.org/w/api.php?action=opensearch&format=json&search=")

(defn listen [el type]
  (let [out (chan)]
    (events/listen el type
                   (fn [e] (put! out e)))
    out))

(defn jsonp [uri]
  (let [out (chan)
        req (->> uri
                 (.from Const)
                 (.fromConstant TrustedResourceUrl)
                 (Jsonp.))]
    (.send req nil (fn [res] (put! out res)))
    out))

(defn query-url [q]
  (str wiki-search-url q))

(defn user-query []
  (.-value (dom/getElement "query")))

(defn render-query [results]
  (str
   "<ul>"
   (apply str
          (for [result results]
            (str "<li>" result "</li>")))
   "</ul>"))

(defn init []
  (let [clicks (listen (dom/getElement "search") "click")
        results-view (dom/getElement "results")]
    (go (while true
          (<! clicks)
          (prn "clicked")
          (let [[_ results] (<! (jsonp (query-url (user-query))))]
            (set! (.-innerHTML results-view) (render-query results)))))))

(defn main! []
  (println "[main]: loading")
  (init))

(defn reload! []
  (println "[main] reloaded:")
  (init))





