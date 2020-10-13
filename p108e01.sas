data work.newemployees;
	length name $ 12 first_name $ 18 job $ 25 salary 8;
	infile "&path\newemps.csv" dlm=',';
	input name $  first_name $  job $  salary ;
run;

proc print data=work.newemployees;
run;

/* level 2 */

data work.qtrdonation;
	length IDnum $ 6 ;
	infile "&path\donation.dat" dlm=' ';
	input IDnum $  qtr1 qtr2 qtr3 qtr4 ;
run;

proc print data=work.qtrdonation;
run;
