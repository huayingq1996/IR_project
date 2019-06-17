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
9  590
2  500", header = TRUE)

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
         missing_grad_2017 = ifelse(is.na(`DRVGR2017.Graduation rate - Bachelor degree within 6 years, total`), 1, 0))

# Replace NA's with 0
bacc_master <- bacc_master %>%
  mutate(`DRVGR2009.Graduation rate - Bachelor degree within 6 years, total` = ifelse(is.na(`DRVGR2009.Graduation rate - Bachelor degree within 6 years, total`), 0, `DRVGR2009.Graduation rate - Bachelor degree within 6 years, total`),
         `DRVGR2010.Graduation rate - Bachelor degree within 6 years, total` = ifelse(is.na(`DRVGR2010.Graduation rate - Bachelor degree within 6 years, total`), 0, `DRVGR2010.Graduation rate - Bachelor degree within 6 years, total`),
         `DRVGR2011.Graduation rate - bachelor's degree within 6 years, total` = ifelse(is.na(`DRVGR2011.Graduation rate - bachelor's degree within 6 years, total`), 0, `DRVGR2011.Graduation rate - bachelor's degree within 6 years, total`),
         `DRVGR2015.Graduation rate - Bachelor degree within 6 years, total` = ifelse(is.na(`DRVGR2015.Graduation rate - Bachelor degree within 6 years, total`), 0, `DRVGR2015.Graduation rate - Bachelor degree within 6 years, total`),
         `DRVGR2016.Graduation rate - Bachelor degree within 6 years, total` = ifelse(is.na(`DRVGR2016.Graduation rate - Bachelor degree within 6 years, total`), 0, `DRVGR2016.Graduation rate - Bachelor degree within 6 years, total`),
         `DRVGR2017.Graduation rate - Bachelor degree within 6 years, total` = ifelse(is.na(`DRVGR2017.Graduation rate - Bachelor degree within 6 years, total`), 0, `DRVGR2017.Graduation rate - Bachelor degree within 6 years, total`))

# Calculate average graduation rate
bacc_master <- bacc_master %>%
  mutate(grad_avg = (`DRVGR2009.Graduation rate - Bachelor degree within 6 years, total` +
           `DRVGR2010.Graduation rate - Bachelor degree within 6 years, total` +
           `DRVGR2011.Graduation rate - bachelor's degree within 6 years, total` +
           `DRVGR2015.Graduation rate - Bachelor degree within 6 years, total` +
           `DRVGR2016.Graduation rate - Bachelor degree within 6 years, total` +
           `DRVGR2017.Graduation rate - Bachelor degree within 6 years, total`)/(6 - missing_grad_2009-
           missing_grad_2010-
           missing_grad_2011-
           missing_grad_2015-
           missing_grad_2016-
           missing_grad_2017)) %>%
  mutate(grad_avg = ifelse(is.na(grad_avg), 0, grad_avg)) %>%
  mutate(`DRVGR2009.Graduation rate - Bachelor degree within 6 years, total` = ifelse(`DRVGR2009.Graduation rate - Bachelor degree within 6 years, total` == 0, grad_avg, `DRVGR2009.Graduation rate - Bachelor degree within 6 years, total`),
         `DRVGR2010.Graduation rate - Bachelor degree within 6 years, total` = ifelse(`DRVGR2010.Graduation rate - Bachelor degree within 6 years, total` == 0, grad_avg, `DRVGR2010.Graduation rate - Bachelor degree within 6 years, total`),
         `DRVGR2011.Graduation rate - bachelor's degree within 6 years, total` = ifelse(`DRVGR2011.Graduation rate - bachelor's degree within 6 years, total` == 0, grad_avg, `DRVGR2011.Graduation rate - bachelor's degree within 6 years, total`),
         `DRVGR2015.Graduation rate - Bachelor degree within 6 years, total` = ifelse(`DRVGR2015.Graduation rate - Bachelor degree within 6 years, total` == 0, grad_avg, `DRVGR2015.Graduation rate - Bachelor degree within 6 years, total`),
         `DRVGR2016.Graduation rate - Bachelor degree within 6 years, total` = ifelse(`DRVGR2016.Graduation rate - Bachelor degree within 6 years, total` == 0, grad_avg, `DRVGR2016.Graduation rate - Bachelor degree within 6 years, total`),
         `DRVGR2017.Graduation rate - Bachelor degree within 6 years, total` = ifelse(`DRVGR2017.Graduation rate - Bachelor degree within 6 years, total` == 0, grad_avg, `DRVGR2017.Graduation rate - Bachelor degree within 6 years, total`)) %>%
  select(-grad_avg)

