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

# Drop X114 in Shulav data set
shulav_data <- shulav_data %>%
  select(-X114)

# Drop uncessary years

recent_df <- shulav_data %>%
  select(UnitID,
         `Institution Name`,
         `Religious affiliation (IC2017)`,
         `Religious affiliation (IC2016)`,
         `Religious affiliation (IC2015)`,
         `Total expenses (F1617_F2)`,
         `Total expenses (F1516_F2)`,
         `Total expenses (F1415_F2)`,
         `Value of endowment assets at the end of the fiscal year (F1617_F2)`,
         `Value of endowment assets at the end of the fiscal year (F1516_F2)`,
         `Value of endowment assets at the end of the fiscal year (F1415_F2)`,
         `Instruction-Total amount (F1617_F2)`,
         `Instruction-Total amount (F1516_F2)`,
         `Instruction-Total amount (F1415_F2)`,
         `Percent admitted - total (DRVADM2017)`,
         `Percent admitted - total (DRVADM2016)`,
         `Percent admitted - total (DRVADM2015)`,
         `Admissions yield - total (DRVADM2017)`,
         `Admissions yield - total (DRVADM2016)`,
         `Admissions yield - total (DRVADM2015)`,
         `Graduation rate - Bachelor degree within 6 years  total (DRVGR2017)`,
         `Graduation rate - Bachelor degree within 6 years  total (DRVGR2016)`,
         `Graduation rate - Bachelor degree within 6 years  total (DRVGR2015)`,
         `Average salary equated to 9 months of full-time instructional staff - all ranks (DRVHR2017)`,
         `Average salary equated to 9 months of full-time instructional staff - all ranks (DRVHR2016)`,
         `Average salary equated to 9 months of full-time instructional staff - all ranks (DRVHR2015)`,
         `SAT Evidence-Based Reading and Writing 25th percentile score (ADM2017)`,
         `SAT Evidence-Based Reading and Writing 75th percentile score (ADM2017)`,
         `SAT Math 25th percentile score (ADM2017)`,
         `SAT Math 75th percentile score (ADM2017)`,
         `SAT Critical Reading 25th percentile score (ADM2016)`,
         `SAT Critical Reading 75th percentile score (ADM2016)`,
         `SAT Math 25th percentile score (ADM2016)`,
         `SAT Math 75th percentile score (ADM2016)`,
         `SAT Critical Reading 25th percentile score (ADM2015)`,
         `SAT Critical Reading 75th percentile score (ADM2015)`,
         `SAT Math 25th percentile score (ADM2015)`,
         `SAT Math 75th percentile score (ADM2015)`,
         `ACT Composite 25th percentile score (ADM2017)`,
         `ACT Composite 75th percentile score (ADM2017)`,
         `ACT Composite 25th percentile score (ADM2016)`,
         `ACT Composite 75th percentile score (ADM2016)`,
         `ACT Composite 25th percentile score (ADM2015)`,
         `ACT Composite 75th percentile score (ADM2015)`)
