USING: kernel unicode ;
IN: examples.strings

: palindrome? ( string -- ? ) >upper dup reverse = ;
