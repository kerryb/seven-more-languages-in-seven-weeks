USING: examples.checkout tools.test ;

IN: examples.checkout.tests

{ T{ cart-item f "Unknown item" 123 1 } }
  [ 123 <unknown-cart-item> ]
  unit-test

{ T{ cart-item f "Unknown item" 150 1 } }
  [ T{ cart-item f "Unknown item" 200 1 } 25 discount-cart-item ]
  unit-test
