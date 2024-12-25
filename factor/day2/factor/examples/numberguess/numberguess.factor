USING: combinators io kernel math math.parser random ;
IN: examples.numberguess

: report ( answer guess -- answer guess )
  2dup < [ "Too high!" ] [ "Too low!" ] if print
;

: get-guess ( answer -- answer guess ) 
  "Please guess:" print flush
  readln string>number
;

: correct? ( answer guess -- answer guess ? ) 2dup = ;

: main ( -- )
  100 random
  get-guess
  [ correct? ] [ report drop get-guess ] until
  "Correct!" print
  [ drop ] bi@
;

MAIN: main
