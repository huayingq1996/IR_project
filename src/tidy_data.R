# This R script is created to tidy the shulav dataset for use in regression

# Install package if it is not already installed
if (!require(here))
  install.packages("here")

# Library
library(tidyverse)
library(here)
source(here("src/import_previous_work.R"))
source(here("src/import_master_institution_data.R"))
source(here("src/import_bacc_institution_data.R"))

# Drop year
IPEDS_2009 <- IPEDS_2009 %>%
  select(-year)
IPEDS_2009_FE <- IPEDS_2009_FE %>%
  select(-year)
IPEDS_2010 <- IPEDS_2010 %>%
  select(-year)
IPEDS_2010_FE <- IPEDS_2010_FE %>%
  select(-year)
IPEDS_2011 <- IPEDS_2011 %>%
  select(-year)
IPEDS_2011_FE <- IPEDS_2011_FE %>%
  select(-year)
IPEDS_2015 <- IPEDS_2015 %>%
  select(-year)
IPEDS_2015_FE <- IPEDS_2015_FE %>%
  select(-year)
IPEDS_2016 <- IPEDS_2016 %>%
  select(-year)
IPEDS_2016_FE <- IPEDS_2016_FE %>%
  select(-year)
IPEDS_2017 <- IPEDS_2017 %>%
  select(-year)
IPEDS_2017_FE <- IPEDS_2017_FE %>%
  select(-year)

IPEDS_2009_bacc <- IPEDS_2009_bacc %>%
  select(-year)
IPEDS_2009_bacc_FE <- IPEDS_2009_bacc_FE %>%
  select(-year)
IPEDS_2010_bacc <- IPEDS_2010_bacc %>%
  select(-year)
IPEDS_2010_bacc_FE <- IPEDS_2010_bacc_FE %>%
  select(-year)
IPEDS_2011_bacc <- IPEDS_2011_bacc %>%
  select(-year)
IPEDS_2011_bacc_FE <- IPEDS_2011_bacc_FE %>%
  select(-year)
IPEDS_2015_bacc <- IPEDS_2015_bacc %>%
  select(-year)
IPEDS_2015_bacc_FE <- IPEDS_2015_bacc_FE %>%
  select(-year)
IPEDS_2016_bacc <- IPEDS_2016_bacc %>%
  select(-year)
IPEDS_2016_bacc_FE <- IPEDS_2016_bacc_FE %>%
  select(-year)
IPEDS_2017_bacc <- IPEDS_2017_bacc %>%
  select(-year)
IPEDS_2017_bacc_FE <- IPEDS_2017_bacc_FE %>%
  select(-year)

# Drop level of student in FE data sets
IPEDS_2009_FE <- IPEDS_2009_FE %>%
  select(-`EF2009A.Level of student`)
IPEDS_2010_FE <- IPEDS_2010_FE %>%
  select(-`EF2010A.Level of student`)
IPEDS_2011_FE <- IPEDS_2011_FE %>%
  select(-`EF2011A.Level of student`) 
IPEDS_2015_FE <- IPEDS_2015_FE %>%
  select(-`EF2015A.Level of student`)
IPEDS_2016_FE <- IPEDS_2016_FE %>%
  select(-`EF2016A.Level of student`)
IPEDS_2017_FE <- IPEDS_2017_FE %>%
  select(-`EF2017A.Level of student`)

IPEDS_2009_bacc_FE <- IPEDS_2009_bacc_FE %>%
  select(-`EF2009A.Level of student`)
IPEDS_2010_bacc_FE <- IPEDS_2010_bacc_FE %>%
  select(-`EF2010A.Level of student`)
IPEDS_2011_bacc_FE <- IPEDS_2011_bacc_FE %>%
  select(-`EF2011A.Level of student`) 
IPEDS_2015_bacc_FE <- IPEDS_2015_bacc_FE %>%
  select(-`EF2015A.Level of student`)
IPEDS_2016_bacc_FE <- IPEDS_2016_bacc_FE %>%
  select(-`EF2016A.Level of student`)
IPEDS_2017_bacc_FE <- IPEDS_2017_bacc_FE %>%
  select(-`EF2017A.Level of student`)
 
