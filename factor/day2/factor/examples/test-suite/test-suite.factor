USING: tools.test io io.streams.null kernel namespaces sequences ;

IN: examples.test-suite

USE: examples.greeter
USE: examples.strings
USE: examples.sequences

: test-all-examples ( -- )
  [ "examples" test ] with-null-writer
  test-failures get
  dup empty? [ :test-failures "" print ] unless
  length number>string dup "1" = [ " test" ] [ " tests" ] if append
  " failed." append print
  ;

MAIN: test-all-examples
