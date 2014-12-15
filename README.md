rates
=====

perl script that converts IMGA rates xml table to xls, and xls to IMGA rates xml


HOW TO:
-------
Copy IMGA rates xml table to a txt file and run script to make xls.

Switches:
---------

-makexls: makes a easy to read and formated xls file from rates xml table

-makexml: makes xml table from xls file

Examples:
---------
>$ perl rates.pl -makexls filein.txt fileout.xls

>$ perl rates.pl -makexml filein.xls (prints to stdout)

>$ perl rates.pl -makexml filein.xls > fileout.txt (prints to fileout)

Screenshot
----------
Blurred to hide private data
![rates Screenshot1]
(http://i.imgur.com/tZzIEiY.png)