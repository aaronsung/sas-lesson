libname sas2 'C:\Users\aaronsung4\Desktop\SAS_Lesson2';

proc sort data =sas2.mixedup out = sas2.ordered;
by y descending x;
run;

proc print data = sas2.hsi noobs;
where 20000<=adj_close<=23000 and date<='31dec2015'd;
run;

libname sas2 'C:\Users\aaronsung4\Desktop\SAS_Lesson2';

proc format;
value range low -< 20000 = "Less than 20000"
20000 -<25000 = "20-25k"
25000 - High = ">25k";
/*To map range of values to user-defined labels*/
run;

data hsi2;
set sas2.hsi;
format Adj Close range.;
/*To display variables in particular format without altering data values*/ run;
