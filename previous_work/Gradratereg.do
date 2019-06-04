import excel "/Volumes/Shulav/GradRate_reg/data.xlsx", sheet("Data_5-9-2019---594") firstrow
**generating variables first
foreach variable in "sat" "act" "religion" "female" "asian" "hispanic" "black" "admitrate" "yieldrate" "endowment" "endowmentperstd" "exp" "expperstd" "facsalary" "gradrate"{
gen `variable'=.
}
**generating combined SAT variable
replace sat=((AT+ AU+ SATMath25thpercentilescoreI+ SATMath75thpercentilescoreI+ BG+ BH+ BK+ BL+ BT+ BU+ BX+ BY))/(2*3)
egen relig=rmean(ReligiousaffiliationIC2017 ReligiousaffiliationIC2016 ReligiousaffiliationIC2015 ReligiousaffiliationIC2011 ReligiousaffiliationIC2010 ReligiousaffiliationIC2009)
replace religion=0
replace religion=1 if relig!=-2

/* converting act to sat for missing SATs: this chunk is R code and it is in the actsatconvert.R file*/
**I then converted this file to a dta format and removed the unnecessary columns
merge 1:1 UnitID using "/Volumes/Shulav/GradRate_reg/converted.dta"
egen act1=rmean(newgrade2011 newgrade2010 newgrade2009)
egen score=rmean(act1 sat) //this is the standardised test score variable we will use.

**graduation rates now
egen grad=rmean(GraduationrateBachelordegree W AK)

egen instrexp=rmean(InstructionTotalamountF1617_F InstructionTotalamountF1516_F InstructionTotalamountF1415_F)

egen yield=rmean(AdmissionsyieldtotalDRVADM2 V AJ)

egen admit=rmean(PercentadmittedtotalDRVADM2 U AI)

egen allstd=rmean(GrandtotalEF2011Allstudents GrandtotalEF2010Allstudents GrandtotalEF2009Allstudents)

replace expperstd=instrexp/allstd
egen totalhisp=rmean(HispanictotalEF2011AAllstud HispanictotalEF2010AAllstud HispanictotalnewEF2009AAl)
replace hispanic=totalhisp/allstd
egen totalfem=rmean(TotalwomenEF2011Allstudents TotalwomenEF2010Allstudents TotalwomenEF2009Allstudents)
replace female=totalfem/allstd
egen totalblack=rmean(CX DC DH)
replace black=totalblack/allstd

egen totexp=rmean(TotalexpensesF1617_F2 TotalexpensesF1516_F2 TotalexpensesF1415_F2)
replace exp=totexp/allstd

egen endow=rmean(Valueofendowmentassetsatthe S AH)
replace endowmentperstd=endow/allstd

