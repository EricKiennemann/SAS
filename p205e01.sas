data work.codes;
	set orion.au_salesforce;
	FCode1 = lowcase(substr(first_name,1,1));
	FCode2 = lowcase(substr(first_name,length(first_name),1));
	LCode = lowcase(substr(last_name,1,4));
run;

proc print data = work.codes;
run;

data yop;
	set orion.newcompetitors;
	country = substr(ID,1,2);
	store_code = left(substr(ID,3,length(ID)-2));
	if substr(store_code,1,1) = '1';
	CityL = propcase(City);
run;

prop print data = yop;
run;
