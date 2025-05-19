/* ------------------------------------------------------------------------
   SECTION 0: PACKAGE INSTALLATION AND SETUP
   ------------------------------------------------------------------------ */

// Check if required packages are installed and install if needed
foreach package in collin fedistr {
    capture which `package'
    if _rc {
        display as text "Installing `package' package..."
        ssc install `package', replace
    }
    else {
        display as text "`package' is already installed."
    }
}

/* ------------------------------------------------------------------------
   SECTION 1: DATA PREPARATION AND VARIABLE CREATION
   ------------------------------------------------------------------------ */

// Create and populate macro-level variables
// Creating populist government indicator
gen populist_gov = 0
label variable populist_gov "Presence of a populist government in the country"

// Populate populist_gov based on TIMBRO Authoritarian Populism Index
replace populist_gov = 1 if cntry == "AT" & (year == 2002 | year == 2004 | year == 2006 | year == 2018)
replace populist_gov = 1 if cntry == "BG" & (year == 2018 | year == 2020)
replace populist_gov = 1 if cntry == "CH"
replace populist_gov = 1 if cntry == "CY" & inrange(year, 2003, 2013)
replace populist_gov = 1 if cntry == "CZ" & inrange(year, 2014, 2020)
replace populist_gov = 1 if cntry == "EE" & inrange(year, 2019, 2020)
replace populist_gov = 1 if cntry == "ES" & year == 2020
replace populist_gov = 1 if cntry == "FI" & inrange(year, 2015, 2019)
replace populist_gov = 1 if cntry == "HU" & inrange(year, 2010, 2020)
replace populist_gov = 1 if cntry == "IT" & (year == 2002 | year == 2018 | year == 2020)
replace populist_gov = 1 if cntry == "LT" & inrange(year, 2012, 2019)
replace populist_gov = 1 if cntry == "LV" & (year == 2008 | year == 2018)
replace populist_gov = 1 if cntry == "NO" & inrange(year, 2013, 2020)
replace populist_gov = 1 if cntry == "PL" & (year == 2006 | inrange(year, 2015, 2020))
replace populist_gov = 1 if cntry == "SI" & ((inrange(year, 2004, 2007) | inrange(year, 2012, 2013)) | year == 2020)
replace populist_gov = 1 if cntry == "SK" & ((inrange(year, 2006, 2010)) | inrange(year, 2012, 2020))

// Social expenditure variable - create empty variable
gen social_expenditure = 0
label variable social_expenditure "Total expenditure on social protection as percentage of GDP"

// Populate social_expenditure based on Eurostat data
replace social_expenditure = 28.2 if cntry == "AT" & year == 2002
replace social_expenditure = 28.3 if cntry == "AT" & year == 2004
replace social_expenditure = 27.5 if cntry == "AT" & year == 2006
replace social_expenditure = 29.7 if cntry == "AT" & year == 2014
replace social_expenditure = 29.7 if cntry == "AT" & year == 2016
replace social_expenditure = 29.1 if cntry == "AT" & year == 2018
replace social_expenditure = 34 if cntry == "AT" & year == 2020

replace social_expenditure = 26.4 if cntry == "BE" & year == 2002
replace social_expenditure = 27.1 if cntry == "BE" & year == 2004
replace social_expenditure = 26.7 if cntry == "BE" & year == 2006
replace social_expenditure = 27.9 if cntry == "BE" & year == 2008
replace social_expenditure = 29.6 if cntry == "BE" & year == 2010
replace social_expenditure = 29.7 if cntry == "BE" & year == 2012
replace social_expenditure = 30 if cntry == "BE" & year == 2014
replace social_expenditure = 29.2 if cntry == "BE" & year == 2016
replace social_expenditure = 28.7 if cntry == "BE" & year == 2018

replace social_expenditure = 13.8 if cntry == "BG" & year == 2006 
replace social_expenditure = 14.7 if cntry == "BG" & year == 2008 
replace social_expenditure = 17 if cntry == "BG" & year == 2010 
replace social_expenditure = 16.5 if cntry == "BG" & year == 2012 
replace social_expenditure = 16.8 if cntry == "BG" & year == 2018 
replace social_expenditure = 18.7 if cntry == "BG" & year == 2020 

