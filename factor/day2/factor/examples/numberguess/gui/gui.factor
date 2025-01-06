USING: accessors examples.numberguess kernel io
  ui ui.gadgets ui.gadgets.labels ui.gadgets.editors
  ui.gadgets.packs ui.gadgets.borders ui.gadgets.alerts
  ;
IN: examples.numberguess.gui

: show-message ( message -- ) drop ;
: get-guess ( -- guess ) 42 ;

: init ( -- gadget )
  <pile> { 5 5 } >>gap
    <shelf> { 5 5 } >>gap
      "Guess a number:" <label> add-gadget
      [ [ ] swap alert ] <action-field> add-gadget
      add-gadget
    "" <label> add-gadget
  ;

MAIN-WINDOW: numberguess { { title "Number Guess" } }
  init { 10 10 } <border> >>gadgets
  ;
