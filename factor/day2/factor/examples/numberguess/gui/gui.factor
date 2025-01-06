USING: accessors examples.numberguess kernel ui ui.gadgets.labels ;
IN: examples.numberguess.gui

: show-message ( message -- ) drop ;
: get-guess ( -- guess ) 42 ;

MAIN-WINDOW: numberguess { { title "Number Guess" } }
  "Hello, world!" <label> >>gadgets ;
