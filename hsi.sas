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