# Create a dummy variable marking schools missing instructional total amount
bacc_master <- bacc_master %>%
  mutate(missing_instruction_2009 = ifelse(is.na(`F0809_F2.Instruction-Total amount`), 1, 0),
         missing_instruction_2010 = ifelse(is.na(`F0910_F2.Instruction-Total amount`), 1, 0),
         missing_instruction_2011 = ifelse(is.na(`F1011_F2.Instruction-Total amount`), 1, 0),
         missing_instruction_2015 = ifelse(is.na(`F1415_F2.Instruction-Total amount`), 1, 0),
         missing_instruction_2016 = ifelse(is.na(`F1516_F2.Instruction-Total amount`), 1, 0),
         missing_instruction_2017 = ifelse(is.na(`F1617_F2.Instruction-Total amount`), 1, 0))

# Replace NA's with 0
bacc_master <- bacc_master %>%
  mutate(`F0809_F2.Instruction-Total amount` = ifelse(is.na(`F0809_F2.Instruction-Total amount`), 0, `F0809_F2.Instruction-Total amount`),
         `F0910_F2.Instruction-Total amount` = ifelse(is.na(`F0910_F2.Instruction-Total amount`), 0, `F0910_F2.Instruction-Total amount`),
         `F1011_F2.Instruction-Total amount` = ifelse(is.na(`F1011_F2.Instruction-Total amount`), 0, `F1011_F2.Instruction-Total amount`),
         `F1415_F2.Instruction-Total amount` = ifelse(is.na(`F1415_F2.Instruction-Total amount`), 0, `F1415_F2.Instruction-Total amount`),
         `F1516_F2.Instruction-Total amount` = ifelse(is.na(`F1516_F2.Instruction-Total amount`), 0, `F1516_F2.Instruction-Total amount`),
         `F1617_F2.Instruction-Total amount` = ifelse(is.na(`F1617_F2.Instruction-Total amount`), 0, `F1617_F2.Instruction-Total amount`))

# Calculate average instructional total amount
bacc_master <- bacc_master %>%
  mutate(instruction_avg = (`F0809_F2.Instruction-Total amount` +
           `F0910_F2.Instruction-Total amount` +
           `F1011_F2.Instruction-Total amount` +
           `F1415_F2.Instruction-Total amount` +
           `F1516_F2.Instruction-Total amount` +
           `F1617_F2.Instruction-Total amount`)/ (6 - missing_instruction_2009 -
           missing_instruction_2010 -
           missing_instruction_2011 -
           missing_instruction_2015 -
           missing_instruction_2016 -
           missing_instruction_2017)) %>%
  mutate(instruction_avg = ifelse(is.na(instruction_avg), 0, instruction_avg))

# Replace 0 with average instructional amount
bacc_master <- bacc_master %>%
  mutate(`F0809_F2.Instruction-Total amount` = ifelse(`F0809_F2.Instruction-Total amount` == 0, instruction_avg, `F0809_F2.Instruction-Total amount`),
         `F0910_F2.Instruction-Total amount` = ifelse(`F0910_F2.Instruction-Total amount` == 0, instruction_avg, `F0910_F2.Instruction-Total amount`),
         `F1011_F2.Instruction-Total amount` = ifelse(`F1011_F2.Instruction-Total amount` == 0, instruction_avg, `F1011_F2.Instruction-Total amount`),
         `F1415_F2.Instruction-Total amount` = ifelse(`F1415_F2.Instruction-Total amount` == 0, instruction_avg, `F1415_F2.Instruction-Total amount`),
         `F1516_F2.Instruction-Total amount` = ifelse(`F1516_F2.Instruction-Total amount` == 0, instruction_avg, `F1516_F2.Instruction-Total amount`),
         `F1617_F2.Instruction-Total amount` = ifelse(`F1617_F2.Instruction-Total amount` == 0, instruction_avg, `F1617_F2.Instruction-Total amount`)) %>%
  select(-instruction_avg)

# Create dummy variable marking schools missing percent admitted
bacc_master <- bacc_master %>%
  mutate(missing_percent_admitted_2009 = ifelse(is.na(`DRVIC2009.Percent admitted - total`), 1, 0),
         missing_percent_admitted_2010 = ifelse(is.na(`DRVIC2010.Percent admitted - total`), 1, 0),
         missing_percent_admitted_2011 = ifelse(is.na(`DRVIC2011.Percent admitted - total`), 1, 0),
         missing_percent_admitted_2015 = ifelse(is.na(`DRVADM2015.Percent admitted - total`), 1, 0),
         missing_percent_admitted_2016 = ifelse(is.na(`DRVADM2016.Percent admitted - total`), 1, 0),
         missing_percent_admitted_2017 = ifelse(is.na(`DRVADM2017.Percent admitted - total`), 1, 0))

