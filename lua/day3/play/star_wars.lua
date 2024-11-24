song = require "notation"

song.set_tempo(116)

local treble = {
  Rc,
}

local treble_section = {
  Rm, G4m,
  F4tq, E4tq, D4tq, C5m, G4c,

  F4tq, E4tq, D4tq, C5m, G4c,
  F4tq, E4tq, F4tq, D4m, Rc,
}

table.move(treble_section, 1, #treble_section, #treble + 1, treble)
table.move(treble_section, 1, #treble_section, #treble + 1, treble)

local bass_1 = {
  G3tq, G3tq, G3tq,
}

local bass_1_section = {
  C4m, Rm,
  C4c, C4dm,

  C4c, C4dm,
  Bf3c, C4m, G3q, G3q,
}

table.move(bass_1_section, 1, #bass_1_section, #bass_1 + 1, bass_1)
table.move(bass_1_section, 1, #bass_1_section, #bass_1 + 1, bass_1)

local bass_2 = {
  Rc,
}

local bass_2_section = {
  Rs,
  A3c, G3dm,

  A3c, G3dm,
  Rc, G3m, Rc
}

table.move(bass_2_section, 1, #bass_2_section, #bass_2 + 1, bass_2)
table.move(bass_2_section, 1, #bass_2_section, #bass_2 + 1, bass_2)

song.part(treble)
song.part(bass_1)
song.part(bass_2)

song.go()
