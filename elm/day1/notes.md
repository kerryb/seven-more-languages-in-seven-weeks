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

the book shows `[1,2] : [number]`, but I get [1,2] : List number

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
