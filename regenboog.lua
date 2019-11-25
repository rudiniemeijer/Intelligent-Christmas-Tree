-- regenbook.lua
-- Dit programma bestuurt een reeks WS2812B slimme RGB leds zodanig,
--   dat een regenboog-effect ontstaat (eerste led Rood, laatste led Violet)
-- Copyright (c) 2017 Rudi Niemeijer
-- Op dit programma is de MIT Open Source licentie van toepassing
 
leds = 150 -- Aantal leds, index 1..leds
kleuren = 3 -- GRB

ws2812.init(ws2812.MODE_SINGLE) -- D4/GPIO2
disp = ws2812.newBuffer(leds, kleuren)
disp:fill(0, 0, 0) -- hele display zwart maken
ws2812.write(disp) -- stuur leds aan

function kleur(h)
  local r, g, b = 0, 0, 0

  if h < 1 / 3 then
    r = 2 - h * 6
    g = h * 6
    b = 0
  elseif h < 2 / 3 then
    r = 0
    g = 4 - h * 6
    b = h * 6 - 2
  else
    r = h * 6 - 4
    g = 0
    b = (1 - h) * 6
  end
  if r > 1 then
    r = 1
  end
  if g > 1 then
    g = 1
  end
  if b > 1 then
    b = 1
  end
  r = r * 255
  g = g * 255
  b = b * 255
  return string.char(g, r, b)
end

function display()
  disp:fill(0, 0, 0) -- hele display zwart maken
  kleurStap = 1 / leds
  kleurWaarde = 0
  for i = 1, leds do
    kleurWaarde = kleurWaarde + kleurStap
    disp:set(i, kleur(kleurWaarde))
  end  
  ws2812.write(disp) -- stuur leds aan
end

display()