# Merge data of master institutions
master_join <- IPEDS_2009 %>%
  left_join(IPEDS_2009_FE, by = c("unitid", "institution name")) %>%
  left_join(IPEDS_2010, by = c("unitid", "institution name")) %>%
  left_join(IPEDS_2010_FE, by = c("unitid", "institution name")) %>%
  left_join(IPEDS_2011, by = c("unitid", "institution name")) %>%
  left_join(IPEDS_2011_FE, by = c("unitid", "institution name")) %>%
  left_join(IPEDS_2015, by = c("unitid", "institution name")) %>%
  left_join(IPEDS_2015_FE, by = c("unitid", "institution name")) %>%
  left_join(IPEDS_2016, by = c("unitid", "institution name")) %>%
  left_join(IPEDS_2016_FE, by = c("unitid", "institution name")) %>%
  left_join(IPEDS_2017, by = c("unitid", "institution name")) %>%
  left_join(IPEDS_2017_FE, by = c("unitid", "institution name"))

# Merge data of baccalaureate colleges
bacc_join <- IPEDS_2009_bacc %>%
  left_join(IPEDS_2009_bacc_FE, by = c("unitid", "institution name")) %>%
  left_join(IPEDS_2010_bacc, by = c("unitid", "institution name")) %>%
  left_join(IPEDS_2010_bacc_FE, by = c("unitid", "institution name")) %>%
  left_join(IPEDS_2011_bacc, by = c("unitid", "institution name")) %>%
  left_join(IPEDS_2011_bacc_FE, by = c("unitid", "institution name")) %>%
  left_join(IPEDS_2015_bacc, by = c("unitid", "institution name")) %>%
  left_join(IPEDS_2015_bacc_FE,  by = c("unitid", "institution name")) %>%
  left_join(IPEDS_2016_bacc, by = c("unitid", "institution name")) %>%
  left_join(IPEDS_2016_bacc_FE, by = c("unitid", "institution name")) %>%
  left_join(IPEDS_2017_bacc, by = c("unitid", "institution name")) %>%
  left_join(IPEDS_2017_bacc_FE, by = c("unitid", "institution name"))

# Drop IDX and Carnegie classfication
master_join <- master_join %>%
  select(-IDX_EF.x,
         -IDX_EF.y,
         -IDX_EF.x.x,
         -IDX_EF.y.y,
         -IDX_EF.x.x.x,
         -IDX_EF.y.y.y,
         -`HD2017.Carnegie Classification 2015: Basic`)
bacc_join <- bacc_join %>%
  select(-IDX_EF.x,
         -IDX_EF.x.x,
         -IDX_EF.x.x.x,
         -IDX_EF.y,
         -IDX_EF.y.y,
         -IDX_EF.y.y.y,
         -`HD2017.Carnegie Classification 2015: Basic`)

# Merge master institutions and baccalaureate colleges datasets 
bacc_master <- full_join(master_join,bacc_join)

# Replace missing religious data with 0
bacc_master <- bacc_master %>%
  mutate(`IC2009.Religious affiliation` = ifelse(is.na(`IC2009.Religious affiliation`), 0, `IC2009.Religious affiliation`),
         `IC2010.Religious affiliation` = ifelse(is.na(`IC2010.Religious affiliation`), 0, `IC2010.Religious affiliation`),
         `IC2011.Religious affiliation` = ifelse(is.na(`IC2011.Religious affiliation`), 0, `IC2011.Religious affiliation`),
         `IC2015.Religious affiliation` = ifelse(is.na(`IC2015.Religious affiliation`), 0, `IC2015.Religious affiliation`),
         `IC2016.Religious affiliation` = ifelse(is.na(`IC2016.Religious affiliation`), 0, `IC2016.Religious affiliation`),
         `IC2017.Religious affiliation` = ifelse(is.na(`IC2017.Religious affiliation`), 0, `IC2017.Religious affiliation`))


