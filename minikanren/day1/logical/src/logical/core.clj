(ns logical.core)

(use 'clojure.core.logic)
(use 'clojure.core.logic.pldb)

; medium exercise

(db-rel mano x)
(db-rel womano x)
(db-rel vitalo p s)
(db-rel turingo p y)
(db-rel systemo p s)
(db-rel languageo p l)

(def facts
  (db
    [mano :alan-turing]
    [womano :grace-hopper]
    [mano :leslie-lamport]
    [mano :alonzo-church]
    [womano :ada-lovelace]
    [womano :barbara-liskov]
    [womano :frances-allen]
    [mano :john-mccarthy]
    [vitalo :alan-turing :dead]
    [vitalo :grace-hopper :dead]
    [vitalo :leslie-lamport :alive]
    [vitalo :alonzo-church :dead]
    [vitalo :ada-lovelace :dead]
    [vitalo :barbara-liskov :alive]
    [vitalo :frances-allen :alive]
    [vitalo :john-mccarthy :dead]
    [turingo :leslie-lamport :2013]
    [turingo :barbara-liskov :2008]
    [turingo :frances-allen :2006]
    [turingo :john-mccarthy :1971]
    [systemo :alan-turing :ace]
    [languageo :grace-hopper :cobol]
    [systemo :leslie-lamport :latex]
    [systemo :alonzo-church :lambda_calculus]
    [languageo :barbara-liskov :clu]
    [languageo :barbara-liskov :argus]
    [systemo :frances-allen :acs]
    [languageo :john-mccarthy :lisp]))

(defn scientisto [x]
  (conde
    [(mano x)]
    [(womano x)]))

(defn turing-scientists []
  (with-db facts
    (run* [q]
          (scientisto q)
          (fresh [y] (turingo q y)))))

; hard exercises

(db-rel parento a b)

(def family-facts
  (db
    [parento :homer :bart]
    [parento :homer :lisa]
    [parento :homer :maggie]
    [parento :marge :bart]
    [parento :marge :lisa]
    [parento :marge :maggie]
    [parento :abe :homer]
    ))

(defn ancestoro [a b]
    (conde
      [(parento a b)]
      [(fresh [c] (parento c b) (ancestoro a c))]))

(defn all-ancestors [a]
  (with-db family-facts
    (run* [q] (ancestoro q a))))
