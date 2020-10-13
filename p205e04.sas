data names;
	set orion.customers_ex5;
	if Gender = 'M' then Start = 'Mr.';
	else Start = 'Mrs';
	first_name = scan(name,2,',');
	second_name = scan(name,1,',');
	new_name = Start!!' '!!first_name!!' '!!second_name;
run;

proc print data = names;
run;

/* level 2 */
data split;
	set orion.employee_donations (obs =10);
	PcfLoc = find(Recipients,'%');
	if PcfLoc>0 then do;
		Charity = substr(Recipients,1,PcfLoc);
		output;
		Charity = substr(Recipients,PcfLoc+3);
		output;
	end;
	else do;
		charity = Recipients!!' 100%';
	end;
run;

proc print data = split;
run;

