## Changes between the book (0.14) and current (0.19):

### Multi-line ifs

This doesn’t work any more:

```elm
> if | x < 0 -> "too small" \
     | x > 0 -> "too big" \
     | otherwise -> "just right"
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