replace social_expenditure = 24.3 if cntry == "CH" & year == 2002
replace social_expenditure = 25.2 if cntry == "CH" & year == 2004
replace social_expenditure = 24.1 if cntry == "CH" & year == 2006
replace social_expenditure = 22.9 if cntry == "CH" & year == 2008
replace social_expenditure = 24.5 if cntry == "CH" & year == 2010
replace social_expenditure = 24.9 if cntry == "CH" & year == 2012
replace social_expenditure = 26.1 if cntry == "CH" & year == 2014
replace social_expenditure = 27.2 if cntry == "CH" & year == 2016
replace social_expenditure = 27.1 if cntry == "CH" & year == 2018
replace social_expenditure = 31.4 if cntry == "CH" & year == 2020

replace social_expenditure = 16.7 if cntry == "CY" & year == 2006
replace social_expenditure = 17.5 if cntry == "CY" & year == 2008
replace social_expenditure = 18.6 if cntry == "CY" & year == 2010
replace social_expenditure = 20.8 if cntry == "CY" & year == 2012
replace social_expenditure = 17.6 if cntry == "CY" & year == 2018

replace social_expenditure = 18.5 if cntry == "CZ" & year == 2002
replace social_expenditure = 17.7 if cntry == "CZ" & year == 2004
replace social_expenditure = 17.8 if cntry == "CZ" & year == 2008
replace social_expenditure = 19.8 if cntry == "CZ" & year == 2010
replace social_expenditure = 20.3 if cntry == "CZ" & year == 2012
replace social_expenditure = 19.5 if cntry == "CZ" & year == 2014
replace social_expenditure = 18.7 if cntry == "CZ" & year == 2016
replace social_expenditure = 18.5 if cntry == "CZ" & year == 2018
replace social_expenditure = 22 if cntry == "CZ" & year == 2020

replace social_expenditure = 29.5 if cntry == "DE" & year == 2002
replace social_expenditure = 29.1 if cntry == "DE" & year == 2004
replace social_expenditure = 27.8 if cntry == "DE" & year == 2006
replace social_expenditure = 27.3 if cntry == "DE" & year == 2008
replace social_expenditure = 30 if cntry == "DE" & year == 2010
replace social_expenditure = 28.9 if cntry == "DE" & year == 2012
replace social_expenditure = 29.1 if cntry == "DE" & year == 2014
replace social_expenditure = 29.6 if cntry == "DE" & year == 2016
replace social_expenditure = 29.7 if cntry == "DE" & year == 2018
replace social_expenditure = 32.8 if cntry == "DE" & year == 2020

replace social_expenditure = 28.9 if cntry == "DK" & year == 2002
replace social_expenditure = 29.9 if cntry == "DK" & year == 2004
replace social_expenditure = 28.4 if cntry == "DK" & year == 2006
replace social_expenditure = 30.4 if cntry == "DK" & year == 2008
replace social_expenditure = 34 if cntry == "DK" & year == 2010
replace social_expenditure = 33.6 if cntry == "DK" & year == 2012
replace social_expenditure = 34.4 if cntry == "DK" & year == 2014
replace social_expenditure = 32.5 if cntry == "DK" & year == 2016
replace social_expenditure = 31.8 if cntry == "DK" & year == 2018
replace social_expenditure = 33.5 if cntry == "DK" & year == 2020

replace social_expenditure = 12.9 if cntry == "EE" & year == 2004
replace social_expenditure = 12 if cntry == "EE" & year == 2006
replace social_expenditure = 14.6 if cntry == "EE" & year == 2008
replace social_expenditure = 17.6 if cntry == "EE" & year == 2010
replace social_expenditure = 15 if cntry == "EE" & year == 2012
replace social_expenditure = 14.9 if cntry == "EE" & year == 2014
replace social_expenditure = 16.6 if cntry == "EE" & year == 2016
replace social_expenditure = 16.3 if cntry == "EE" & year == 2018
replace social_expenditure = 19.2 if cntry == "EE" & year == 2020

