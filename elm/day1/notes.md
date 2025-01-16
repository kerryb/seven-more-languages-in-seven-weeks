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

How do you compile an Elm program?

`elm make <filename>`

Where would you go for Elm support?

https://elm-lang.org/community

```elm
product list = List.foldl (*) 1 list
eastings point_list = List.map (\point -> point.x) point_list
```
