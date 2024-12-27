USING: examples.sequences kernel math tools.test ;
IN: examples.sequences-tests

{ 16 } [ { 10 2 35 16 99 4 } [ 4 mod 0 = ] find-first ] unit-test
{ f } [ { 10 2 35 99 } [ 4 mod 0 = ] find-first ] unit-test
