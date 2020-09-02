(ns api.db
  (:require   [honeysql.core :as sql]
              [honeysql.helpers :refer :all :as helpers]
              [next.jdbc :as jdbc]))

; datasource
(def db {:dbtype "postgresql" :dbname "friends" :host "localhost" :user "benefiz" :password "benefiz"})

(def conn (jdbc/get-datasource db))

(defn query-insert [nom prenom]
  (-> (insert-into :friends)
      (columns :nom :prenom)
      (values [[nom prenom]])
      sql/format))

(defn insert-friend [conn nom prenom]
  (let [query (query-insert nom prenom)]
    (jdbc/execute-one! conn query)))

(defn query-select []
  (-> (select :*)
      (from :friends)
      sql/format))

(query-select)

(defn select-friends [conn]
  (let [query (query-select)]
       (jdbc/execute! conn query)))

(insert-friend conn "Benoit" "Gros coucou")

(select-friends conn)
