data work.canada_customers;
	length first $ 20 last $ 20 id 8 gender $ 1 
	birthdate 8 age 8 agegroup $ 12;
	infile "&path\custca.csv" dlm=',';
	input first $  last $ id  gender $ 
	birthdate  :ddmmyy. age  agegroup $;
	drop id age;
	format birthdate monyy7.;
run;

proc print data=work.canada_customers;
run;

/* level 2 */
data work.price;
	infile "&path\pricing.dat" dlm='*';
	input Productid startdate :date. enddate :date. 
	cost :dollar. price :dollar.; 
	format startdate enddate mmddyy10.
run;
proc print data=work.price;
run;
