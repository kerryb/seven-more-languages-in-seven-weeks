USING: kernel combinators math.parser random ;
IN: examples.numberguess

: get-guess ( -- guess ) 
  [ dup ] bi@ < [ "Too high!" ] [ "Too low!" ] print
  "Please guess:" print flush
  readln string>number
;

: correct? ( answer guess -- answer ? ) over = ;

: main ( -- )
  10 random -1 f
  [ correct? ] [ drop drop get-guess ] until
  drop drop
;

MAIN: main