# Replace NA's with 0
bacc_master <- bacc_master %>%
  mutate(`DRVIC2009.Percent admitted - total` = ifelse(is.na(`DRVIC2009.Percent admitted - total`), 0, `DRVIC2009.Percent admitted - total`),
         `DRVIC2010.Percent admitted - total` = ifelse(is.na(`DRVIC2010.Percent admitted - total`), 0, `DRVIC2010.Percent admitted - total`),
         `DRVIC2011.Percent admitted - total` = ifelse(is.na(`DRVIC2011.Percent admitted - total`), 0, `DRVIC2011.Percent admitted - total`),
         `DRVADM2015.Percent admitted - total` = ifelse(is.na(`DRVADM2015.Percent admitted - total`), 0, `DRVADM2015.Percent admitted - total`),
         `DRVADM2016.Percent admitted - total` = ifelse(is.na(`DRVADM2016.Percent admitted - total`), 0, `DRVADM2016.Percent admitted - total`),
         `DRVADM2017.Percent admitted - total` = ifelse(is.na(`DRVADM2017.Percent admitted - total`), 0, `DRVADM2017.Percent admitted - total`))

# Calculate average percent admitted
bacc_master <- bacc_master %>%
  mutate(percent_admitted_avg = (`DRVIC2009.Percent admitted - total` +
           `DRVIC2010.Percent admitted - total` +
           `DRVIC2011.Percent admitted - total` +
           `DRVADM2015.Percent admitted - total` +
           `DRVADM2016.Percent admitted - total` +
           `DRVADM2017.Percent admitted - total`)/ (6 - missing_percent_admitted_2009 -
           missing_percent_admitted_2010 -
           missing_percent_admitted_2011 -
           missing_percent_admitted_2015 -
           missing_percent_admitted_2016 -
           missing_percent_admitted_2017)) %>%
  mutate(percent_admitted_avg = ifelse(is.na(percent_admitted_avg), 0, percent_admitted_avg))

# Replace 0 with percent_admitted_avg
bacc_master <- bacc_master %>%
  mutate(`DRVIC2009.Percent admitted - total` = ifelse(`DRVIC2009.Percent admitted - total` == 0, percent_admitted_avg, `DRVIC2009.Percent admitted - total`),
         `DRVIC2010.Percent admitted - total` = ifelse(`DRVIC2010.Percent admitted - total` == 0, percent_admitted_avg, `DRVIC2010.Percent admitted - total`),
         `DRVIC2011.Percent admitted - total` = ifelse(`DRVIC2011.Percent admitted - total` == 0, percent_admitted_avg, `DRVIC2011.Percent admitted - total`),
         `DRVADM2015.Percent admitted - total` = ifelse(`DRVADM2015.Percent admitted - total` == 0, percent_admitted_avg, `DRVADM2015.Percent admitted - total`),
         `DRVADM2016.Percent admitted - total` = ifelse(`DRVADM2016.Percent admitted - total` == 0, percent_admitted_avg, `DRVADM2016.Percent admitted - total`),
         `DRVADM2017.Percent admitted - total` = ifelse(`DRVADM2017.Percent admitted - total` == 0, percent_admitted_avg, `DRVADM2017.Percent admitted - total`)) %>%
  select(-percent_admitted_avg)

# Create a dummy variable marking schools missing admission yield
bacc_master <- bacc_master %>%
  mutate(missing_admission_yield_2009 = ifelse(is.na(`DRVIC2009.Admissions yield - total`), 1, 0),
         missing_admission_yield_2010 = ifelse(is.na(`DRVIC2010.Admissions yield - total`), 1, 0),
         missing_admission_yield_2011 = ifelse(is.na(`DRVIC2011.Admissions yield - total`), 1, 0),
         missing_admission_yield_2015 = ifelse(is.na(`DRVADM2015.Admissions yield - total`), 1, 0),
         missing_admission_yield_2016 = ifelse(is.na(`DRVADM2016.Admissions yield - total`), 1, 0),
         missing_admission_yield_2017 = ifelse(is.na(`DRVADM2017.Admissions yield - total`), 1, 0))

# Replace NA's with 0
bacc_master <- bacc_master %>%
  mutate(`DRVIC2009.Admissions yield - total` = ifelse(is.na(`DRVIC2009.Admissions yield - total`), 0, `DRVIC2009.Admissions yield - total`),
         `DRVIC2010.Admissions yield - total` = ifelse(is.na(`DRVIC2010.Admissions yield - total`), 0, `DRVIC2010.Admissions yield - total`),
         `DRVIC2011.Admissions yield - total` = ifelse(is.na(`DRVIC2011.Admissions yield - total`), 0, `DRVIC2011.Admissions yield - total`),
         `DRVADM2015.Admissions yield - total` = ifelse(is.na(`DRVADM2015.Admissions yield - total`), 0, `DRVADM2015.Admissions yield - total`),
         `DRVADM2016.Admissions yield - total` = ifelse(is.na(`DRVADM2016.Admissions yield - total`), 0, `DRVADM2016.Admissions yield - total`),
         `DRVADM2017.Admissions yield - total` = ifelse(is.na(`DRVADM2017.Admissions yield - total`), 0, `DRVADM2017.Admissions yield - total`))

