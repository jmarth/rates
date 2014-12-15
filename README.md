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


Turn this 
'''
<table id="TableName">
	<row name="County">
		<key>County0</key>
		<key>County1</key>
		<key>County2</key>
		<key>County3</key>
		<key>County4</key>
		<key>County5</key>
		<key>County6</key>
		<key>County7</key>
		<key>County8</key>
		<key>County9</key>
	</row>
	<column name="type">
		<key>name</key>
		<key>rate1</key>
		<key>rate2</key>
		<key>rate3</key>
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
'''
Into this and vice versa
![rates Screenshot1]
(http://i.imgur.com/kRpks3o.png)