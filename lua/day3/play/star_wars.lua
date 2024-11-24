song = require "notation"

song.set_tempo(116)

treble = {
  Rc,

  Rm, G4m,
  F4tq, E4tq, D4tq, C5m, G4c,

  F4tq, E4tq, D4tq, C5m, G4c,
  F4tq, E4tq, F4tq, D4m, Rc,
}

bass_1 = {
  G3tq, G3tq, G3tq,

  C4m, Rm,
  C4c, C4dm,

  C4c, C4dm,
  Bf3c, C4m, G3q, G3q,
}

bass_2 = {
  Rc,

  Rs,
  A3c, G3dm,

  A3c, G3dm,
  Rc, G3m, Rc
}

song.part(treble)
song.part(bass_1)
song.part(bass_2)

song.go()
