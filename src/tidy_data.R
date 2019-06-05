# This R script is created to tidy the shulav dataset for use in regression

library(tidyverse)
library(here)
source(here("src/import_previous_work.R"))

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
