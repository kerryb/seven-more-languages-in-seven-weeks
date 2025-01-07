/* Run with `factor -run="examples.numberguess.gui"` */

USING: examples.numberguess io math.parser ;
IN: examples.numberguess.cli

: show-message ( message -- ) print ;

: get-guess ( -- guess ) 
  "Please guess:" print flush
  readln string>number
;

: main ( -- )
  init
  get-guess
  [ 2dup correct? ] [
    2dup hint show-message
    drop get-guess
  ] until
  "Correct!" show-message
  2drop
;

MAIN: main
