** Joyplot / Ridgeline Plot
** Author: Mert Moral
** Date: July 18, 2018

* Data are downloaded from voteview.com/data -> Information about members of congress/ Chamber: House/ Congress: All/ Filetype: CSV (Default) 
* Please cite the dataset as: Lewis, Jeffrey B., Keith Poole, Howard Rosenthal, Adam Boche, Aaron Rudkin, and Luke Sonnet (2017). Voteview: Congressional Roll-Call Votes Database. https://voteview.com/
* The plot reproduces Ian McDonald's sample joyplot graphed using the ggjoy package in R (http://rpubs.com/ianrmcdonald/293304)

version 15.1

* Data operations
copy "https://voteview.com/static/data/out/members/Hall_members.csv" "Hall_members.csv", replace	/* Copying the original dataset to the working folder */
import delimited "Hall_members.csv", delimiter(comma) varnames(1) clear								/* Importing comma separated values to Stata */

keep if congress>=88 & state_abbrev!="USA"															/* Dropping observations prior to the 88th Congress and ideal point estimates for presidents */
gen year=congress*2+1787																			/* Generating a year counter */

* Kernel density estimates
local k=1
forval i=1977(2)2017{																				/* Generating esimation points and density estimates for each Congress */
forval j=1/2{
kdensity nominate_dim1 if party_code==`=`j'*100' & year==`i', gen(x_`j'_`k' d_`j'_`k') nograph 				
}
local k=`k'+1
}																									

keep in 1/50																						/* Keeping only the estimates */
keep d_* x_*

* Recoding estimates for presentation
forval i=1/21{																						
gen where`i'=0-(`=`i'-1'*.5)																		/* Generating a grid line for each set of estimate equal to the difference above */ 
foreach var of varlist d_1_`i' d_2_`i'{
replace `var'=`var'-(`=`i'-1'*.5)																	/* Replacing density estimates w/ 'estimates-.5 unit' for presentation purposes */							
}																									/* You may change the scale (e.g., +/-.3 (density) unit) to extend the vertical axis and/or alter the space between grid lines */
}

