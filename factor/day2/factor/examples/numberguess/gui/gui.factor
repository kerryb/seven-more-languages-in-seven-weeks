USING: accessors examples.numberguess io kernel namespaces ui
  ui.gadgets ui.gadgets.alerts ui.gadgets.borders
  ui.gadgets.editors ui.gadgets.labels ui.gadgets.packs
  math.parser
  ;
IN: examples.numberguess.gui

SYMBOL: answer

: <numberguess-gadget> ( -- gadget )
  <pile> { 5 5 } >>gap
    <shelf> { 5 5 } >>gap
      "Guess a number:" <label> add-gadget
      [ string>number answer get-global swap hint [ ] swap alert ] <action-field> add-gadget
      add-gadget
    "" <label> add-gadget
  ;

MAIN-WINDOW: numberguess { { title "Number Guess" } }
  init answer set-global
  <numberguess-gadget> { 10 10 } <border> >>gadgets
  ;