replace social_expenditure = 19.5 if cntry == "ES" & year == 2002
replace social_expenditure = 19.9 if cntry == "ES" & year == 2004
replace social_expenditure = 20.1 if cntry == "ES" & year == 2006
replace social_expenditure = 21.6 if cntry == "ES" & year == 2008
replace social_expenditure = 24.8 if cntry == "ES" & year == 2010
replace social_expenditure = 25.7 if cntry == "ES" & year == 2012
replace social_expenditure = 25.5 if cntry == "ES" & year == 2014
replace social_expenditure = 23.8 if cntry == "ES" & year == 2016
replace social_expenditure = 23.6 if cntry == "ES" & year == 2018
replace social_expenditure = 30.1 if cntry == "ES" & year == 2020

replace social_expenditure = 24.9 if cntry == "FI" & year == 2002
replace social_expenditure = 25.6 if cntry == "FI" & year == 2004
replace social_expenditure = 25.3 if cntry == "FI" & year == 2006
replace social_expenditure = 25.0 if cntry == "FI" & year == 2008
replace social_expenditure = 29.1 if cntry == "FI" & year == 2010
replace social_expenditure = 29.9 if cntry == "FI" & year == 2012
replace social_expenditure = 31.7 if cntry == "FI" & year == 2014
replace social_expenditure = 31.6 if cntry == "FI" & year == 2016
replace social_expenditure = 30.1 if cntry == "FI" & year == 2018
replace social_expenditure = 31.9 if cntry == "FI" & year == 2020

replace social_expenditure = 29.8 if cntry == "FR" & year == 2002
replace social_expenditure = 30.6 if cntry == "FR" & year == 2004
replace social_expenditure = 30.7 if cntry == "FR" & year == 2006
replace social_expenditure = 30.8 if cntry == "FR" & year == 2008
replace social_expenditure = 33.2 if cntry == "FR" & year == 2010
replace social_expenditure = 33.8 if cntry == "FR" & year == 2012
replace social_expenditure = 34.5 if cntry == "FR" & year == 2014
replace social_expenditure = 34.3 if cntry == "FR" & year == 2016
replace social_expenditure = 33.7 if cntry == "FR" & year == 2018
replace social_expenditure = 38 if cntry == "FR" & year == 2020

replace social_expenditure = 23 if cntry == "GB" & year == 2002
replace social_expenditure = 25.4 if cntry == "GB" & year == 2004
replace social_expenditure = 26.1 if cntry == "GB" & year == 2006
replace social_expenditure = 25.5 if cntry == "GB" & year == 2008
replace social_expenditure = 28.5 if cntry == "GB" & year == 2010
replace social_expenditure = 28.6 if cntry == "GB" & year == 2012
replace social_expenditure = 27.2 if cntry == "GB" & year == 2014
replace social_expenditure = 25.9 if cntry == "GB" & year == 2016
replace social_expenditure = 25.7 if cntry == "GB" & year == 2018
replace social_expenditure = . if cntry == "GB" & year == 2020

replace social_expenditure = 18.6 if cntry == "HR" & year == 2008
replace social_expenditure = 20.9 if cntry == "HR" & year == 2010
replace social_expenditure = 21.2 if cntry == "HR" & year == 2018
replace social_expenditure = 24.1 if cntry == "HR" & year == 2020

replace social_expenditure = 20.1 if cntry == "HU" & year == 2002
replace social_expenditure = 20.3 if cntry == "HU" & year == 2004
replace social_expenditure = 21.9 if cntry == "HU" & year == 2006
replace social_expenditure = 22.3 if cntry == "HU" & year == 2008
replace social_expenditure = 22.3 if cntry == "HU" & year == 2010
replace social_expenditure = 21.1 if cntry == "HU" & year == 2012
replace social_expenditure = 19.7 if cntry == "HU" & year == 2014
replace social_expenditure = 18.8 if cntry == "HU" & year == 2016
replace social_expenditure = 17.6 if cntry == "HU" & year == 2018
replace social_expenditure = . if cntry == "HU" & year == 2020

