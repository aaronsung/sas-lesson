libname sas2 'C:\Users\aaronsung4\Desktop\SAS_Lesson2';

proc sort data =sas2.mixedup out = sas2.ordered;
by y descending x;
run;

proc print data = sas2.hsi noobs;
where 20000<=adj_close<=23000 and date<='31dec2015'd;
run;

proc sort data = sashelp.prdsale out=sas2.prdsale;
by country product;
run;

proc means data=sas2.prdsale;
var actual predict;
by country product;
run;

proc freq data = sashelp.prdsal2;
tables country product;
run;
