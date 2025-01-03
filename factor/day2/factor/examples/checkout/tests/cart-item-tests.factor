USING: examples.checkout tools.test ;

IN: examples.checkout.tests

{ T{ cart-item f "Unknown item" 1.23 1 } }
  [ 1.23 <unknown-cart-item> ]
  unit-test
