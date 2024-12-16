USING: combinators io kernel math math.parser random ;
IN: examples.numberguess

: get-guess ( answer previous-guess -- answer guess ) 
  over > [ "Too high!" ] [ "Too low!" ] if print
  "Please guess:" print flush
  readln string>number
;

: correct? ( answer guess -- answer guess ? ) 2dup = ;

: main ( -- )
  100 random -1
  [ correct? ] [ get-guess ] until
  "Correct!" print
  [ drop ] bi@
;

MAIN: main