replace social_expenditure = 16.4 if cntry == "IE" & year == 2002
replace social_expenditure = 17.3 if cntry == "IE" & year == 2004
replace social_expenditure = 17.5 if cntry == "IE" & year == 2006
replace social_expenditure = 20.9 if cntry == "IE" & year == 2008
replace social_expenditure = 25.4 if cntry == "IE" & year == 2010
replace social_expenditure = 24.2 if cntry == "IE" & year == 2012
replace social_expenditure = 21.3 if cntry == "IE" & year == 2014
replace social_expenditure = 16.1 if cntry == "IE" & year == 2016
replace social_expenditure = 14.2 if cntry == "IE" & year == 2018

replace social_expenditure = 21.7 if cntry == "IS" & year == 2004
replace social_expenditure = 22.8 if cntry == "IS" & year == 2012
replace social_expenditure = 22.1 if cntry == "IS" & year == 2016
replace social_expenditure = 24 if cntry == "IS" & year == 2018
replace social_expenditure = 30.6 if cntry == "IS" & year == 2020

replace social_expenditure = 24.1 if cntry == "IT" & year == 2002
replace social_expenditure = 28.9 if cntry == "IT" & year == 2012
replace social_expenditure = 29.2 if cntry == "IT" & year == 2016
replace social_expenditure = 28.8 if cntry == "IT" & year == 2018
replace social_expenditure = 34.3 if cntry == "IT" & year == 2020

replace social_expenditure = 19.1 if cntry == "LT" & year == 2010
replace social_expenditure = 16.3 if cntry == "LT" & year == 2012
replace social_expenditure = 15.3 if cntry == "LT" & year == 2014
replace social_expenditure = 15.4 if cntry == "LT" & year == 2016
replace social_expenditure = 15.8 if cntry == "LT" & year == 2018
replace social_expenditure = 19.5 if cntry == "LT" & year == 2020

replace social_expenditure = 12 if cntry == "LV" & year == 2008
replace social_expenditure = 15.2 if cntry == "LV" & year == 2018

replace social_expenditure = 16.7 if cntry == "ME" & year == 2018
replace social_expenditure = 22.7 if cntry == "ME" & year == 2020

replace social_expenditure = 25.7 if cntry == "NL" & year == 2002
replace social_expenditure = 26.5 if cntry == "NL" & year == 2004
replace social_expenditure = 27 if cntry == "NL" & year == 2006
replace social_expenditure = 26.8 if cntry == "NL" & year == 2008
replace social_expenditure = 30.3 if cntry == "NL" & year == 2010
replace social_expenditure = 31.4 if cntry == "NL" & year == 2012
replace social_expenditure = 31.3 if cntry == "NL" & year == 2014
replace social_expenditure = 29.9 if cntry == "NL" & year == 2016
replace social_expenditure = 28.9 if cntry == "NL" & year == 2018
replace social_expenditure = 32.8 if cntry == "NL" & year == 2020

replace social_expenditure = 24.7 if cntry == "NO" & year == 2002
replace social_expenditure = 24.5 if cntry == "NO" & year == 2004
replace social_expenditure = 21.5 if cntry == "NO" & year == 2006
replace social_expenditure = 21.1 if cntry == "NO" & year == 2008
replace social_expenditure = 24.4 if cntry == "NO" & year == 2010
replace social_expenditure = 23.9 if cntry == "NO" & year == 2012
replace social_expenditure = 25.2 if cntry == "NO" & year == 2014
replace social_expenditure = 28.4 if cntry == "NO" & year == 2016
replace social_expenditure = 26.5 if cntry == "NO" & year == 2018
replace social_expenditure = 30.7 if cntry == "NO" & year == 2020

