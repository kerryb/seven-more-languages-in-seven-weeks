USING: tools.test io io.streams.null kernel namespaces sequences ;
USE: examples.greeter
USE: examples.strings
USE: examples.sequences
IN: examples.test-suite

: test-all-examples ( -- )
  [ "examples" test ] with-null-writer
  test-failures get empty?
  [ "All tests passed." print ] [ :test-failures ] if ;

MAIN: test-all-examples
