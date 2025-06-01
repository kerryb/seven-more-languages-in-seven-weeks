(ns logical.core-test
  (:require [clojure.test :refer :all]
            [logical.core :refer :all]))

(deftest turing-test ; not that one
  (testing "turing finds all turing award winning scientists"
    (is (=
         '(:barbara-liskov :frances-allen :john-mccarthy :leslie-lamport)
         (sort (turing-scientists))))))
