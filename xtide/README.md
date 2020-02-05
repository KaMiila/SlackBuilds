** This script will auto download all source files and check them with an MD5SUM which I have provided since the developers do not provide an MD5SUM.**

**DANGER: NOT FOR NAVIGATION**

** DO NOT RELY ON THIS DATA FILE FOR DECISIONS THAT CAN RESULT IN HARM TO ANYONE OR ANYTHING.**


The above warning does not come from me, it comes from the developers.  Please heed their warnings, and be safe, for the NSA is always watching you.

## IMPORTANT
ALWAYS check with your local authority first before venturing out on the beach or on the open waters.  This will not warn you against tsunamis!  This is only a tide prediction table, it is not authoritative.

XTide is a package that provides tide and current predictions in a wide variety of formats.  Graphs, text listings, and calendars can be generated, or a tide clock can be provided on your desktop.

XTide can work with X-windows, plain text terminals, or the web.  This is accomplished with three separate programs:  the interactive interface (xtide), the non-interactive or command-line interface (tide), and the web interface (xttpd).  (This script will not build the web interface xttpd as most will probably never use or want it, if you want it please read the provided documentation on how to enable it.

The algorithm that XTide uses to predict tides is the one used by the National Ocean Service in the U.S.  It is significantly more accurate than the simple tide clocks that can be bought in novelty stores.  However, it takes more to predict tides accurately than just a spiffy algorithm—you also need some special data for each and every location for which you want to predict tides.  XTide reads these data from harmonics files.

**This script will automatically install the free version of the harmonics file.
All data for the U.S. and associated locales available from the National Ocean
Service web site as of 2014-12-16.  For a list of all locations please visit
[flaterco][flaterco].**

This script will also automatically install World Vector Shoreline data.  These files were published on the National Geophysical Data Center (NGDC) 5-Minute Gridded Global Relief Data CD-ROM (ETOPO5), 1993, and are public domain.

## DEPENDENCIES
[libtcd][libtcd] - found on my gitrepo https://github.com/KaMiila

[flaterco]: http://www.flaterco.com/xtide/locations.html
[libcd]: https://github.com/KaMiila/SlackBuilds/libtcd
