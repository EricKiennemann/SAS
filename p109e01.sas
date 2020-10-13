data work.increase;
   set orion.staff;
   increase = salary * 0.1;
   newsalary = salary+increase;
   BdayQtr = qtr(birth_date);
	keep Employee_ID Salary Birth_Date
	increase newsalary bdayqtr;
	format salary increse newsalary comma10.2;
	label bdayqtr = "QTR";
run;

proc print data=work.increase label;
run;

/* level 2*/
data work.birthday;
	set orion.customer;
	bday2012 = mdy(month(birth_date),
	day(birth_date),2012);
	bdaydow2012 = weekday(bday2012);
	age2012= (bday2012 - birth_date)/365.25;
	keep customer_name birth_date bday2012 bdaydow2012 age2012;
	format bday2012 date9. age2012 3.;
run;

proc print data = work.birthday;
run;
