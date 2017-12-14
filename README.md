# Intelligent Christmas Tree <img src="ledtree.jpg" width="350" align="right"> 
**Christmas tree lights made out of WS2812B intelligent RGB leds and a NodeMCU**

## Introduction

So, no, it's not like this tree is going to do your Christmas shoppings anytime soon. But it does make for an interesting bright-colored ornament that will fit right into any room that needs intelligent lighting and bright-colored ornaments.

The frame of this Christmas tree comes from Ikea, a flat-packed metal thingy that extracts into a meter high spiral-shaped tree. Not that much to look at, but superb for mounting a string of WS2812B RGB leds. I'm sure likewise contraptions exist in all major shopping areas. I bought a reel with 5 meter WS2812B RGB leds from [BangGood](https://www.banggood.com/5M-45W-150SMD-WS2812B-LED-RGB-Colorful-Strip-Light-Waterproof-IP65-WhiteBlack-PCB-DC5V-p-1035640.html?rmmds=search&cur_warehouse=CN), of the type with 150 leds per 5 meter. There's also 300/5 meter available. As it happens, the metal spiral is exactly 5 meters long, so the string of leds fits really well.

I also used a NodeMCU (you saw that comming) and a cheap 3 amps 5 volt USB adapter, plus a breadboard, some wire and an external USB chassis part. The string of WS2812B leds is powered from the adapter via the external USB chassis part. The NodeMCU is also connected to the adapter. A (one) data wire connects the NodeMCU with the first led.

## Hardware / wiring
<img src="wiring-diagram-xmastree.jpg" width="350" align="right"> The string of WS2812B leds has three wires on both ends. One end is 'the input', the other end 'the output'. Strings of leds can be interconnected, outputs to inputs. The input has a socket (female) connector, the output has a pinned (male) connector. 

So, how do WS2812B leds work? WS2812B leds are a refinement of previous generation RGB leds, in that they have an integrated microprocessor that is addressed serially. So, there is a `5V`, `GND` and `DATA IN` input. Commands sent to the led contain RGB data (3 bytes), but also contain a device number, starting with `1`. When two or more WS2812B leds are interconnected (the output of the first connected to the input of the next, the output of the second connected to the input of the third, et cetera), you can address each led by referring to its sequence number. In effect, the first led is told what it and all other leds need to do. Cool, eh?

A string with 150 leds uses about 2,5 amps, much more than a NodeMCU can supply. Don't make the mistake of powering the leds through the USB connector of the NodeMCU: within a second a fume of smoke will signal the end of the NodeMCU (or more specific, the reverse-polarity-protection-diode that only allows about 500 mA). So, programming, with the USB cable connected to the NodeMCU, is done **without** the leds connected. 

Testing is done with the USB cable connected to an external USB socket that powers the leds and NodeMCU seperately, so that the large current for the string of leds does not flow through the reverse-polarity-protection-diode of the NodeMCU and fumes are reserved for more practical purposes.

## Software / lighting effects
Lets start off with a list of lighting features:
* **Countdown** From 1 december the tree counts down to 31 december; the tree is green to start with and each day from the top down more white comes down, i.e. the part white is (day-in-december / 31)
* **Rainbow** The tree is a rainbow, starting from red, gradually to violet
* **Signal** The tree signals tweets containing 'xmas', 'christmas', 'happy': the tree is green and at intervals white dots signal candles. The white dots flicker to signal the tweets
(software description coming real soon)
* **NewYear** Turns red and flashes random colors at random places from 0:00 to 0:01 at New Year
* **Auto** The tree scrolls through all lighting effects, turns off at 21:00 in the evening and turns on at 10:00 in the morning. Stays on to 01:00 at new year

