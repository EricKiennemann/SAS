proc print data = orion.sales noobs;
	var Last_Name First_name Salary;
	where  salary < 25500;
run;
