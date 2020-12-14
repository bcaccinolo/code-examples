(ns list-affiliates.core
  
  (:require
   [ring.adapter.jetty :refer [run-jetty]])
  
  (:gen-class))
  
(require '[next.jdbc :as jdbc])
(require '[honeysql.helpers :refer :all :as helpers])
(require '[honeysql.core :as sql])

; datasource
(def db {:dbtype "postgresql"
         :dbname "benefiz-affiliates"
         :host "localhost"
         :user "benefiz"
         :password "benefiz"})

; db connexion
(def conn (jdbc/get-datasource db))

(def sqlmap
  {:select [:id]
   :from   [:affiliates]})

(def sql (sql/format sqlmap))

(jdbc/execute! conn sql)

(defn handler [request]

  (println request)

  {:status 200
   :headers {"Content-Type" "text/html"}
   :body "hello world"})


(defn -main
  "I don't do a whole lot ... yet."
  [& args]

  (println (jdbc/execute! conn sql))
  
  (run-jetty handler {:port 3000})
  
  )


