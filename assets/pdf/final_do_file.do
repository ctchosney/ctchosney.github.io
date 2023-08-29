clear
cd "/Users/craigchosney/Desktop/QMSS/SOC STATS DOCS/STATS 2/PROJECT"
use STATS_FINAL_DATASET_5YR.dta if (indnaics == "712")
generate is_mng = 0 
replace is_mng = 1 if ((substr(occsoc,1,2)) == "11")
label variable is_mng "is manager"
label define is_mng 1 "MANAGEMENT" 0 "NON-MANAGEMENT"
label values is_mng is_mng

generate is_female = 0
replace is_female = 1 if (sex == 2)
label variable is_female "is female"
label define is_female 1 "FEMALE" 0 "MALE"
label values is_female is_female

generate is_poc = 1
replace is_poc = 0 if (race == 1)
label variable is_poc "is POC"
label define is_poc 1 "POC" 0 "WHITE"
label values is_poc is_poc

drop racamind
drop racasian
drop racblk
drop racpacis
drop racwht
drop racother

drop sample
drop serial
drop cbserial
drop hhwt
drop cluster
drop strata
drop gq
drop pernum
drop perwt

generate newinctot=inctot
replace newinctot=. if inctot<0
replace newinctot=. if uhrswork<30
replace newinctot=. if wkswork2<4

winsor newinctot, gen(winctot) p(0.01)

summarize

regress winctot region age is_female is_poc is_mng
estat hettest
vif

regress winctot is_mng##c.age##c.age
margins is_mng, at(age=(20(5)65)) vsquish
marginsplot

regress winctot is_female##is_poc##is_mng, baselevels
margins is_female#is_poc#is_mng, vsquish
marginsplot

logit is_mng is_female age is_poc
logit is_mng is_female age is_poc, or










clear
cd "/Users/craigchosney/Desktop/QMSS/SOC STATS DOCS/STATS 2/PROJECT"
use STATS_FINAL_DATASET_5YR_NYC_CBSA.dta if (indnaics == "712")
generate is_mng = 0 
replace is_mng = 1 if ((substr(occsoc,1,2)) == "11")
label variable is_mng "is manager"
label define is_mng 1 "MANAGEMENT" 0 "NON-MANAGEMENT"
label values is_mng is_mng

generate is_female = 0
replace is_female = 1 if (sex == 2)
label variable is_female "is female"
label define is_female 1 "FEMALE" 0 "MALE"
label values is_female is_female

generate is_poc = 1
replace is_poc = 0 if (race == 1)
label variable is_poc "is POC"
label define is_poc 1 "POC" 0 "WHITE"
label values is_poc is_poc

drop racamind
drop racasian
drop racblk
drop racpacis
drop racwht
drop racother

drop sample
drop serial
drop cbserial
drop hhwt
drop cluster
drop strata
drop gq
drop pernum
drop perwt

generate newinctot=inctot
replace newinctot=. if inctot<0
replace newinctot=. if uhrswork<30
replace newinctot=. if wkswork2<4

winsor newinctot, gen(winctot) p(0.01)

summarize

regress winctot region age is_female is_poc is_mng
estat hettest
vif

regress winctot is_mng##c.age##c.age
margins is_mng, at(age=(20(5)65)) vsquish
marginsplot

regress winctot is_female##is_poc##is_mng, baselevels
margins is_female#is_poc#is_mng, vsquish
marginsplot

logit is_mng is_female age is_poc
logit is_mng is_female age is_poc, or
