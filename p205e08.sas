data sale_stats;
	set orion.orders_midyear;
	MonthAvg=round(mean(of month:));
	MonthMax=max(of month:);
	MonthSum=sum(of month:);
run;

proc print data=sale_stats;
	var Customer_ID MonthAvg MonthMax
		MonthSum;
run;

/* challenge */

data freqcustomers;
	set orion.orders_midyear;
	if n(of month:)>=5;
	median = median(of month:);
	max = max(of month:);
	max2 = largest(2,of month:);

proc print data=freqcustomers;
run;
