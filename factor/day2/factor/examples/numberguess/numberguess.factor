USING: kernel math random ;
IN: examples.numberguess

: init ( -- answer ) 100 random ;
: hint ( answer guess -- hint ) < "Too high!" "Too low!" ? ;
: correct? ( answer guess -- ? ) = ;

:: play ( get-guess show-message -- )
  init
  get-guess call
  [ 2dup correct? ] [
    2dup hint show-message call
    drop get-guess call
  ] until
  "Correct!" show-message call
  2drop
  inline
;
