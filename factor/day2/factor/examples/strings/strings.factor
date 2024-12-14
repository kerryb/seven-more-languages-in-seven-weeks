USING: kernel ;
IN: examples.strings

: palindrome? ( string -- ? ) dup reverse = ;
