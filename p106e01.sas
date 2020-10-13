proc print data=orion.customer_dim;
run;



data work.youngadult;
	set orion.customer_dim;
	where Customer_Gender = 'F' and customer_age between 18 and 36
	and Customer_Group contains 'Gold';
	Discount = 0.25;
run;


proc print data = youngadult noobs label;
	title "Customer";
	id Customer_ID  ;
	var Customer_Name customer_Age customer_Gender Customer_Group Discount;
	label Customer_ID = 'ID' Customer_Name = 'Name' customer_Age = 'Age' customer_Gender = 'Gender' 
	Customer_Group = 'Group';
run;
title;

/* level 2 */
data work.assistant;
	set orion.staff;
	where Job_title contains 'Assistant' and Salary < 26000;
	Increase = Salary * 0.01;
	New_salary = Salary + Increase ;
run;

proc print data=assistant;
id employee_id;
var Job_Title              Salary      Increase    New_Salary;
format increase new_salary dollar12.2;
run;