replace social_expenditure = 21 if cntry == "PL" & year == 2002
replace social_expenditure = 20.3 if cntry == "PL" & year == 2004
replace social_expenditure = 19.7 if cntry == "PL" & year == 2006
replace social_expenditure = 19.4 if cntry == "PL" & year == 2008
replace social_expenditure = 19.9 if cntry == "PL" & year == 2010
replace social_expenditure = 19.1 if cntry == "PL" & year == 2012
replace social_expenditure = 19.5 if cntry == "PL" & year == 2014
replace social_expenditure = 21.1 if cntry == "PL" & year == 2016
replace social_expenditure = 19.7 if cntry == "PL" & year == 2018
replace social_expenditure = 23.7 if cntry == "PL" & year == 2020

replace social_expenditure = 22.5 if cntry == "PT" & year == 2002
replace social_expenditure = 23.4 if cntry == "PT" & year == 2004
replace social_expenditure = 23.7 if cntry == "PT" & year == 2006
replace social_expenditure = 23.4 if cntry == "PT" & year == 2008
replace social_expenditure = 25.8 if cntry == "PT" & year == 2010
replace social_expenditure = 26.4 if cntry == "PT" & year == 2012
replace social_expenditure = 26.9 if cntry == "PT" & year == 2014
replace social_expenditure = 25.1 if cntry == "PT" & year == 2016
replace social_expenditure = 24 if cntry == "PT" & year == 2018
replace social_expenditure = 27.5 if cntry == "PT" & year == 2020

replace social_expenditure = 19.4 if cntry == "RS" & 2018
replace social_expenditure = 21.9 if cntry == "RS" & 2020

replace social_expenditure = 29.3 if cntry == "SE" & year == 2002
replace social_expenditure = 29.5 if cntry == "SE" & year == 2004
replace social_expenditure = 28.4 if cntry == "SE" & year == 2006
replace social_expenditure = 27.7 if cntry == "SE" & year == 2008
replace social_expenditure = 28.3 if cntry == "SE" & year == 2010
replace social_expenditure = 29 if cntry == "SE" & year == 2012
replace social_expenditure = 29.3 if cntry == "SE" & year == 2014
replace social_expenditure = 29.4 if cntry == "SE" & year == 2016
replace social_expenditure = 28.3 if cntry == "SE" & year == 2018
replace social_expenditure = 29.4 if cntry == "SE" & year == 2020

replace social_expenditure = 24 if cntry == "SI" & year == 2002
replace social_expenditure = 22.9 if cntry == "SI" & year == 2004
replace social_expenditure = 22.4 if cntry == "SI" & year == 2006
replace social_expenditure = 21 if cntry == "SI" & year == 2008
replace social_expenditure = 24.4 if cntry == "SI" & year == 2010
replace social_expenditure = 24.7 if cntry == "SI" & year == 2012
replace social_expenditure = 23.9 if cntry == "SI" & year == 2014
replace social_expenditure = 23.2 if cntry == "SI" & year == 2016
replace social_expenditure = 22.2 if cntry == "SI" & year == 2018
replace social_expenditure = 26.2 if cntry == "SI" & year == 2020

replace social_expenditure = 16.8 if cntry == "SK" & year == 2004
replace social_expenditure = 16 if cntry == "SK" & year == 2006
replace social_expenditure = 15.7 if cntry == "SK" & year == 2008
replace social_expenditure = 17.9 if cntry == "SK" & year == 2010
replace social_expenditure = 17.8 if cntry == "SK" & year == 2012
replace social_expenditure = 17.9 if cntry == "SK" & year == 2018
replace social_expenditure = 19.6 if cntry == "SK" & year == 2020

/* ------------------------------------------------------------------------
   SECTION 2: COUNTRY AND DEMOGRAPHICS TRANSFORMATION
   ------------------------------------------------------------------------ */

// Create numeric country variable from string country codes
encode cntry, gen(country)

// Generate country-level victim rate
gen crmvct_numeric = .
replace crmvct_numeric = 1 if crmvct == 1
replace crmvct_numeric = 0 if crmvct == 2
bysort country year: egen victim_rate = mean(crmvct_numeric)
replace victim_rate = victim_rate * 100

