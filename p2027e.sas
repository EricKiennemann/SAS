data sales(keep = employee_id job_title manager_id) 
	exec (keep = employee_id job_title);
	set orion.employee_organization;
	select(Department);
	when('Sales') output sales;
	when('Executives')  output exec;
	otherwise;
	end;
run;

proc print data = sales (obs= 6 );
run;

proc print data = exec ( firstobs = 2 obs = 3);
run;

/* level 2 */

data instore(keep=order_id customer_id order_date)
	delivery(keep=order_id customer_id order_date delivery_date);
	set orion.orders ;*(obs=30);
	where order_type = 1 ;
	shipdays = delivery_date - order_date;
	select;
	when(shipdays = 0) output instore;
	when(shipdays > 0) output delivery;
	otherwise;
	end;
run;

proc print data=delivery;
run; 

proc freq data  = instore;
	format order_date year.;
	tables order_date;
run;
