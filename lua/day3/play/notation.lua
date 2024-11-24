local scheduler = require "scheduler"

local function note(letter, octave)
  local notes = {
    C = 0, Cs = 1, Df = 1, D = 2, Ds = 3, Ef = 3, E = 4, F = 5,
    Fs = 6, Gf = 6, G = 7, Gs = 8, Af = 8, A = 9, As = 10, Bf = 10, B = 11,
  }

  local notes_per_octave = 12

  return (octave + 1) * notes_per_octave + notes[letter]
end

local tempo = 100

local function duration(value)
  local quarter = 60 / tempo
  local durations = {
    -- US style (half, quarter, quarter dotted etc)
    h = 2, qd = 3/2, q = 1, ed = 3/4, e = 1/2, s = 1/4,
    -- UK style (semibreve, dotted minim, minim, triplet minim, dotted
    -- crotchet, crotchet, triplet crotchet etc). More complete than the US
    -- ones above.
    s = 4, dm = 3, m = 2, tm = 4/3, dc = 3/2, c = 1, tc = 2/3,
    dq = 3/4, q = 1/2, tq = 1/3, dsq = 3/8, sq = 1/4, tsq = 1/6,
  }
  return durations[value] * quarter
end

local function parse_note(s)
  local letter, octave, value = string.match(s, "([A-Gsf]+)(%d+)(%a+)")
  local rest_value = string.match(s, "R(%a+)")

  if letter and octave and value then
    return {
      note = note(letter, octave),
      duration = duration(value)
    }
  elseif rest_value then
    return {
      note = "rest",
      duration = duration(rest_value)
    }
  else
    return nil
  end
end

local NOTE_DOWN = 0x90
local NOTE_UP = 0x80
local VELOCITY = 0x7f

local function play(note, duration)
  if note == "rest" then
    scheduler.wait(duration)
  else
    midi_send(NOTE_DOWN, note, VELOCITY)
    scheduler.wait(duration)
    midi_send(NOTE_UP, note, VELOCITY)
  end
end

local function part(t)
  local function play_part()
    for i = 1, #t do
      play(t[i].note, t[i].duration)
    end
  end

  scheduler.schedule(0.0, coroutine.create(play_part))
end

local function set_tempo(bpm)
  tempo = bpm
end

local function go()
  scheduler.run()
end

local mt = {
  __index = function(t, s)
    local result = parse_note(s)
    return result or rawget(t, s)
  end
}

setmetatable(_G, mt)

return {
  parse_note = parse_note,
  play = play,
  part = part,
  set_tempo = set_tempo,
  go = go
}
