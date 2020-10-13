


data shipping_notes;
  set orion.shipped;
  length Comment $ 21;
  Comment = cat('Shipped on ',Ship_Date);
  Total = Quantity * input(Price,dollar9.2);
run;

proc print data=shipping_notes noobs;
  format Total dollar7.2;
run;


/* level 2 */
data US_converted;
	set orion.US_newhire;
	ID1 = compress(ID,'-');
	ID2=input(ID1,12.);
	phone1=put(telephone,7.);
	phone = substr(phone1,1,3)!!'-'!!substr(phone1,4);

proc print data = US_converted;
run;

