rates
=====

perl script that converts IMGA rates xml table to xls, and xls to IMGA rates xml


HOW TO:
-------
Copy IMGA rates xml table to a txt file.

Switches:
-makexls: makes a easy to read and formated xls file from rates xml table
-makexml: makes xml table from xls file

Examples:

rates -makexls filein.txt fileout.xls

rates -makexml filein.xls (prints to stdout)

rates -makexml filein.xls > fileout.txt (prints to fileout)