USING: combinators io kernel math math.parser random ;
IN: examples.numberguess

: hint ( answer guess -- hint )
  < "Too high!" "Too low!" ?
;

: correct? ( answer guess -- ? ) = ;

:: play ( get-guess show-message -- )
  100 random
  get-guess call
  [ 2dup correct? ] [
    2dup hint show-message call
    drop get-guess call
  ] until
  "Correct!" show-message call
  2drop
  inline
;
