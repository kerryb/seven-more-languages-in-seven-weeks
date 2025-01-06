USING: examples.numberguess io math.parser ;
IN: examples.numberguess.cli

: show-message ( message -- ) print ;

: get-guess ( -- guess ) 
  "Please guess:" print flush
  readln string>number
;

: main ( -- )
  [ get-guess ] [ show-message ] play
;

MAIN: main
