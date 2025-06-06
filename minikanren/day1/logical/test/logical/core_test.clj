(ns logical.core-test
  (:require [clojure.test :refer :all]
            [logical.core :refer :all]
            ))


(deftest turing-scientists-test
  (testing "turing finds all turing award winning scientists"
    (is (=
         '(:barbara-liskov :frances-allen :john-mccarthy :leslie-lamport)
         (sort (turing-scientists))))))

(deftest genealogy-test
  (testing "all-ancestors returns all ancestors"
    (is (= '(:abe :homer :marge) (sort (all-ancestors :bart))))))