// Generate immigration rate
gen immig_rate2 = (immigrants/c_tpopsz)*100
label variable immig_rate "Immigration as percentage of total population"

// Generate standardized macro variables for analysis
egen z2victim_rate = std(victim_rate)
label variable z2victim_rate "Standardized country-level victimization rate"
egen z2social_expenditure = std(social_expenditure)
label variable z2social_expenditure "Standardized social expenditure"
egen z2immig_rate = std(immig_rate)
label variable z2immig_rate "Standardized immigration rate"
egen z2c_gini = std(c_gini)
label variable z2c_gini "Standardized Gini coefficient"
egen z2c_unraall = std(c_unraall) 
label variable z2c_unraall "Standardized unemployment rate"

// Generate country-year variable for multilevel models
egen country_year = concat(country year), punct("_")
label variable country_year "Country-year identifier for multilevel models"

/* ------------------------------------------------------------------------
   SECTION 3: INDIVIDUAL-LEVEL VARIABLE CLEANING AND RECODING
   ------------------------------------------------------------------------ */

// Recode fear of crime (aesfdrk) into a binary dummy variable (0/1)
recode aesfdrk (".a" = .) (".b" = .) (".c" = .)
recode aesfdrk 1/2=0 3/4=1, gen(foc)

// Clean gender variable
format gndr %9.0g
recode gndr (".a" = .)
gen gender = .
replace gender = 0 if gndr == 1
replace gender = 1 if gndr == 2
label variable gender "Gender (1=female, 0=male)"

// Recode age variable into categories
format agea %10.0f
gen age_group = agea
replace age_group = . if age_group < 18 | age_group > 75
recode age_group (18/29 = 1) (30/44 = 2) (45/64 = 3) (65/75 = 4)
label variable age_group "Age groups"

// Clean education years and recode into categories
recode eduyrs (".a" = .) (".b" = .) (".c" = .)
replace eduyrs = floor(eduyrs) if eduyrs != floor(eduyrs)
gen edu_level = eduyrs
replace edu_level = . if eduyrs > 30
recode edu_level (0/8=1)(9/13=2)(13/30=3)
label variable edu_level "Education level"

// Clean executive political leaning variable
replace c_execrlc = . if c_execrlc == 0

// Create a binary variable for living alone
gen living_alone = 0
replace living_alone = 1 if hhmmb == 1
label variable living_alone "Lives alone (1=yes, 0=no)"

// Create migration background indicators
egen migroup = group(brncntr facntr mocntr), label
gen first_generation = 0
gen second_generation = 0
replace first_generation = 1 if migroup == 8
replace second_generation = 1 if migroup == 4
label variable first_generation "First-generation immigrant"
label variable second_generation "Second-generation immigrant"

// Generate individual-level victimization variable
gen prior_victimization = .
replace prior_victimization = 1 if crmvct == 1
replace prior_victimization = 0 if crmvct == 2
label variable prior_victimization "Prior crime victimization (1=yes, 0=no)"

// Calculate ESS weight
gen anweight = pspwght*pweight 

/* ------------------------------------------------------------------------
   SECTION 4: DESCRIPTIVE STATISTICS
   ------------------------------------------------------------------------ */

// Generate dummy variables for executive political leaning
tabulate c_execrlc if c_execrlc != 0, generate(exec)

// Correlation matrix of main macro-level variables
pwcorr immig_rate c_gini c_unraall populist_gov exec2 exec3 social_expenditure victim_rate

// Descriptive statistics for fear of crime by country and year
table country year [pw=anweight], stat(mean foc) nformat(%5.3f)
table country [pw=anweight], stat(fvpercent aesfdrk) nformat(%5.3f)

// Visualize distributions of macro-level variables after absorbing fixed effects
fedistr z2immig_rate z2c_gini z2c_unraall populist_gov exec2 exec3 z2social_expenditure z2victim_rate, fe(country year) compare

// Summary statistics for all key variables in the analysis

