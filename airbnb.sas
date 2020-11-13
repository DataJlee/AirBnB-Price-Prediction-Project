

/*import data with low user control*/
proc import datafile='/folders/myfolders/SAS Projects/data/airbnb_cleaned.csv'
out=work.airbnb
DBMS=csv
replace;
run;

proc print data = airbnb;
run;

proc univariate data=airbnb;
  var minimum_nights number_of_reviews reviews_per_month price;
run;

proc genmod data = airbnb;
	class neighbourhood_group room_type city;
	model price = minimum_nights number_of_reviews reviews_per_month 
	neighbourhood_group room_type city/type1 type3;
run;
	