# Calculate admission_yield_avg
bacc_master <- bacc_master %>%
  mutate(admission_yield_avg = (`DRVIC2009.Admissions yield - total` +
           `DRVIC2010.Admissions yield - total` +
           `DRVIC2011.Admissions yield - total` +
           `DRVADM2015.Admissions yield - total` +
           `DRVADM2016.Admissions yield - total` +
           `DRVADM2017.Admissions yield - total`)/ (6- missing_admission_yield_2009 -
           missing_admission_yield_2010 -
           missing_admission_yield_2011 -
           missing_admission_yield_2015 -
           missing_admission_yield_2016 -
           missing_admission_yield_2017)) %>%
  mutate(admission_yield_avg = ifelse(is.na(admission_yield_avg), 0, admission_yield_avg))

# Replace 0 with admission_yield_avg
bacc_master <- bacc_master %>%
  mutate(`DRVIC2009.Admissions yield - total` = ifelse(`DRVIC2009.Admissions yield - total` == 0, admission_yield_avg, `DRVIC2009.Admissions yield - total`),
         `DRVIC2010.Admissions yield - total` = ifelse(`DRVIC2010.Admissions yield - total` == 0, admission_yield_avg, `DRVIC2010.Admissions yield - total`),
         `DRVIC2011.Admissions yield - total` = ifelse(`DRVIC2011.Admissions yield - total` == 0, admission_yield_avg, `DRVIC2011.Admissions yield - total`),
         `DRVADM2015.Admissions yield - total` = ifelse(`DRVADM2015.Admissions yield - total` == 0, admission_yield_avg, `DRVADM2015.Admissions yield - total`),
         `DRVADM2016.Admissions yield - total` = ifelse(`DRVADM2016.Admissions yield - total` == 0, admission_yield_avg, `DRVADM2016.Admissions yield - total`),
         `DRVADM2017.Admissions yield - total` = ifelse(`DRVADM2017.Admissions yield - total` == 0, admission_yield_avg, `DRVADM2017.Admissions yield - total`)) %>%
  select(-admission_yield_avg)

# Create a dummy variable marking schools missing value of endowment
bacc_master <- bacc_master %>%
  mutate(missing_endowment_2009 = ifelse(is.na(`F0809_F2.Value of endowment assets at the end of the fiscal year`), 1, 0),
         missing_endowment_2010 = ifelse(is.na(`F0910_F2.Value of endowment assets at the end of the fiscal year`), 1, 0),
         missing_endowment_2011 = ifelse(is.na(`F1011_F2.Value of endowment assets at the end of the fiscal year`), 1, 0),
         missing_endowment_2015 = ifelse(is.na(`F1415_F2.Value of endowment assets at the end of the fiscal year`), 1, 0),
         missing_endowment_2016 = ifelse(is.na(`F1516_F2.Value of endowment assets at the end of the fiscal year`), 1, 0),
         missing_endowment_2017 = ifelse(is.na(`F1617_F2.Value of endowment assets at the end of the fiscal year`), 1, 0))
  
# Replace NA with 0
bacc_master <- bacc_master %>%
  mutate(`F0809_F2.Value of endowment assets at the end of the fiscal year` = ifelse(is.na(`F0809_F2.Value of endowment assets at the end of the fiscal year`), 0, `F0809_F2.Value of endowment assets at the end of the fiscal year`),
         `F0910_F2.Value of endowment assets at the end of the fiscal year` = ifelse(is.na(`F0910_F2.Value of endowment assets at the end of the fiscal year`), 0, `F0910_F2.Value of endowment assets at the end of the fiscal year`),
         `F1011_F2.Value of endowment assets at the end of the fiscal year` = ifelse(is.na(`F1011_F2.Value of endowment assets at the end of the fiscal year`), 0, `F1011_F2.Value of endowment assets at the end of the fiscal year`),
         `F1415_F2.Value of endowment assets at the end of the fiscal year` = ifelse(is.na(`F1415_F2.Value of endowment assets at the end of the fiscal year`), 0, `F1415_F2.Value of endowment assets at the end of the fiscal year`),
         `F1516_F2.Value of endowment assets at the end of the fiscal year` = ifelse(is.na(`F1516_F2.Value of endowment assets at the end of the fiscal year`), 0, `F1516_F2.Value of endowment assets at the end of the fiscal year`),
         `F1617_F2.Value of endowment assets at the end of the fiscal year` = ifelse(is.na(`F1617_F2.Value of endowment assets at the end of the fiscal year`), 0, `F1617_F2.Value of endowment assets at the end of the fiscal year`))

