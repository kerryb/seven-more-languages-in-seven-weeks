USING: examples.checkout tools.test arrays ;

IN: examples.checkout.tests

{ 49.98 } [ "7lang2" 24.99 2 <cart-item> cart-item-price ] unit-test

: <sample-cart> ( -- cart ) 
  "7lang2" 24.99 2 <cart-item> "noderw" 10.99 1 <cart-item> 2array ;

{ 60.97 } [ <sample-cart> cart-base-price ] unit-test

{ 3 } [ <sample-cart> cart-item-count ] unit-test

{ T{ checkout f 3 60.97 f f f } }
  [ <sample-cart> <checkout> ]
  unit-test

{ T{ checkout f 3 60.97 9.13 4.49 74.59 } }
  [ <sample-cart> <checkout> sample-checkout ]
  unit-test

: <small-cart> ( -- cart ) "book" 24.99 1 <cart-item> 1array ;
: <big-cart> ( -- cart ) "book" 25.00 1 <cart-item> 1array ;

{ T{ checkout f 1 24.99 4.99 5.00 34.98 } }
  [ <small-cart> <checkout> uk-checkout ]
  unit-test

{ T{ checkout f 1 25.00 5.00 0.00 30.00 } }
  [ <big-cart> <checkout> uk-checkout ]
  unit-test
