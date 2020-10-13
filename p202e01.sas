data work.price_increase;
   set orion.prices;
	year = 1;
	unit_price = unit_price * factor;
	output;
	year = 2;
	unit_price = unit_price * factor;
	output;	
	year = 3;
	unit_price = unit_price * factor;
	output;
run;
proc print data=work.price_increase;
 var Product_ID Unit_Price Year;
run;

/* level 2 */

data work.extended;
	set orion.discount;
	where start_date = '01dec2011'd;
	promotion = 'happy holidays';
	season = 'winter';
	output;
	start_date = '01jul2012'd; 
	end_date = '31jul2012'd;
	season = 'summer';
	output;
	drop unit_sales_price;
run;

proc print data = extended;
run;
