xml-to-xls
=====

perl script that converts xml table to xls file, and xls to xml

Turn this 
```
<table id="TableName">
	<row name="RowName">
		<key>RowName0</key>
		<key>RowName1</key>
		<key>RowName2</key>
		<key>RowName3</key>
		<key>RowName4</key>
		<key>RowName5</key>
		<key>RowName6</key>
		<key>RowName7</key>
		<key>RowName8</key>
		<key>RowName9</key>
	</row>
	<column name="TypeName">
		<key>Names</key>
		<key>Rate1</key>
		<key>Rate2</key>
		<key>Rate3</key>
	</column>
	<data>
		<values><value>name0</value><value>1</value><value>2</value><value>3</value></values>
		<values><value>name1</value><value>4</value><value>5</value><value>6</value></values>
		<values><value>name2</value><value>7</value><value>8</value><value>9</value></values>
		<values><value>name3</value><value>10</value><value>11</value><value>12</value></values>
		<values><value>name4</value><value>13</value><value>14</value><value>15</value></values>
		<values><value>name5</value><value>16</value><value>17</value><value>18</value></values>
		<values><value>name6</value><value>19</value><value>20</value><value>21</value></values>
		<values><value>name7</value><value>22</value><value>23</value><value>24</value></values>
		<values><value>name8</value><value>25</value><value>26</value><value>27</value></values>
		<values><value>name9</value><value>28</value><value>29</value><value>30</value></values>
	</data>
</table>
```

Into this and vice versa

![rates Screenshot1]
(http://i.imgur.com/by9H18U.png)


HOW TO:
-------
Copy xml table to a txt file and run script to make xls.

Switches:
---------

-makexls: makes a easy to read and formated xls file from rates xml table

-makexml: makes xml table from xls file

Example Invocations:
---------
>$ perl rates.pl -makexls filein.txt fileout.xls

>$ perl rates.pl -makexml filein.xls (prints to stdout)

>$ perl rates.pl -makexml filein.xls > fileout.txt (prints to fileout)
