USING: kernel accessors locals
  math math.order math.functions math.parser
  sequences sequences.repeating ;

IN: examples.checkout

TUPLE: cart-item name price quantity ;
TUPLE: checkout item-count base-price taxes shipping total-price ;

: <cart-item> ( name price quantity -- cart-item ) cart-item boa ;
: <unknown-cart-item> ( name -- cart-item ) "Unknown item" swap 1 <cart-item> ;

: sum ( seq -- n ) 0 [ + ] reduce ;
: cart-item-count ( cart -- count ) [ quantity>> ] map sum ;
: cart-item-price ( cart-item -- price ) [ price>> ] [ quantity>> ] bi * ;
: cart-base-price ( cart -- price ) [ cart-item-price ] map sum ;
: discount-cart-item ( cart percentage -- cart ) 100 swap - 100 / swap [ * ] change-price ;

: <base-checkout> ( item-count base-price -- checkout )
  f f f checkout boa ;

: <checkout> ( cart -- checkout )
  [ cart-item-count ] [ cart-base-price ] bi <base-checkout> ;

CONSTANT: gst-rate 0.05
CONSTANT: pst-rate 0.09975

: gst-pst ( price -- taxes ) [ gst-rate * ] [ pst-rate * ] bi + ;

: taxes ( checkout taxes-calc -- taxes )
  [ dup base-price>> ] dip
  call >>taxes ; inline

CONSTANT: base-shipping 1.49
CONSTANT: per-item-shipping 1.00

: per-item ( checkout -- shipping ) per-item-shipping * base-shipping + ;

: shipping ( checkout shipping-calc -- shipping )
  [ dup item-count>> ] dip
  call >>shipping ; inline

: total ( checkout -- total-price ) dup
  [ base-price>> ] [ taxes>> ] [ shipping>> ] tri + + >>total-price ;

: sample-checkout ( checkout -- checkout )
  [ gst-pst ] taxes [ per-item ] shipping total ;
