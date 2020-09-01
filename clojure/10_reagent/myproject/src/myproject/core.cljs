(ns myproject.core
    (:require
      [reagent.core :as r]
      [reagent.dom :as d]))

;; -------------------------
;; Views

(defn hello []
  [:p "hello"]
  )

(defn home-page []
  [:div
   [:h2 "Welcome to Reagent"]
   [hello]
   ]
  )

;; -------------------------
;; Initialize app

(defn mount-root []
  (d/render [home-page] (.getElementById js/document "app")))

(defn init! []
  (mount-root))
