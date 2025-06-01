# Day 1

```clojure
(run* [q]
  (membero q [1 2 3])
  (membero q [2 4 6]))

#_ (2)
```

```clojure
(run* [q]
  (appendo [1 2 3] [4 5 6] q))

#_ ((1 2 3 4 5 6))

(run* [q]
  (appendo [1 2 3] q [1 2 3 4 5 6]))

#_ ((4 5 6))
```
