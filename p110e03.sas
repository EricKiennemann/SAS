/* level 1 */
data work.thirdqtr;
	set orion.mnth7_2011 orion.mnth8_2011 orion.mnth9_2011;
run;

proc print data = work.thirdqtr;
run;

/* level 2 */
proc contents data=orion.charities;
run;

proc contents data=orion.us_suppliers;
run;

proc contents data=orion.consultants;
run;

data work.contacts;
	set orion.charities orion.us_suppliers;
run;

proc contents data = contacts;
run;

data work.contacts2;
	set orion.us_suppliers orion.charities;
run;

proc contents data = contacts2;
run;

data work.contacts3;
	set orion.us_suppliers orion.consultants;
run;

proc contents data = contacts3;
run;