# Calculate endowment_avg
bacc_master <- bacc_master %>%
  mutate(endowment_avg = (`F0809_F2.Value of endowment assets at the end of the fiscal year` +
           `F0910_F2.Value of endowment assets at the end of the fiscal year` +
           `F1011_F2.Value of endowment assets at the end of the fiscal year` +
           `F1415_F2.Value of endowment assets at the end of the fiscal year` +
           `F1516_F2.Value of endowment assets at the end of the fiscal year` +
           `F1617_F2.Value of endowment assets at the end of the fiscal year`)/ (6 - missing_endowment_2009 -
           missing_endowment_2010 -
           missing_endowment_2011 - 
           missing_endowment_2015 -
           missing_endowment_2016 -
           missing_endowment_2017)) %>%
  mutate(endowment_avg = ifelse(is.na(endowment_avg), 0, endowment_avg))

# Replace 0 with endowment_avg
bacc_master <- bacc_master %>%
  mutate(`F0809_F2.Value of endowment assets at the end of the fiscal year` = ifelse(`F0809_F2.Value of endowment assets at the end of the fiscal year` == 0, endowment_avg, `F0809_F2.Value of endowment assets at the end of the fiscal year`),
         `F0910_F2.Value of endowment assets at the end of the fiscal year` = ifelse(`F0910_F2.Value of endowment assets at the end of the fiscal year` == 0, endowment_avg, `F0910_F2.Value of endowment assets at the end of the fiscal year`),
         `F1011_F2.Value of endowment assets at the end of the fiscal year` = ifelse(`F1011_F2.Value of endowment assets at the end of the fiscal year` == 0, endowment_avg, `F1011_F2.Value of endowment assets at the end of the fiscal year`),
         `F1415_F2.Value of endowment assets at the end of the fiscal year` = ifelse(`F1415_F2.Value of endowment assets at the end of the fiscal year` == 0, endowment_avg, `F1415_F2.Value of endowment assets at the end of the fiscal year`),
         `F1516_F2.Value of endowment assets at the end of the fiscal year` = ifelse(`F1516_F2.Value of endowment assets at the end of the fiscal year` == 0, endowment_avg, `F1516_F2.Value of endowment assets at the end of the fiscal year`),
         `F1617_F2.Value of endowment assets at the end of the fiscal year` = ifelse(`F1617_F2.Value of endowment assets at the end of the fiscal year` == 0, endowment_avg, `F1617_F2.Value of endowment assets at the end of the fiscal year`)) %>%
  select(-endowment_avg)

# Create a dummy variable marking schools missing grand total student
bacc_master <- bacc_master %>%
  mutate(missing_grand_total_2009 = ifelse(is.na(`EF2009A.Grand total`), 1, 0),
         missing_grand_total_2010 = ifelse(is.na(`EF2010A.Grand total`), 1, 0),
         missing_grand_total_2011 = ifelse(is.na(`EF2011A.Grand total`), 1, 0),
         missing_grand_total_2015 = ifelse(is.na(`EF2015A.Grand total`), 1, 0),
         missing_grand_total_2016 = ifelse(is.na(`EF2016A.Grand total`), 1, 0),
         missing_grand_total_2017 = ifelse(is.na(`EF2017A.Grand total`), 1, 0))

# Replace NA with 0
bacc_master <- bacc_master %>%
  mutate(`EF2009A.Grand total` = ifelse(is.na(`EF2009A.Grand total`), 0, `EF2009A.Grand total`),
         `EF2010A.Grand total` = ifelse(is.na(`EF2010A.Grand total`), 0, `EF2010A.Grand total`),
         `EF2011A.Grand total` = ifelse(is.na(`EF2011A.Grand total`), 0, `EF2011A.Grand total`),
         `EF2015A.Grand total` = ifelse(is.na(`EF2015A.Grand total`), 0, `EF2015A.Grand total`),
         `EF2016A.Grand total` = ifelse(is.na(`EF2016A.Grand total`), 0, `EF2016A.Grand total`),
         `EF2017A.Grand total` = ifelse(is.na(`EF2017A.Grand total`), 0, `EF2017A.Grand total`))

# Calculate grand_total_avg
bacc_master <- bacc_master %>%
  mutate(grand_total_avg = (`EF2009A.Grand total` +
           `EF2010A.Grand total` +
           `EF2011A.Grand total` +
           `EF2015A.Grand total` +
           `EF2016A.Grand total` +
           `EF2017A.Grand total`)/ (6 - missing_grand_total_2009 -
           missing_grand_total_2010 -
           missing_grand_total_2011 -
           missing_grand_total_2015 -
           missing_grand_total_2016 -
           missing_grand_total_2017)) %>%
  mutate(grand_total_avg = ifelse(is.na(grand_total_avg), 0, grand_total_avg))

