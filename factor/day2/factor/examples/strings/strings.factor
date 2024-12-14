USING: kernel sequences unicode ;
IN: examples.strings

: palindrome? ( string -- ? ) >upper dup reverse = ;
