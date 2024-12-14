USING: examples.strings tools.test ;
IN: examples.strings-tests

{ t } [ "racecar" palindrome? ] unit-test
{ f } [ "robot" palindrome? ] unit-test
{ t } [ "Racecar" palindrome? ] unit-test
{ t } [ "😎😺😎" palindrome? ] unit-test