# Replace 0 with grand_total_avg
bacc_master <- bacc_master %>%
  mutate(`EF2009A.Grand total` = ifelse(`EF2009A.Grand total` == 0, grand_total_avg, `EF2009A.Grand total`),
         `EF2010A.Grand total` = ifelse(`EF2010A.Grand total` == 0, grand_total_avg, `EF2010A.Grand total`),
         `EF2011A.Grand total` = ifelse(`EF2011A.Grand total` == 0, grand_total_avg, `EF2011A.Grand total`),
         `EF2015A.Grand total` = ifelse(`EF2015A.Grand total` == 0, grand_total_avg, `EF2015A.Grand total`),
         `EF2016A.Grand total` = ifelse(`EF2016A.Grand total` == 0, grand_total_avg, `EF2016A.Grand total`),
         `EF2017A.Grand total` = ifelse(`EF2017A.Grand total` == 0, grand_total_avg, `EF2017A.Grand total`)) %>%
  select(-grand_total_avg)

# Create a dummy variable marking schools missing grand total women
bacc_master <- bacc_master %>%
  mutate(missing_grand_total_women_2009 = ifelse(is.na(`EF2009A.Grand total women`), 1, 0),
         missing_grand_total_women_2010 = ifelse(is.na(`EF2010A.Grand total women`), 1, 0),
         missing_grand_total_women_2011 = ifelse(is.na(`EF2011A.Grand total women`), 1, 0),
         missing_grand_total_women_2015 = ifelse(is.na(`EF2015A.Grand total women`), 1, 0),
         missing_grand_total_women_2016 = ifelse(is.na(`EF2016A.Grand total women`), 1, 0),
         missing_grand_total_women_2017 = ifelse(is.na(`EF2017A.Grand total women`), 1, 0))

# Replace NA with 0
bacc_master <- bacc_master %>%
  mutate(`EF2009A.Grand total women` = ifelse(is.na(`EF2009A.Grand total women`), 0, `EF2009A.Grand total women`),
         `EF2010A.Grand total women` = ifelse(is.na(`EF2010A.Grand total women`), 0, `EF2010A.Grand total women`),
         `EF2011A.Grand total women` = ifelse(is.na(`EF2011A.Grand total women`), 0, `EF2011A.Grand total women`),
         `EF2015A.Grand total women` = ifelse(is.na(`EF2015A.Grand total women`), 0, `EF2015A.Grand total women`),
         `EF2016A.Grand total women` = ifelse(is.na(`EF2016A.Grand total women`), 0, `EF2016A.Grand total women`),
         `EF2017A.Grand total women` = ifelse(is.na(`EF2017A.Grand total women`), 0, `EF2017A.Grand total women`))

# Calculate grand_total_women_avg
bacc_master <- bacc_master %>%
  mutate(grand_total_women_avg = (`EF2009A.Grand total women` +
           `EF2010A.Grand total women` +
           `EF2011A.Grand total women` +
           `EF2015A.Grand total women` +
           `EF2016A.Grand total women` +
           `EF2017A.Grand total women`)/ (6 - missing_grand_total_women_2009 -
           missing_grand_total_women_2010 -
           missing_grand_total_women_2011 -
           missing_grand_total_women_2015 -
           missing_grand_total_women_2016 -
           missing_grand_total_women_2017)) %>%
  mutate(grand_total_women_avg = ifelse(is.na(grand_total_women_avg), 0, grand_total_women_avg))

# Replace 0 with grand_total_women_avg
bacc_master <- bacc_master %>%
  mutate(`EF2009A.Grand total women` = ifelse(`EF2009A.Grand total women` == 0, grand_total_women_avg, `EF2009A.Grand total women`),
         `EF2010A.Grand total women` = ifelse(`EF2010A.Grand total women` == 0, grand_total_women_avg, `EF2010A.Grand total women`),
         `EF2011A.Grand total women` = ifelse(`EF2011A.Grand total women` == 0, grand_total_women_avg, `EF2011A.Grand total women`),
         `EF2015A.Grand total women` = ifelse(`EF2015A.Grand total women` == 0, grand_total_women_avg, `EF2015A.Grand total women`),
         `EF2016A.Grand total women` = ifelse(`EF2016A.Grand total women` == 0, grand_total_women_avg, `EF2016A.Grand total women`),
         `EF2017A.Grand total women` = ifelse(`EF2017A.Grand total women` == 0, grand_total_women_avg, `EF2017A.Grand total women`)) %>%
  select(-grand_total_women_avg)

# Create a dummy variable marking schools missing Asian total
bacc_master <- bacc_master %>%
  mutate(missing_asian_2009 = ifelse(is.na(`EF2009A.Asian total - new`), 1, 0),
         missing_asian_2010 = ifelse(is.na(`EF2010A.Asian total`), 1, 0),
         missing_asian_2011 = ifelse(is.na(`EF2011A.Asian total`), 1, 0),
         missing_asian_2015 = ifelse(is.na(`EF2015A.Asian total`), 1, 0),
         missing_asian_2016 = ifelse(is.na(`EF2016A.Asian total`), 1, 0),
         missing_asian_2017 = ifelse(is.na(`EF2017A.Asian total`), 1, 0))

