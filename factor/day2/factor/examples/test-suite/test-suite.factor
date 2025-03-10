USING: command-line io io.streams.null kernel math math.parser
  multiline namespaces sequences tools.annotations tools.test
  vocabs ;

IN: tools.test

SYMBOL: unit-test-count
0 unit-test-count set-global

: annotate-with-count ( word -- )
  [ [ unit-test-count get 1 + unit-test-count set-global ] compose ] annotate ;

\ unit-test annotate-with-count

IN: examples.test-suite

command-line get { "-i" } = [
  "-"
  [ dup "" = not ]
    [ drop "Enter a vocabulary to test (hit return when done)" print flush readln dup ]
    produce but-last nip
] [
  { "examples.greeter" "examples.strings" "examples.sequences" "examples.fizzbuzz" "examples.checkout" }
] if
  [ require ] each

: test-all-examples ( -- )
  [ "examples" test ] with-null-writer
  test-failures get empty? [ :test-failures "" print ] unless
  test-failures get length number>string dup "1" = " test" " tests" ? append
    " out of " append
    unit-test-count get number>string append
    " failed." append print
  ;

MAIN: test-all-examples
