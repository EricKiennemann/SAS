data admin stock purchasing;
	set orion.employee_organization;
	select(department);
		when ('Administration') output admin;
		when ('Stock & Shipping') output stock;
		when ('Purchasing') output purchasing;
		otherwise;
		end;
run;

proc print data = admin;
run;
proc print data = stock;
run;
proc print data = purchasing;
run;

/* level 2 */

data fast slow veryslow;
	set orion.orders;
	where order_type in (2,3);
	shipdays = delivery_date - order_date;
	select;
	when (shipdays <3) output fast;
	when (5 <= shipdays <= 7) output slow;
	when (shipdays > 7) output veryslow;
	otherwise;
	end;
	drop employee_id;
run;