# Replace NA with 0
bacc_master <- bacc_master %>%
  mutate(`EF2009A.Asian total - new` = ifelse(is.na(`EF2009A.Asian total - new`), 0, `EF2009A.Asian total - new`),
         `EF2010A.Asian total` = ifelse(is.na(`EF2010A.Asian total`), 0, `EF2010A.Asian total`),
         `EF2011A.Asian total` = ifelse(is.na(`EF2011A.Asian total`), 0, `EF2011A.Asian total`),
         `EF2015A.Asian total` = ifelse(is.na(`EF2015A.Asian total`), 0, `EF2015A.Asian total`),
         `EF2016A.Asian total` = ifelse(is.na(`EF2016A.Asian total`), 0, `EF2016A.Asian total`),
         `EF2017A.Asian total` = ifelse(is.na(`EF2017A.Asian total`), 0, `EF2017A.Asian total`))

# Calculate asian_avg
bacc_master <- bacc_master %>%
  mutate(asian_avg = (`EF2009A.Asian total - new` +
           `EF2010A.Asian total` +
           `EF2011A.Asian total` +
           `EF2015A.Asian total` +
           `EF2016A.Asian total` +
           `EF2017A.Asian total`)/ (6 - missing_asian_2009 -
           missing_asian_2010 -
           missing_asian_2011 -
           missing_asian_2015 -
           missing_asian_2016 -
           missing_asian_2017)) %>%
  mutate(asian_avg = ifelse(is.na(asian_avg), 0, asian_avg))

# Replace 0 with asian_avg
bacc_master <- bacc_master %>%
  mutate(`EF2009A.Asian total - new` = ifelse(`EF2009A.Asian total - new` == 0, asian_avg, `EF2009A.Asian total - new`),
         `EF2010A.Asian total` = ifelse(`EF2010A.Asian total` == 0, asian_avg, `EF2010A.Asian total`),
         `EF2011A.Asian total` = ifelse(`EF2011A.Asian total` == 0, asian_avg, `EF2011A.Asian total`),
         `EF2015A.Asian total` = ifelse(`EF2015A.Asian total` == 0, asian_avg, `EF2015A.Asian total`),
         `EF2016A.Asian total` = ifelse(`EF2016A.Asian total` == 0, asian_avg, `EF2016A.Asian total`),
         `EF2017A.Asian total` = ifelse(`EF2017A.Asian total` == 0, asian_avg, `EF2017A.Asian total`)) %>%
  select(-asian_avg)

# Create a dummy variable marking schools missing black or African American
bacc_master <- bacc_master %>%
  mutate(missing_black_2009 = ifelse(is.na(`EF2009A.Black or African American total - new`), 1, 0),
         missing_black_2010 = ifelse(is.na(`EF2010A.Black or African American total`), 1, 0),
         missing_black_2011 = ifelse(is.na(`EF2011A.Black or African American total`), 1, 0),
         missing_black_2015 = ifelse(is.na(`EF2015A.Black or African American total`), 1, 0),
         missing_black_2016 = ifelse(is.na(`EF2016A.Black or African American total`), 1, 0),
         missing_black_2017 = ifelse(is.na(`EF2017A.Black or African American total`), 1, 0))

# Replace NA with 0
bacc_master <- bacc_master %>%
  mutate(`EF2009A.Black or African American total - new` = ifelse(is.na(`EF2009A.Black or African American total - new`), 0, `EF2009A.Black or African American total - new`),
         `EF2010A.Black or African American total` = ifelse(is.na(`EF2010A.Black or African American total`), 0, `EF2010A.Black or African American total`),
         `EF2011A.Black or African American total` = ifelse(is.na(`EF2011A.Black or African American total`), 0, `EF2011A.Black or African American total`),
         `EF2015A.Black or African American total` = ifelse(is.na(`EF2015A.Black or African American total`), 0, `EF2015A.Black or African American total`),
         `EF2016A.Black or African American total` = ifelse(is.na(`EF2016A.Black or African American total`), 0, `EF2016A.Black or African American total`),
         `EF2017A.Black or African American total` = ifelse(is.na(`EF2017A.Black or African American total`), 0, `EF2017A.Black or African American total`))

# Calculate black_avg
bacc_master <- bacc_master %>%
  mutate(black_avg = (`EF2009A.Black or African American total - new` +
           `EF2010A.Black or African American total` +
           `EF2011A.Black or African American total` +
           `EF2015A.Black or African American total` +
           `EF2016A.Black or African American total` +
           `EF2017A.Black or African American total`)/(6 - missing_black_2009 -
           missing_black_2010 -
           missing_black_2011 -
           missing_black_2015 -
           missing_black_2016 -
           missing_black_2017)) %>%
  mutate(black_avg = ifelse(is.na(black_avg), 0, black_avg))

