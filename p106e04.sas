data work.increase;
   set orion.staff;
   where emp_hire_date >= '01JUL2010'd;
   Increase=Salary*0.10;
   NewSalary=Salary+Increase;
   if increase >= 3000;
   keep Employee_ID Emp_Hire_Date Salary Increase NewSalary;
   label employee_id = 'emp id' emp_hire_date = 'hire date' increase = 'tot increase';
   format salrary newsalary dollar10.2 increase comma5.
run;

proc print data=work.increase label;
run;

proc contents data=increase;
run;

/* level 2*/
data work.delays;
	set orion.orders;
	order_month = month(order_date);
	where delivery_date > order_date +4 and employee_id = 99999999;
	if order_month = 8;
	keep Employee_ID Customer_ID Order_Date Delivery_Date Order_Month;
	label Order_Date = "date of order" Delivery_Date = "del date"  Order_Month = "month"; 
	format Order_Date Delivery_Date mmddyy10. ;
run;

proc contents data=delays;
run;

proc print data=delays label;
run;

proc print data=orion.orders;
run;



