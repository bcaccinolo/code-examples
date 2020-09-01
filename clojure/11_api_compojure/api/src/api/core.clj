(ns api.core
  (:require [ring.adapter.jetty :refer [run-jetty]]
            [clojure.pprint     :refer [pprint]]
            [compojure.core     :refer [routes GET POST]]
            [compojure.route    :refer [not-found]]
            [ring.middleware.json :refer [wrap-json-response wrap-json-body]]
            [ring.util.response   :refer [response]]
            )
  (:gen-class))

(defn handler [request]

  (pprint request)

  {:status 200
   :headers {"Content-Type" "text/html"}
   :body "hello world"
   }
  )

(def my-routes
  (routes
   (GET  "/endpoint-a"  [] (response {:foo "bar"}))
   (GET  "/endpoint-b"  [] "<h1>Hello endpoint B</h1>")
   (POST "/debug" request (response (with-out-str (pprint request))) )
   (not-found "<h1>Page not found</h1>")))

(defn app [handler]
  (-> handler
      wrap-json-body
      wrap-json-response
      )
  )

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (run-jetty (app my-routes) {:port 3000})
  )
