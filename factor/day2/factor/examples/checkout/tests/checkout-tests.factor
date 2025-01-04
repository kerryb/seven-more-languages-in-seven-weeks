USING: examples.checkout tools.test arrays ;

IN: examples.checkout.tests

{ 4998 } [ "7lang2" 2499 2 <cart-item> cart-item-price ] unit-test

: <sample-cart> ( -- cart ) 
  "7lang2" 2499 2 <cart-item> "noderw" 1099 1 <cart-item> 2array ;

{ 6097 } [ <sample-cart> cart-base-price ] unit-test

{ 3 } [ <sample-cart> cart-item-count ] unit-test

{ T{ checkout f 3 6097 f f f } }
  [ <sample-cart> <checkout> ]
  unit-test

{ T{ checkout f 3 6097 913 449 7459 } }
  [ <sample-cart> <checkout> sample-checkout ]
  unit-test

: <small-cart> ( -- cart ) "book" 2499 1 <cart-item> 1array ;
: <big-cart> ( -- cart ) "book" 2500 1 <cart-item> 1array ;

{ T{ checkout f 1 2499 499 500 3498 } }
  [ <small-cart> <checkout> uk-checkout ]
  unit-test

{ T{ checkout f 1 2500 500 0 3000 } }
  [ <big-cart> <checkout> uk-checkout ]
  unit-test