# Create a new variable called religious
bacc_master <- bacc_master %>%
  # If Religious affiliation is not "Not applicable", the school is not religious. Assign 1 to religious schools
  # and 0 to non-religious schools
  mutate(religious = ifelse(`IC2009.Religious affiliation` != "Not applicable"|
                              `IC2010.Religious affiliation` != "Not applicable"|
                              `IC2011.Religious affiliation` != "Not applicable"|
                              `IC2015.Religious affiliation` != "Not applicable"|
                              `IC2016.Religious affiliation` != "Not applicable"|
                              `IC2017.Religious affiliation` != "Not applicable", 0, 1)) %>%
  # Drop Religious affiliation after classification
  select(-`IC2009.Religious affiliation`,
         -`IC2010.Religious affiliation`,
         -`IC2011.Religious affiliation`,
         -`IC2015.Religious affiliation`,
         -`IC2016.Religious affiliation`,
         -`IC2017.Religious affiliation`)

# Add up SAT
bacc_master <- bacc_master %>%
  mutate(SAT_25th_2009 = `IC2009.SAT Critical Reading 25th percentile score` + `IC2009.SAT Math 25th percentile score`,
         SAT_75th_2009 = `IC2009.SAT Critical Reading 75th percentile score` + `IC2009.SAT Math 75th percentile score`,
         SAT_25th_2010 = `IC2010.SAT Critical Reading 25th percentile score` + `IC2010.SAT Math 25th percentile score`,
         SAT_75th_2010 = `IC2010.SAT Critical Reading 75th percentile score` + `IC2010.SAT Math 75th percentile score`,
         SAT_25th_2011 = `IC2011.SAT Critical Reading 25th percentile score` + `IC2011.SAT Math 25th percentile score`,
         SAT_75th_2011 = `IC2011.SAT Critical Reading 75th percentile score` + `IC2011.SAT Math 75th percentile score`,
         SAT_25th_2015 = `ADM2015.SAT Critical Reading 25th percentile score` + `ADM2015.SAT Math 25th percentile score`,
         SAT_75th_2015 = `ADM2015.SAT Critical Reading 75th percentile score`+ `ADM2015.SAT Math 75th percentile score`,
         SAT_25th_2016 = `ADM2016.SAT Critical Reading 25th percentile score` + `ADM2016.SAT Math 25th percentile score`,
         SAT_75th_2016 = `ADM2016.SAT Critical Reading 75th percentile score` + `ADM2016.SAT Math 75th percentile score`,
         SAT_25th_2017 = `ADM2017.SAT Evidence-Based Reading and Writing 25th percentile score` + `ADM2017.SAT Math 25th percentile score`,
         SAT_75th_2017 = `ADM2017.SAT Evidence-Based Reading and Writing 75th percentile score` + `ADM2017.SAT Math 75th percentile score`) %>%
  #Drop old SAT data
  select(-`IC2009.SAT Critical Reading 25th percentile score`,
         -`IC2009.SAT Critical Reading 75th percentile score`,
         -`IC2009.SAT Math 25th percentile score`,
         -`IC2009.SAT Math 75th percentile score`,
         -`IC2010.SAT Critical Reading 75th percentile score`,
         -`IC2010.SAT Critical Reading 25th percentile score`,
         -`IC2010.SAT Math 75th percentile score`,
         -`IC2010.SAT Math 25th percentile score`,
         -`IC2011.SAT Critical Reading 75th percentile score`,
         -`IC2011.SAT Critical Reading 25th percentile score`,
         -`IC2011.SAT Math 25th percentile score`,
         -`IC2011.SAT Math 75th percentile score`,
         -`ADM2015.SAT Critical Reading 25th percentile score`,
         -`ADM2015.SAT Critical Reading 75th percentile score`,
         -`ADM2015.SAT Math 25th percentile score`,
         -`ADM2015.SAT Math 75th percentile score`,
         -`ADM2016.SAT Critical Reading 25th percentile score`,
         -`ADM2016.SAT Critical Reading 75th percentile score`,
         -`ADM2016.SAT Math 25th percentile score`,
         -`ADM2016.SAT Math 75th percentile score`,
         -`ADM2017.SAT Evidence-Based Reading and Writing 25th percentile score`,
         -`ADM2017.SAT Evidence-Based Reading and Writing 75th percentile score`,
         -`ADM2017.SAT Math 25th percentile score`,
         -`ADM2017.SAT Math 75th percentile score`)

