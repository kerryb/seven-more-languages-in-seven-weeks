3 3 * 4 4 * + .s

USE: math.functions
3 sq 4 sq + sqrt

1 2 over swap

USE: ascii
"Kerry" "Hello " swap append >upper

{ 1 4  17 9 11 } 0 [ + ] reduce

! math.ranges is now ranges, and is used by default.
100 [1..b] 0 [ + ] reduce

10 [1..b] [ sq ] map 0 [ + ] reduce

42 [ 10 /i ] [ 10 mod ] bi

USE: math.parser
32768 number>string [ 1string string>number ] each
