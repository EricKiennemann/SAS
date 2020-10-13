data work.ordertype;
	length method $12;
	set orion.orders;
	if order_type = 1 then method = "Retail";
	else if order_type = 2 then method = "catalog";
	else if order_type = 3 then method = "internet";
	else method = "unknown";
run;

proc print data=work.ordertype;
	var order_id order_type method;
run;

