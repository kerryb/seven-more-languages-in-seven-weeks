## Changes between the book (0.14) and current (0.19):

### Multi-line ifs

This doesn’t work any more:

```elm
> if | x < 0 -> "too small" \
     | x > 0 -> "too big" \
     | otherwise -> "just right" -- DOES NOT WORK
```

```elm
if x < 0 then
    "too small"
else
    if x > 0 then
        "too big"
    else
        "just right"
```

Also there no longer seems to be a need to put a `\` on the end of continuation
lines in the repl.

### Types reported differently

The book shows `[1,2] : [number]`, but I get `[1,2] : List number`

Later on the book has:

```elm
> List.filter (\x -> x < 3) [1..20]
[1,2] : List comparable
```

But that’s now:

```elm
> List.filter (\x -> x < 3) (List.range 1 20)
[1,2] : List Int
```

### Records

Instead of creating a new record based on an existing one like this:

```elm
whiteQueen = { blackQueen | color <- White } -- DOES NOT WORK
```

you now need to use an `=`:

```elm
whiteQueen = { blackQueen | color = White }
```

You can no longer add fields when updating records, so this doesn’t work:

```elm
homeWhiteQueen = { whiteQueen | position = position } -- DOES NOT WORK
```

You can’t remove fields either:

```elm
colorAndPosition = { homeWhiteQueen - piece } -- DOES NOT WORK
```

### Ranges

The `[a..b]` syntax has been replaced by `List.range a b`.

### Compile-time rejection of incomplete functions

The book describes a potential runtime error from defining functions that don’t
match all possible patterns (eg `first (head::tail) = head`), but this is now
rejected, with a suggestion to use a case statement instead.

## Exercises

### Easy

How do you compile an Elm program?

`elm make <filename>`

Where would you go for Elm support?

https://elm-lang.org/community

```elm
product list = List.foldl (*) 1 list
eastings point_list = List.map (\point -> point.x) point_list
```

```elm
{ name = "Wallace", age = 50, address = {
  number = 62, street = "West Wallaby Street", city = "Wigan", country = "UK" }
}
```

Seems easier to use a record (as above), because all the field names and types
are inferred automatically.

### Medium

```elm
> multiply a b = a * b
<function> : number -> number -> number
> (multiply 6) 8
48 : number
```

```elm
> gromit = { name = "Gromit", age = 5, address = { number = 62, street = "West Wallaby Street", city = "Wigan", country = "UK" } }
{ address = { city = "Wigan", country = "UK", number = 62, street = "West Wallaby Street" }, age = 5, name = "Gromit" }
    : { address :
            { city : String, country : String, number : number, street : String }
      , age : number1
      , name : String
      }

> feathers = { name = "Feathers McGraw", age = 20, address = { number = 42, street = "The Zoo", city = "Wigan", country = "UK" } }
{ address = { city = "Wigan", country = "UK", number = 42, street = "The Zoo" }, age = 20, name = "Feathers McGraw" }
    : { address :
            { city : String, country : String, number : number, street : String }
      , age : number1
      , name : String
      }

> people = [wallace, gromit, feathers]
[{ address = { city = "Wigan", country = "UK", number = 62, street = "West Wallaby Street" }, age = 50, name = "Wallace" },{ address = { city = "Wigan", country = "UK", number = 62, street = "West Wallaby Street" }, age = 5, name = "Gromit" },{ address = { city = "Wigan", country = "UK", number = 42, street = "The Zoo" }, age = 20, name = "Feathers McGraw" }]
    : List
          { address :
                { city : String, country : String, number : number, street : String }
          , age : number1
          , name : String
          }

> older_than_16 list = List.filter (\person -> person.age > 16) list
<function> : List { a | age : number } -> List { a | age : number }

> older_than_16 people
[{ address = { city = "Wigan", country = "UK", number = 62, street = "West Wallaby Street" }, age = 50, name = "Wallace" },{ address = { city = "Wigan", country = "UK", number = 42, street = "The Zoo" }, age = 20, name = "Feathers McGraw" }]
    : List
          { address :
                { city : String, country : String, number : number1, street : String }
          , age : number
          , name : String
          }
```

### Hard

```elm
> wallace = { name = "Wallace", age = (Just 50)}
{ age = Just 50, name = "Wallace" }
    : { age : Maybe number, name : String }

> gromit = { name = "Gromit", age = (Just 8)}
{ age = Just 8, name = "Gromit" }
    : { age : Maybe number, name : String }

> feathers = { name = "Feathers McGraw", age = Nothing}
{ age = Nothing, name = "Feathers McGraw" }
    : { age : Maybe a, name : String }

> people = [wallace, gromit, feathers]
[{ age = Just 50, name = "Wallace" },{ age = Just 8, name = "Gromit" },{ age = Nothing, name = "Feathers McGraw" }]
    : List { age : Maybe number, name : String }

> older_than_16 list = List.filter (\person ->
|   case person.age of
|   Nothing -> False
|   Just age -> age > 16
|   ) list
|
<function>
    : List { a | age : Maybe number } -> List { a | age : Maybe number }

> older_than_16 people
[{ age = Just 50, name = "Wallace" }]
    : List { age : Maybe number, name : String }
```
