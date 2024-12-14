USING: examples.strings tools.test ;
IN: examples.strings-tests

{ t } [ "racecar" palindrome? ] unit-test
{ f } [ "robot" palindrome? ] unit-test
