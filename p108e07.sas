data work.donations;
	infile "&path\donation.csv" dsd missover;
	input empid q1 q2 q3 q4;
run;

proc print data=work.donations;
run;

/* level 2 */

data work.prices;
	infile "&path\prices.dat" dlm='*' missover;
	input productid startdate :date. enddate :date.
	unitcostprice :dollar. unitsalesprice :dollar.;
	format startdate enddate ddmmyy10.
run;

proc print data=work.prices;
run;