# If an institution has no data for both SAT and ACT assign 0 to its SAT score. If it returns NA, it suggests
# the instituion has ACT score but no SAT score. Then we do the conversion. Finally, create a new dummy
# variable called test_score. Assign 1 if test score is avaiable and 0 if absent.
test_score_test <- function(ACT, SAT){
  out <- ifelse(is.na(ACT) & is.na(SAT),0, SAT)
  return(out)
}

bacc_master <- bacc_master %>%
  mutate(SAT_25th_2009 = test_score_test(`IC2009.ACT Composite 25th percentile score`, SAT_25th_2009),
         SAT_75th_2009 = test_score_test(`IC2009.ACT Composite 75th percentile score`, SAT_75th_2009),
         SAT_25th_2010 = test_score_test(`IC2010.ACT Composite 25th percentile score`, SAT_25th_2010),
         SAT_75th_2010 = test_score_test(`IC2010.ACT Composite 75th percentile score`, SAT_75th_2010),
         SAT_25th_2011 = test_score_test(`IC2011.ACT Composite 25th percentile score`, SAT_25th_2011),
         SAT_75th_2011 = test_score_test(`IC2011.ACT Composite 75th percentile score`, SAT_75th_2011),
         SAT_25th_2015 = test_score_test(`ADM2015.ACT Composite 25th percentile score`, SAT_25th_2015),
         SAT_75th_2015 = test_score_test(`ADM2015.ACT Composite 75th percentile score`, SAT_75th_2015),
         SAT_25th_2016 = test_score_test(`ADM2016.ACT Composite 25th percentile score`, SAT_25th_2016),
         SAT_75th_2016 = test_score_test(`ADM2016.ACT Composite 75th percentile score`, SAT_75th_2016),
         SAT_25th_2017 = test_score_test(`ADM2017.ACT Composite 25th percentile score`, SAT_25th_2017),
         SAT_75th_2017 = test_score_test(`ADM2017.ACT Composite 75th percentile score`, SAT_75th_2017))

# Create a new variable marking institutions which only have ACT
bacc_master <- bacc_master %>%
  mutate(ACT_25th_2009_only = ifelse(is.na(SAT_25th_2009),1, 0),
         ACT_75th_2009_only = ifelse(is.na(SAT_75th_2009),1, 0),
         ACT_25th_2010_only = ifelse(is.na(SAT_25th_2010),1, 0),
         ACT_75th_2010_only = ifelse(is.na(SAT_75th_2010),1, 0),
         ACT_25th_2011_only = ifelse(is.na(SAT_25th_2011),1, 0),
         ACT_75th_2011_only = ifelse(is.na(SAT_75th_2011),1, 0),
         ACT_25th_2015_only = ifelse(is.na(SAT_25th_2015),1, 0),
         ACT_75th_2015_only = ifelse(is.na(SAT_75th_2015),1, 0),
         ACT_25th_2016_only = ifelse(is.na(SAT_25th_2016),1, 0),
         ACT_75th_2016_only = ifelse(is.na(SAT_75th_2016),1, 0),
         ACT_25th_2017_only = ifelse(is.na(SAT_25th_2017),1, 0),
         ACT_75th_2017_only = ifelse(is.na(SAT_75th_2017),1, 0))
