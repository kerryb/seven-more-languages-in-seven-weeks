song = require "notation"

song.set_tempo(116)

local function append(destination, source)
  table.move(source, 1, #source, #destination + 1, destination)
end

local treble = {
  Rc,
}

local treble_section = {
  Rm, G4m,
  F4tq, E4tq, D4tq, C5m, G4c,

  F4tq, E4tq, D4tq, C5m, G4c,
  F4tq, E4tq, F4tq, D4m, Rc,
}

append(treble, treble_section)
append(treble, treble_section)

append(treble, {
    Rm, F4q, E4q, D4q, C4q,
    C4tq, D4tq, E4tq, D4c, Rm,
    Rm, F4q, E4q, D4q, C4q,

    G4c, D4m, Rc,
    Rm, F4q, E4q, D4q, C4q,
    C4tq, D4tq, E4tq, D4c, Rc, G4q, G4q,
  })

local bass_1 = {
  G3tq, G3tq, G3tq,
}

local bass_1_section = {
  C4m, Rm,
  C4c, C4dm,

  C4c, C4dm,
  Bf3c, C4m, G3q, G3q,
}

append(bass_1, bass_1_section)
append(bass_1, bass_1_section)

append(bass_1, {
    A3dc, A3q, Rm,
    A3m, B3c, G3q, G3q,
    A3dc, A3q, Rm,

    Bf3c, C4m, G3q, G3q,
    A3dc, A3q, Rm,
    A3m, B3c, Rq,
  })

local bass_2 = {
  Rc,
}

local bass_2_section = {
  Rs,
  A3c, G3dm,

  A3c, G3dm,
  Rc, G3m, Rc
}

append(bass_2, bass_2_section)
append(bass_2, bass_2_section)

append(bass_2, {
    Rs,
    Rs,
    Rs,

    Rc, G3m, Rc,
    Rs,
    Rs,
  })

song.part(treble)
song.part(bass_1)
song.part(bass_2)

song.go()
