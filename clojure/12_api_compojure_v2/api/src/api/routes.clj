(ns api.routes
  (:require
   [clojure.pprint :refer [pprint]]
   [ring.util.response :refer [response]]
   )
  )

(defn echo-route [req]
  (pprint req)
  (pprint (dissoc req :async-channel))

  {:status 200
   :headers {"Content-Type" "application/json"}
   :body (dissoc req :async-channel)})

(defn get-friends-route [req]
  {:status 200
   :headers {"Content-Type" "application/json"}
   :body (dissoc req :async-channel)})

(defn add-friend-route [req]
{:status 200
 :headers {"Content-Type" "application/json"}
 :body (dissoc req :async-channel)})
