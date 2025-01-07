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
