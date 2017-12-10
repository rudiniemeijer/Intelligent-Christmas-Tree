# Intelligent Christmas Tree <img src="ledtree.jpg" width="350" align="right"> 
**Christmas tree lights made out of WS2812B intelligent RGB leds and a NodeMCU**

## Introduction

So, no, it's not like this tree is going to do your Christmas shoppings anytime soon. But it does make for an interesting bright-colored ornament that will fit right into any room that needs intelligent lighting and bright-colored ornaments.

The frame of this Christmas tree comes from Ikea, a flat-packed metal thingy that extracts into a meter high spiral-shaped tree. Not that much to look at, but superb for mounting a string of WS2812B RGB leds. I'm sure likewise contraptions exist in all major shopping areas. I bought a reel with 5 meter WS2812B RGB leds from BangGood, of the type with 150 leds per 5 meter. There's also 300/5 meter available. As it happens, the metal spiral is exactly 5 meters long, so the string of leds fits really well.

I furthermore used a NodeMCU (you saw that comming) and a cheap 3 amps 5 volt USB adapter, plus a breadboard, some wire and an external USB chassis part. The string of WS2812B leds is powered from the adapter via the external USB chassis part. The NodeMCU is also connected to the adapter. A (one) data wire connects the NodeMCU with the first led.

## Software / lighting effects