# SAT, ACT, Conversion table
conversion <- read.table(text = "ACT SAT
36 1590
35 1540
34 1500
33 1460
32 1430
31 1400
30 1370
29 1340
28 1310
27 1280
26 1240
25 1210
24 1180
23 1140
22 1110
21 1080
20 1040
19 1010
18 970
17 930
16 890
15 850
14 800
13 760
12 710
11 670
10 630
9  590", header = TRUE)

# For schools only have ACT, convert ACT to SAT. I wrote a convert function to do this. If the dummy variable
# ACT_only is 1 that means the institution only has ACT score. If so, we replace the NA in SAT_xxth_20xx with
# the corresponding SAT score of its ACT score. Otherwise, we keep the SAT score. 
convert <- function(ACT_only, ACT, SAT){
  out <- ifelse(ACT_only == 1, conversion$SAT[match(ACT, conversion$ACT)], SAT)
}
bacc_master <- bacc_master %>%
  mutate(SAT_25th_2009 = convert(ACT_25th_2009_only, `IC2009.ACT Composite 25th percentile score`, SAT_25th_2009),
         SAT_75th_2009 = convert(ACT_75th_2009_only, `IC2009.ACT Composite 75th percentile score`, SAT_75th_2009),
         SAT_25th_2010 = convert(ACT_25th_2010_only, `IC2010.ACT Composite 25th percentile score`, SAT_25th_2010),
         SAT_75th_2010 = convert(ACT_75th_2010_only, `IC2010.ACT Composite 75th percentile score`, SAT_75th_2010),
         SAT_25th_2011 = convert(ACT_25th_2011_only, `IC2011.ACT Composite 25th percentile score`, SAT_25th_2011),
         SAT_75th_2011 = convert(ACT_75th_2011_only, `IC2011.ACT Composite 75th percentile score`, SAT_75th_2011),
         SAT_25th_2015 = convert(ACT_25th_2015_only, `ADM2015.ACT Composite 25th percentile score`, SAT_25th_2015),
         SAT_75th_2015 = convert(ACT_75th_2015_only, `ADM2015.ACT Composite 75th percentile score`, SAT_75th_2015),
         SAT_25th_2016 = convert(ACT_25th_2016_only, `ADM2016.ACT Composite 25th percentile score`, SAT_25th_2016),
         SAT_75th_2016 = convert(ACT_75th_2016_only, `ADM2016.ACT Composite 75th percentile score`, SAT_75th_2016),
         SAT_25th_2017 = convert(ACT_25th_2017_only, `ADM2017.ACT Composite 25th percentile score`, SAT_25th_2017),
         SAT_75th_2017 = convert(ACT_75th_2017_only, `ADM2017.ACT Composite 75th percentile score`, SAT_75th_2017))

# Drop the ACT_only dummy variable
bacc_master <- bacc_master %>%
  select(-ACT_25th_2009_only,
         -ACT_75th_2009_only,
         -ACT_25th_2010_only,
         -ACT_75th_2010_only,
         -ACT_25th_2011_only,
         -ACT_75th_2011_only,
         -ACT_25th_2015_only,
         -ACT_75th_2015_only,
         -ACT_25th_2016_only,
         -ACT_75th_2016_only,
         -ACT_25th_2017_only,
         -ACT_75th_2017_only)

# Create a dummy variable marking institutions missing both SAT and ACT, which is marked as 0 in SAT_xxth_20xx
bacc_master <- bacc_master %>%
  mutate(missing_test_2009 = ifelse(SAT_25th_2009 == 0 & SAT_75th_2009 == 0, 1, 0),
         missing_test_2010 = ifelse(SAT_25th_2010 == 0 & SAT_75th_2010 == 0, 1, 0),
         missing_test_2011 = ifelse(SAT_25th_2011 == 0 & SAT_75th_2011 == 0, 1, 0),
         missing_test_2015 = ifelse(SAT_25th_2015 == 0 & SAT_75th_2015 == 0, 1, 0),
         missing_test_2016 = ifelse(SAT_25th_2016 == 0 & SAT_75th_2016 == 0, 1, 0),
         missing_test_2017 = ifelse(SAT_25th_2017 == 0 & SAT_75th_2017 == 0, 1, 0))

# Drop ACT
bacc_master <- bacc_master %>%
  select(-`IC2009.ACT Composite 25th percentile score`,
         -`IC2009.ACT Composite 75th percentile score`,
         -`IC2010.ACT Composite 25th percentile score`,
         -`IC2010.ACT Composite 75th percentile score`,
         -`IC2011.ACT Composite 25th percentile score`,
         -`IC2011.ACT Composite 75th percentile score`,
         -`ADM2015.ACT Composite 25th percentile score`,
         -`ADM2015.ACT Composite 75th percentile score`,
         -`ADM2016.ACT Composite 25th percentile score`,
         -`ADM2016.ACT Composite 75th percentile score`,
         -`ADM2017.ACT Composite 25th percentile score`,
         -`ADM2017.ACT Composite 75th percentile score`)

# Create a dummy variable marking institutions missing total expense. If an institution is missing 
# total_expense code it as 1, otherwise, 0.
bacc_master <- bacc_master %>%
  mutate(missing_total_2009 = ifelse(is.na(`F0809_F2.Total expenses`), 1, 0),
         missing_total_2010 = ifelse(is.na(`F0910_F2.Total expenses`), 1, 0),
         missing_total_2011 = ifelse(is.na(`F1011_F2.Total expenses`), 1, 0),
         missing_total_2015 = ifelse(is.na(`F1415_F2.Total expenses`), 1, 0),
         missing_total_2016 = ifelse(is.na(`F1516_F2.Total expenses`), 1, 0),
         missing_total_2017 = ifelse(is.na(`F1617_F2.Total expenses`), 1, 0))

# Create a dummy variable to see how many institutions have no data of total expense for all years
bacc_master <- bacc_master %>%
  mutate(year_total_expense = missing_total_2009 +
           missing_total_2010 +
           missing_total_2011 +
           missing_total_2015 +
           missing_total_2016 +
           missing_total_2017)

# If an institution has no data of total expense for all years, code its total expense as 0
bacc_master <- bacc_master %>%
  mutate(`F0809_F2.Total expenses` = ifelse(year_total_expense == 6, 0, `F0809_F2.Total expenses`),
         `F0910_F2.Total expenses` = ifelse(year_total_expense == 6, 0, `F0910_F2.Total expenses`),
         `F1011_F2.Total expenses` = ifelse(year_total_expense == 6, 0, `F1011_F2.Total expenses`),
         `F1415_F2.Total expenses` = ifelse(year_total_expense == 6, 0, `F1415_F2.Total expenses`),
         `F1516_F2.Total expenses` = ifelse(year_total_expense == 6, 0, `F1516_F2.Total expenses`),
         `F1617_F2.Total expenses` = ifelse(year_total_expense == 6, 0, `F1617_F2.Total expenses`))

subset <- bacc_master %>%
  filter(year_total_expense != 6 & year_total_expense != 0) %>%
  select(`F0809_F2.Total expenses`,
         `F0910_F2.Total expenses`,
         `F1011_F2.Total expenses`,
         `F1415_F2.Total expenses`,
         `F1516_F2.Total expenses`,
         `F1617_F2.Total expenses`)

# To replace all NA's with the average of data from available years, first replace all NA's with 0
bacc_master <- bacc_master %>%
  mutate(`F0809_F2.Total expenses` = ifelse(is.na(`F0809_F2.Total expenses`), 0, `F0809_F2.Total expenses`),
         `F0910_F2.Total expenses` = ifelse(is.na(`F0910_F2.Total expenses`), 0, `F0910_F2.Total expenses`),
         `F1011_F2.Total expenses` = ifelse(is.na(`F1011_F2.Total expenses`), 0, `F1011_F2.Total expenses`),
         `F1415_F2.Total expenses` = ifelse(is.na(`F1415_F2.Total expenses`), 0, `F1415_F2.Total expenses`),
         `F1516_F2.Total expenses` = ifelse(is.na(`F1516_F2.Total expenses`), 0, `F1516_F2.Total expenses`),
         `F1617_F2.Total expenses` = ifelse(is.na(`F1617_F2.Total expenses`), 0, `F1617_F2.Total expenses`))

# Calculate the average
bacc_master <- bacc_master %>%
  mutate(total_expense_avg = (`F0809_F2.Total expenses`+
           `F0910_F2.Total expenses`+
           `F1011_F2.Total expenses`+
           `F1415_F2.Total expenses`+
           `F1516_F2.Total expenses`+
           `F1617_F2.Total expenses`)/(6-missing_total_2009-
                                         missing_total_2010-
                                         missing_total_2011-
                                         missing_total_2015-
                                         missing_total_2016-
                                         missing_total_2017)) %>%
  # Since some schools has no data for all years the sum of missing_total_20xx will be 0 thus producing
  # NA's. We need this extra step to replace those NA's with 0
  mutate(total_expense_avg = ifelse(is.na(total_expense_avg), 0, total_expense_avg))

# Replace 0 with average
bacc_master <- bacc_master %>%
  mutate(`F0910_F2.Total expenses` = ifelse(`F0910_F2.Total expenses` == 0, total_expense_avg, `F0910_F2.Total expenses`),
         `F1011_F2.Total expenses` = ifelse(`F1011_F2.Total expenses` == 0, total_expense_avg, `F1011_F2.Total expenses`),
         `F0809_F2.Total expenses` = ifelse(`F0809_F2.Total expenses` == 0, total_expense_avg, `F0809_F2.Total expenses`),
         `F1415_F2.Total expenses` = ifelse(`F1415_F2.Total expenses` == 0, total_expense_avg, `F1415_F2.Total expenses`),
         `F1516_F2.Total expenses` = ifelse(`F1516_F2.Total expenses` == 0, total_expense_avg, `F1516_F2.Total expenses`),
         `F1617_F2.Total expenses` = ifelse(`F1617_F2.Total expenses` == 0, total_expense_avg, `F1617_F2.Total expenses`)) %>%
  # Now we can drop the total_expense_avg column
  select(-total_expense_avg)

# Create a dummy variable marking schools missing salary data
bacc_master <- bacc_master %>%
  mutate(missing_salary_2009 = ifelse(is.na(`DRVHR2009.Average salary equated to 9-month contracts of full-time instructional staff - all ranks`), 1, 0),
         missing_salary_2010 = ifelse(is.na(`DRVHR2010.Average salary equated to 9-month contracts of full-time instructional staff - all ranks`), 1, 0),
         missing_salary_2011 = ifelse(is.na(`DRVHR2011.Average salary equated to 9-month contracts of full-time instructional staff - all ranks`), 1, 0),
         missing_salary_2015 = ifelse(is.na(`DRVHR2015.Average salary equated to 9 months of full-time instructional staff - all ranks`), 1, 0),
         missing_salary_2016 = ifelse(is.na(`DRVHR2016.Average salary equated to 9 months of full-time instructional staff - all ranks`), 1, 0),
         missing_salary_2017 = ifelse(is.na(`DRVHR2017.Average salary equated to 9 months of full-time instructional staff - all ranks`), 1, 0))

# Replace NA's with 0
bacc_master <- bacc_master %>%
  mutate(`DRVHR2009.Average salary equated to 9-month contracts of full-time instructional staff - all ranks` = ifelse(is.na(`DRVHR2009.Average salary equated to 9-month contracts of full-time instructional staff - all ranks`), 0, `DRVHR2009.Average salary equated to 9-month contracts of full-time instructional staff - all ranks`),
         `DRVHR2010.Average salary equated to 9-month contracts of full-time instructional staff - all ranks` = ifelse(is.na(`DRVHR2010.Average salary equated to 9-month contracts of full-time instructional staff - all ranks`), 0, `DRVHR2010.Average salary equated to 9-month contracts of full-time instructional staff - all ranks`),
         `DRVHR2011.Average salary equated to 9-month contracts of full-time instructional staff - all ranks` = ifelse(is.na(`DRVHR2011.Average salary equated to 9-month contracts of full-time instructional staff - all ranks`), 0, `DRVHR2011.Average salary equated to 9-month contracts of full-time instructional staff - all ranks`),
         `DRVHR2015.Average salary equated to 9 months of full-time instructional staff - all ranks` = ifelse(is.na(`DRVHR2015.Average salary equated to 9 months of full-time instructional staff - all ranks`), 0, `DRVHR2015.Average salary equated to 9 months of full-time instructional staff - all ranks`),
         `DRVHR2016.Average salary equated to 9 months of full-time instructional staff - all ranks` = ifelse(is.na(`DRVHR2016.Average salary equated to 9 months of full-time instructional staff - all ranks`), 0, `DRVHR2016.Average salary equated to 9 months of full-time instructional staff - all ranks`),
         `DRVHR2017.Average salary equated to 9 months of full-time instructional staff - all ranks` = ifelse(is.na(`DRVHR2017.Average salary equated to 9 months of full-time instructional staff - all ranks`), 0, `DRVHR2017.Average salary equated to 9 months of full-time instructional staff - all ranks`))

# Calculate average salary
bacc_master <- bacc_master %>%
  mutate(salary_avg = (`DRVHR2009.Average salary equated to 9-month contracts of full-time instructional staff - all ranks` + 
           `DRVHR2010.Average salary equated to 9-month contracts of full-time instructional staff - all ranks` +
           `DRVHR2011.Average salary equated to 9-month contracts of full-time instructional staff - all ranks` +
           `DRVHR2015.Average salary equated to 9 months of full-time instructional staff - all ranks` +
           `DRVHR2016.Average salary equated to 9 months of full-time instructional staff - all ranks` +
           `DRVHR2017.Average salary equated to 9 months of full-time instructional staff - all ranks`)/(6 - missing_salary_2009 -
                                                                                                           missing_salary_2010 -
                                                                                                           missing_salary_2011 - 
                                                                                                           missing_salary_2015 -
                                                                                                           missing_salary_2016 - 
                                                                                                           missing_salary_2017)) %>%
  mutate(salary_avg = ifelse(is.na(salary_avg), 0, salary_avg)) %>%
  mutate(`DRVHR2009.Average salary equated to 9-month contracts of full-time instructional staff - all ranks` = ifelse(`DRVHR2009.Average salary equated to 9-month contracts of full-time instructional staff - all ranks` == 0, salary_avg, `DRVHR2009.Average salary equated to 9-month contracts of full-time instructional staff - all ranks`),
         `DRVHR2010.Average salary equated to 9-month contracts of full-time instructional staff - all ranks` = ifelse(`DRVHR2010.Average salary equated to 9-month contracts of full-time instructional staff - all ranks` == 0, salary_avg, `DRVHR2010.Average salary equated to 9-month contracts of full-time instructional staff - all ranks`),
         `DRVHR2011.Average salary equated to 9-month contracts of full-time instructional staff - all ranks` = ifelse(`DRVHR2011.Average salary equated to 9-month contracts of full-time instructional staff - all ranks` == 0 , salary_avg, `DRVHR2011.Average salary equated to 9-month contracts of full-time instructional staff - all ranks`),
         `DRVHR2015.Average salary equated to 9 months of full-time instructional staff - all ranks` = ifelse(`DRVHR2015.Average salary equated to 9 months of full-time instructional staff - all ranks` == 0, salary_avg, `DRVHR2015.Average salary equated to 9 months of full-time instructional staff - all ranks`),
         `DRVHR2016.Average salary equated to 9 months of full-time instructional staff - all ranks` = ifelse(`DRVHR2016.Average salary equated to 9 months of full-time instructional staff - all ranks` == 0, salary_avg,`DRVHR2016.Average salary equated to 9 months of full-time instructional staff - all ranks`),
         `DRVHR2017.Average salary equated to 9 months of full-time instructional staff - all ranks` = ifelse(`DRVHR2017.Average salary equated to 9 months of full-time instructional staff - all ranks` == 0, salary_avg, `DRVHR2017.Average salary equated to 9 months of full-time instructional staff - all ranks`)) %>%
  select(-salary_avg)

# Create a dummy variable marking schools missing graduation rate
bacc_master <- bacc_master %>%
  mutate(missing_grad_2009 = ifelse(is.na(`DRVGR2009.Graduation rate - Bachelor degree within 6 years, total`), 1, 0),
         missing_grad_2010 = ifelse(is.na(`DRVGR2010.Graduation rate - Bachelor degree within 6 years, total`), 1, 0),
         missing_grad_2011 = ifelse(is.na(`DRVGR2011.Graduation rate - bachelor's degree within 6 years, total`), 1, 0),
         missing_grad_2015 = ifelse(is.na(`DRVGR2015.Graduation rate - Bachelor degree within 6 years, total`), 1, 0),
         missing_grad_2016 = ifelse(is.na(`DRVGR2016.Graduation rate - Bachelor degree within 6 years, total`), 1, 0),
         missing_grad_2017 = ifelse(is.na(`DRVGR2017.Graduation rate - Bachelor degree within 6 years, total`), 1, 0)) %>%
  # Replace NA with 0
  mutate(`DRVGR2009.Graduation rate - Bachelor degree within 6 years, total` = ifelse(is.na(`DRVGR2009.Graduation rate - Bachelor degree within 6 years, total`), 0, `DRVGR2009.Graduation rate - Bachelor degree within 6 years, total`),
         `DRVGR2010.Graduation rate - Bachelor degree within 6 years, total` = ifelse(is.na(`DRVGR2010.Graduation rate - Bachelor degree within 6 years, total`), 0,  `DRVGR2010.Graduation rate - Bachelor degree within 6 years, total`))

# Export bacc_master dataset
write_csv(bacc_master, here("data/bacc_master.csv"))