sum gender i.age_group i.edu_level living_alone first_generation second_generation prior_victimization immig_rate c_gini c_unraall populist_gov i.c_execrlc social_expenditure victim_rate

/* ------------------------------------------------------------------------
   SECTION 5: MULTICOLLINEARITY TEST
   ------------------------------------------------------------------------ */

// Generate dummy variables for categorical predictors
tab c_execrlc, gen(c_execrlc_)
tab age_group, gen(age_)
tab edu_level, gen(edulevel_)

// Define variable groups for models
global indvars_basic "gender age_2 age_3 age_4 edulevel_2 edulevel_3"
global indvars_other "prior_victimization living_alone first_generation second_generation"
global macrovars "z2c_unraall z2c_gini z2immig_rate populist_gov c_execrlc_2 c_execrlc_3 z2social_expenditure z2victim_rate"
global FEs "i.country i.year"

// Logistic regression and collinearity test
logit foc $indvars_basic $indvars_other $macrovars $FEs [pweight=anweight], or
collin $indvars_basic $indvars_other $macrovars

/* ------------------------------------------------------------------------
   SECTION 6: MULTILEVEL MODELS - INDIVIDUAL MACRO PREDICTORS
   ------------------------------------------------------------------------ */

// Define basic variable sets for all models
global indvars_basic "gender i.age_group i.edu_level"
global indvars_other "living_alone first_generation second_generation"

// Test each macro-level predictor individually

// 1. Unemployment rate
melogit foc $indvars_basic $indvars_other z2c_unraall [pweight=anweight] || country_year:, or
margins, dydx(z2c_unraall)
meologit aesfdrk $indvars_basic $indvars_other z2c_unraall [pweight=anweight] || country_year:, or

// 2. Income inequality (Gini)
melogit foc $indvars_basic $indvars_other z2c_gini [pweight=anweight] || country_year:, or
margins, dydx(z2c_gini)
meologit aesfdrk $indvars_basic $indvars_other z2c_gini [pweight=anweight] || country_year:, or

// 3. Immigration rate
melogit foc $indvars_basic $indvars_other z2immig_rate [pweight=anweight] || country_year:, or
margins, dydx(z2immig_rate)
meologit aesfdrk $indvars_basic $indvars_other z2immig_rate [pweight=anweight] || country_year:, or

// 4. Populist government
melogit foc $indvars_basic $indvars_other populist_gov [pweight=anweight] || country_year:, or
margins, dydx(populist_gov)
meologit aesfdrk $indvars_basic $indvars_other populist_gov [pweight=anweight] || country_year:, or

// 5. Executive political leaning
melogit foc $indvars_basic $indvars_other i.c_execrlc [pweight=anweight] || country_year:, or
margins, dydx(i.c_execrlc)
meologit aesfdrk $indvars_basic $indvars_other i.c_execrlc [pweight=anweight] || country_year:, or

// 6. Social expenditure
melogit foc $indvars_basic $indvars_other z2social_expenditure [pweight=anweight] || country_year:, or
margins, dydx(z2social_expenditure)
meologit aesfdrk $indvars_basic $indvars_other z2social_expenditure [pweight=anweight] || country_year:, or

// 7. Victim rate
global indvars_other "prior_victimization living_alone first_generation second_generation"
melogit foc $indvars_basic $indvars_other z2victim_rate [pweight=anweight] || country_year:, or
margins, dydx(z2victim_rate)
meologit aesfdrk $indvars_basic $indvars_other z2victim_rate [pweight=anweight] || country_year:, or

/* ------------------------------------------------------------------------
   SECTION 7: MULTILEVEL MODELS - RANDOM-INTERCEPT MODELS
   ------------------------------------------------------------------------ */
   
// Define core sets of variables used throughout the analyses
global indvars_basic "gender i.age_group i.edu_level"       
global indvars_other "living_alone first_generation second_generation" 
global macrovars "z2c_unraall z2c_gini z2immig_rate populist_gov i.c_execrlc z2social_expenditure"  

/* ---- Binary outcome models ---- */

