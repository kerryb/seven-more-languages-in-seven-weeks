USING: examples.checkout tools.test ;

IN: examples.checkout.tests

{ T{ cart-item f "Unknown item" 1.23 1 } }
  [ 1.23 <unknown-cart-item> ]
  unit-test

{ T{ cart-item f "Unknown item" 1.50 1 } }
  [ T{ cart-item f "Unknown item" 2.00 1 } 25 discount-cart-item ]
  unit-test
