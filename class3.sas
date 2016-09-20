libname sas3 'C:\Users\aaronsung4\Desktop\SAS_Lesson3';

/*1. Import the Stock file from Excel*/
PROC IMPORT OUT= WORK.SP
  DATAFILE= "C:\Users\aaronsung4\Desktop\SAS_Lesson3\stockpric
es2.xlsx"
  DBMS=EXCEL REPLACE;
  RANGE="stockprices";
  GETNAMES=YES;
  MIXED=NO;
  SCANTEXT=YES;
  USEDATE=YES;
  SCANTIME=YES;
RUN;

/*2. Sort by Date*/
proc sort data=sp out=sp2;
by date;
run;

proc expand data = sp out = ma;
/* PROC EXPAND is an ETS procedure for processing time series data*/
convert cp_00005 = ma_00005 / transform = (movave 10);
/*To transform the original time series into 10-day moving average with designated transformation method*/
convert cp_hsi = ma_hsi / transform = (movave 10);
run;

/*3. Moving average*/
proc gplot data = ma;
/*plot ma_00005*date / legend; */
plot cp_hsi*date / legend;
plot2 ma_hsi*date / legend;
/* To plot the original and moving average series on the same plane and add legends to the diagram*/
where time > 9;
run;
quit;

/*4. Moving average 10 days and 20days*/
proc expand data = sp out = ma_hsi;
/*To transform the original time series into 10-day moving average with designated transformation method*/
convert cp_hsi = ma_hsi_10 / transform = (movave 10);
/*To transform the original time series into 20-day moving average with designated transformation method*/
convert cp_hsi = ma_hsi_20 / transform = (movave 20);
run;

/*4a. Moving average*/
proc gplot data = ma_hsi;
/*plot ma_hsi*date / legend; */
plot cp_hsi * date ma_hsi_10 * date ma_hsi_20 * date / overlay legend;
/*plot2 ma_hsi_20 * date / legend;*/
/* To plot the original and moving average series on the same plane and add legends to the diagram*/
where time > 18;
run;
quit;