# Replace 0 with black_avg
bacc_master <- bacc_master %>%
  mutate(`EF2009A.Black or African American total - new` = ifelse(`EF2009A.Black or African American total - new` == 0, black_avg, `EF2009A.Black or African American total - new`),
         `EF2010A.Black or African American total` = ifelse(`EF2010A.Black or African American total` == 0, black_avg, `EF2010A.Black or African American total`),
         `EF2011A.Black or African American total` = ifelse(`EF2011A.Black or African American total` == 0, black_avg, `EF2011A.Black or African American total`),
         `EF2015A.Black or African American total` = ifelse(`EF2015A.Black or African American total` == 0, black_avg, `EF2015A.Black or African American total`),
         `EF2016A.Black or African American total` = ifelse(`EF2016A.Black or African American total` == 0, black_avg, `EF2016A.Black or African American total`),
         `EF2017A.Black or African American total` = ifelse(`EF2017A.Black or African American total` == 0, black_avg, `EF2017A.Black or African American total`)) %>%
  select(-black_avg)

# Create a dummy variable marking schools missing hispanic total
bacc_master <- bacc_master %>%
  mutate(missing_hispanic_2009 = ifelse(is.na(`EF2009A.Hispanic total - new`), 1, 0),
         missing_hispanic_2010 = ifelse(is.na(`EF2010A.Hispanic total`), 1, 0),
         missing_hispanic_2011 = ifelse(is.na(`EF2011A.Hispanic total`), 1, 0),
         missing_hispanic_2015 = ifelse(is.na(`EF2015A.Hispanic total`), 1, 0),
         missing_hispanic_2016 = ifelse(is.na(`EF2016A.Hispanic total`), 1, 0),
         missing_hispanic_2017 = ifelse(is.na(`EF2017A.Hispanic total`), 1, 0))

# Replace NA with 0
bacc_master <- bacc_master %>%
  mutate(`EF2009A.Hispanic total - new` = ifelse(is.na(`EF2009A.Hispanic total - new`), 0, `EF2009A.Hispanic total - new`),
         `EF2010A.Hispanic total` = ifelse(is.na(`EF2010A.Hispanic total`), 0, `EF2010A.Hispanic total`),
         `EF2011A.Hispanic total` = ifelse(is.na(`EF2011A.Hispanic total`), 0, `EF2011A.Hispanic total`),
         `EF2015A.Hispanic total` = ifelse(is.na(`EF2015A.Hispanic total`), 0, `EF2015A.Hispanic total`),
         `EF2016A.Hispanic total` = ifelse(is.na(`EF2016A.Hispanic total`), 0, `EF2016A.Hispanic total`),
         `EF2017A.Hispanic total` = ifelse(is.na(`EF2017A.Hispanic total`), 0, `EF2017A.Hispanic total`))

# Calculate hispanic_avg
bacc_master <- bacc_master %>%
  mutate(hispanic_avg = (`EF2009A.Hispanic total - new` +
           `EF2010A.Hispanic total` +
           `EF2011A.Hispanic total` +
           `EF2015A.Hispanic total` +
           `EF2016A.Hispanic total` +
           `EF2017A.Hispanic total`)/(6 - missing_hispanic_2009 -
           missing_hispanic_2010 -
           missing_hispanic_2011 -
           missing_hispanic_2015 -
           missing_hispanic_2016 -
           missing_hispanic_2017)) %>%
  mutate(hispanic_avg  = ifelse(is.na(hispanic_avg), 0, hispanic_avg))

# Replace 0 with hispanic_avg
bacc_master <- bacc_master %>%
  mutate(`EF2009A.Hispanic total - new` = ifelse(`EF2009A.Hispanic total - new` == 0, hispanic_avg, `EF2009A.Hispanic total - new`),
         `EF2010A.Hispanic total` = ifelse(`EF2010A.Hispanic total` == 0, hispanic_avg, `EF2010A.Hispanic total`),
         `EF2011A.Hispanic total` = ifelse(`EF2011A.Hispanic total` == 0, hispanic_avg, `EF2011A.Hispanic total`),
         `EF2015A.Hispanic total` = ifelse(`EF2015A.Hispanic total` == 0, hispanic_avg, `EF2015A.Hispanic total`),
         `EF2016A.Hispanic total` = ifelse(`EF2016A.Hispanic total` == 0, hispanic_avg, `EF2016A.Hispanic total`),
         `EF2017A.Hispanic total` = ifelse(`EF2017A.Hispanic total` == 0, hispanic_avg, `EF2017A.Hispanic total`)) %>%
  select(-hispanic_avg)


# Export bacc_master dataset
write_csv(bacc_master, here("data/bacc_master.csv"))
