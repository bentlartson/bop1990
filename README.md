# bop1990
Balance of Power: The 1990 Edition

## Overview
This is a port of the classic Cold War geopolitical strategy game 'Balance of Power: The 1990 Edition', written by Chris Crawford and released in 1988 for the Macintosh.  It was a follow-up to the original 'Balance of Power' game, which was released in 1985.  The game has been ported from Macintosh Lightspeed Pascal to Free Pascal so that it can be compiled and run on a modern operating system without the need for any emulators or virtual environments.

For more information on the game, it's history, development, and reception when it was originally released, please see the Wikipedia page: https://en.wikipedia.org/wiki/Balance_of_Power_(video_game)

For those new to the game, the manual can be found floating around online in PDF format.  It's suggested that you at least skim this once before attempting to play since there's no in-game tutorial or help.

## Image Gallery

![Screenshot1](http://www.blarworld.net/bop1990-1.png)

![Screenshot2](http://www.blarworld.net/bop1990-2.png)

![Screenshot1](http://www.blarworld.net/bop1990-3.png)

## Conversion Notes

The original Lightspeed Pascal source code uses event loop polling for processing GUI events.  All of this logic has been converted to an event-driven model - that means a decent amount of code had to be reworked.  A typical example would be where the code would loop within a single function, polling for button click events at the end of each iteration.  Code like this needed to be reworked so that the loop itself was no longer present, and the logic that was formerly inside the loop would now be in its own function that would be called each time a button click event occurred.

Hopefully I found all the bugs that I introduced while doing this conversion but realistically I probably didn't. :)

## UI/Presentation Conversion Notes

The game is based on v2.08 of the Macintosh code but I also used the Windows version for reference and several changes were incorporated from that version - for example the verbiage change from 'men' to 'troops', the larger country name headers, and some other minor look-and-feel related changes.  The main game screen is presented in a 1.5x (or 2.0x) scaled size compared to the original Mac version, which works out pretty well because the game map is all vector-based anyway.  The jagginess of the map does start to become more noticable with the higher resolution, though.

## Final Notes

Note that original Mac or Windows Balance of Power 1990 save files are not compatible with this release, so unfortunately you can't load up your save game from 35 years ago and resume play. :)