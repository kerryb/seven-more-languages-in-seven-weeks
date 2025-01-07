USING: kernel math random combinators ;
IN: examples.numberguess

: init ( -- answer ) 100 random ;
: hint ( answer guess -- hint )
  {
    { [ 2dup > ] [ 2drop "Too low!" ] }
    { [ 2dup < ] [ 2drop "Too high!" ] }
    [ 2drop "Correct!" ]
  } cond
;

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