// Model 1. Binary outcome without victimization variables
melogit foc $indvars_basic $indvars_other $macrovars [pweight=anweight] || country_year:, or
// Calculate average marginal effects for macro variables
margins, dydx(z2c_unraall z2c_gini z2immig_rate populist_gov i.c_execrlc z2social_expenditure z2victim_rate)

// Model 2: Binary outcome with victimization variables
global indvars_other "i.prior_victimization living_alone first_generation second_generation"  // Added prior victimization
global macrovars "z2c_unraall z2c_gini z2immig_rate populist_gov i.c_execrlc z2social_expenditure z2victim_rate"  // Added country victimization rate
melogit foc $indvars_basic $indvars_other $macrovars [pweight=anweight] || country_year:, or
// Calculate average marginal effects for macro variables
margins, dydx(z2c_unraall z2c_gini z2immig_rate populist_gov i.c_execrlc z2social_expenditure z2victim_rate)

/* ---- Ordinal outcome models ---- */

// Model 1: Ordinal outcome without victimization variables
global indvars_basic "gender i.age_group i.edu_level"
global indvars_other "living_alone first_generation second_generation"
global macrovars "z2c_unraall z2c_gini z2immig_rate populist_gov i.c_execrlc z2social_expenditure"
meologit aesfdrk $indvars_basic $indvars_other $macrovars [pweight=anweight] || country_year:, or

// Model 2: Ordinal outcome with victimization variables
global indvars_other "prior_victimization living_alone first_generation second_generation"
global macrovars "z2c_unraall z2c_gini z2immig_rate populist_gov i.c_execrlc z2social_expenditure z2victim_rate"
meologit aesfdrk $indvars_basic $indvars_other $macrovars [pweight=anweight] || country_year:, or


/* ------------------------------------------------------------------------
   SECTION 8: MULTILEVEL MODELS - FIXED EFFECTS 
   ------------------------------------------------------------------------ */

// Define fixed effects variables
global FEs "i.country i.year"  // Country and year fixed effects

/* ---- Binary outcome models with fixed effects ---- */

// Model 1: Binary outcome without victimization variables + fixed effects
global indvars_basic "gender i.age_group i.edu_level"
global indvars_other "living_alone first_generation second_generation"
global macrovars "z2c_unraall z2c_gini z2immig_rate populist_gov i.c_execrlc z2social_expenditure"
melogit foc $indvars_basic $indvars_other $macrovars $FEs [pweight=anweight] || country_year:, or
// Calculate average marginal effects for macro variables
margins, dydx(z2c_unraall z2c_gini z2immig_rate populist_gov i.c_execrlc z2social_expenditure z2victim_rate)

// Model 2: Binary outcome with victimization variables + fixed effects
global indvars_other "prior_victimization living_alone first_generation second_generation"
global macrovars "z2c_unraall z2c_gini z2immig_rate populist_gov i.c_execrlc z2social_expenditure z2victim_rate"
melogit foc $indvars_basic $indvars_other $macrovars $FEs [pweight=anweight] || country_year:, or
// Calculate average marginal effects for macro variables
margins, dydx(z2c_unraall z2c_gini z2immig_rate populist_gov i.c_execrlc z2social_expenditure z2victim_rate)

/* ---- Ordinal outcome models with fixed effects ---- */

// Model 1: Ordinal outcome without victimization variables + fixed effects
global indvars_basic "gender i.age_group i.edu_level"
global indvars_other "living_alone first_generation second_generation"
global macrovars "z2c_unraall z2c_gini z2immig_rate populist_gov i.c_execrlc z2social_expenditure"
meologit aesfdrk $indvars_basic $indvars_other $macrovars $FEs [pweight=anweight] || country_year:, or

// Model 2: Ordinal outcome with victimization variables + fixed effects
global indvars_other "prior_victimization living_alone first_generation second_generation"
global macrovars "z2c_unraall z2c_gini z2immig_rate populist_gov i.c_execrlc z2social_expenditure z2victim_rate"
meologit aesfdrk $indvars_basic $indvars_other $macrovars $FEs [pweight=anweight] || country_year:, or