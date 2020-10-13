data work.region;
   set orion.supplier;
   length Region $ 17;
	if country in ('CA', 'US') then do;
		discount = 0.1;
		discounttype = "required";
		region = "north america";
	end;
	else do;
		discount = 0.05;
		discounttype = "optional";
		region = "not north america";
	end;
	keep Supplier_Name Country Discount 
	DiscountType Region;

run;

proc print data=work.region;
run;

/* level 2 */

data work.season;
	set orion.customer_dim;
	if qtr(Customer_BirthDate) = 1 then promo = "winter";
	else if qtr(Customer_BirthDate) = 2 then promo = "spring";
	else if qtr(Customer_BirthDate) = 3 then promo = "summer";
	else if qtr(Customer_BirthDate) = 4 then promo = "fall";
	if (customer_age > 18) and (customer_age <= 25) then promo2 = 'YA';
	else if (customer_age >= 65) then promo2 = 'Senior';
	else Promo2 = ' ';
run;

proc print data=work.season;
run;