* Figure
twoway rarea d_1_1 where1 x_1_1, fcolor("blue%20") lcolor(black) lwidth(vvthin) ///					/* Note that the opacity option would pnly work in versions later than 15 */
||rarea d_2_1 where1 x_2_1, fcolor("red%20") lcolor(black) lwidth(vvthin) 	///						/* Remove the "%20" part as needed */
||rarea d_1_2 where2 x_1_2, fcolor("blue%20") lcolor(black) lwidth(vvthin)	///						/* Download and install 'mmoral3' scheme file in the master branch to reproduce the sample joyplot */
||rarea d_2_2 where2 x_2_2, fcolor("red%20") lcolor(black) lwidth(vvthin) 	///
||rarea d_1_3 where3 x_1_3, fcolor("blue%20") lcolor(black) lwidth(vvthin)	///
||rarea d_2_3 where3 x_2_3, fcolor("red%20") lcolor(black) lwidth(vvthin) 	///
||rarea d_1_4 where4 x_1_4, fcolor("blue%20") lcolor(black) lwidth(vvthin)	///
||rarea d_2_4 where4 x_2_4, fcolor("red%20") lcolor(black) lwidth(vvthin)	///
||rarea d_1_5 where5 x_1_5, fcolor("blue%20") lcolor(black) lwidth(vvthin)	///
||rarea d_2_5 where5 x_2_5, fcolor("red%20") lcolor(black) lwidth(vvthin)	///
||rarea d_1_6 where6 x_1_6, fcolor("blue%20") lcolor(black) lwidth(vvthin)	///
||rarea d_2_6 where6 x_2_6, fcolor("red%20") lcolor(black) lwidth(vvthin)	///
||rarea d_1_7 where7 x_1_7, fcolor("blue%20") lcolor(black) lwidth(vvthin)	///
||rarea d_2_7 where7 x_2_7, fcolor("red%20") lcolor(black) lwidth(vvthin)	///
||rarea d_1_8 where8 x_1_8, fcolor("blue%20") lcolor(black) lwidth(vvthin)	///
||rarea d_2_8 where8 x_2_8, fcolor("red%20") lcolor(black) lwidth(vvthin)	///
||rarea d_1_9 where9 x_1_9, fcolor("blue%20") lcolor(black) lwidth(vvthin)	///
||rarea d_2_9 where9 x_2_9, fcolor("red%20") lcolor(black) lwidth(vvthin)	///
||rarea d_1_10 where10 x_1_10, fcolor("blue%20") lcolor(black) lwidth(vvthin)	///
||rarea d_2_10 where10 x_2_10, fcolor("red%20") lcolor(black) lwidth(vvthin)	///
||rarea d_1_11 where11 x_1_11, fcolor("blue%20") lcolor(black) lwidth(vvthin)	///
||rarea d_2_11 where11 x_2_11, fcolor("red%20") lcolor(black) lwidth(vvthin)	///
||rarea d_1_12 where12 x_1_12, fcolor("blue%20") lcolor(black) lwidth(vvthin)	///
||rarea d_2_12 where12 x_2_12, fcolor("red%20") lcolor(black) lwidth(vvthin)	///
||rarea d_1_13 where13 x_1_13, fcolor("blue%20") lcolor(black) lwidth(vvthin)	///
||rarea d_2_13 where13 x_2_13, fcolor("red%20") lcolor(black) lwidth(vvthin)	///
||rarea d_1_14 where14 x_1_14, fcolor("blue%20") lcolor(black) lwidth(vvthin)	///
||rarea d_2_14 where14 x_2_14, fcolor("red%20") lcolor(black) lwidth(vvthin)	///
||rarea d_1_15 where15 x_1_15, fcolor("blue%20") lcolor(black) lwidth(vvthin)	///
||rarea d_2_15 where15 x_2_15, fcolor("red%20") lcolor(black) lwidth(vvthin)	///
||rarea d_1_16 where16 x_1_16, fcolor("blue%20") lcolor(black) lwidth(vvthin)	///
||rarea d_2_16 where16 x_2_16, fcolor("red%20") lcolor(black) lwidth(vvthin)	///
||rarea d_1_17 where17 x_1_17, fcolor("blue%20") lcolor(black) lwidth(vvthin)	///
||rarea d_2_17 where17 x_2_17, fcolor("red%20") lcolor(black) lwidth(vvthin)	///
||rarea d_1_18 where18 x_1_18, fcolor("blue%20") lcolor(black) lwidth(vvthin)	///
||rarea d_2_18 where18 x_2_18, fcolor("red%20") lcolor(black) lwidth(vvthin)	///
||rarea d_1_19 where19 x_1_19, fcolor("blue%20") lcolor(black) lwidth(vvthin)	///
||rarea d_2_19 where19 x_2_19, fcolor("red%20") lcolor(black) lwidth(vvthin)	///
||rarea d_1_20 where20 x_1_20, fcolor("blue%20") lcolor(black) lwidth(vvthin)	///
||rarea d_2_20 where20 x_2_20, fcolor("red%20") lcolor(black) lwidth(vvthin)	///
||rarea d_1_21 where21 x_1_21, fcolor("blue%20") lcolor(black) lwidth(vvthin)	///
||rarea d_2_21 where21 x_2_21, fcolor("red%20") lcolor(black) lwidth(vvthin)	///
	legend(off) xlab(-1(.25)1) xtitle("First Dimension DW-Nominate") ytitle("First Year of Congress") title("First Dimension DW-Nominate by Party - U.S. House (1977-2017)") ///
	ylab(0 "1977" -2.5 "1987" -5 "1997" -7.5 "2007" -10 "2017", angle(horizontal)) ysca(noline) /*scheme(mmoral3)*/
	
graph export "Sample Joyplot by MM.png", replace
