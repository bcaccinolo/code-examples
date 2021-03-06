(ns zang.config
  (:require [cljs.nodejs :as node]
            [zang.log :as log :refer [info error]]
            [quile.component :as component]))

(def --dirname (js* "__dirname"))
(def config (atom nil))

(defrecord ConfigComponent [-config]
  component/Lifecycle

  (start [this]
    (info ";; Starting ConfigComponent")
    this)
  (stop [this]
    (info ";; Stopping ConfigComponent")
    this))

(defn new-config [cfg]
  (map->ConfigComponent {:-config cfg}))

(defn load-config
  []
  (let [config-path (or (-> node/process.env
                            js->clj
                            :CONFIG)
                        "../resources/config/development")]
    (reset! config (-> config-path
                       node/require
                       (js->clj :keywordize-keys true)
                       :config))))
