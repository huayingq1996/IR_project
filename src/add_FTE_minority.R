# This R script is created to add FTE students and American Indian and Pacific islanders and tidy the joined 
# dataset.

library(tidyverse)
library(here)

# Load dataset
bacc_master <- read_csv(here("data/bacc_master.csv"))

# Load IPEDS data
FTE_2009 <- read_csv(here("data/FTE_2009.csv"))
FTE_2010 <- read_csv(here("data/FTE_2010.csv"))
FTE_2011 <- read_csv(here("data/FTE_2011.csv"))
FTE_2015 <- read_csv(here("data/FTE_2015.csv"))
FTE_2016 <- read_csv(here("data/FTE_2016.csv"))
FTE_2017 <- read_csv(here("data/FTE_2017.csv"))
Race_2009 <- read_csv(here("data/Race_2009.csv"))
Race_2010 <- read_csv(here("data/Race_2010.csv"))
Race_2011 <- read_csv(here("data/Race_2011.csv"))
Race_2015 <- read_csv(here("data/Race_2015.csv"))
Race_2016 <- read_csv(here("data/Race_2016.csv"))
Race_2017 <- read_csv(here("data/Race_2017.csv"))

# Drop variable years and level of student
FTE_2009 <- FTE_2009 %>%
  select(-year)
FTE_2010 <- FTE_2010 %>%
  select(-year)
FTE_2011 <- FTE_2011 %>%
  select(-year)
FTE_2015 <- FTE_2015 %>%
  select(-year)
FTE_2016 <- FTE_2016 %>%
  select(-year)
FTE_2017 <- FTE_2017 %>%
  select(-year)
Race_2009 <- Race_2009 %>%
  select(-year,
         -`EF2009A.Level of student`,
         -IDX_EF)
Race_2010 <- Race_2010 %>%
  select(-year,
         -`EF2010A.Level of student`,
         -IDX_EF)
Race_2011 <- Race_2011 %>%
  select(-year,
         -`EF2011A.Level of student`,
         -IDX_EF)
Race_2015 <- Race_2015 %>%
  select(-year,
         -`EF2015A.Level of student`,
         -IDX_EF)
Race_2016 <- Race_2016 %>%
  select(-year,
         -`EF2016A.Level of student`,
         -IDX_EF)
Race_2017 <- Race_2017 %>%
  select(-year,
         -`EF2017A.Level of student`,
         -IDX_EF)

# Join the dataset and IPEDS data
bacc_master <- bacc_master %>%
  left_join(FTE_2009) %>%
  left_join(FTE_2010) %>%
  left_join(FTE_2011) %>%
  left_join(FTE_2015) %>%
  left_join(FTE_2016) %>%
  left_join(FTE_2017) %>%
  left_join(Race_2009) %>%
  left_join(Race_2010) %>%
  left_join(Race_2011) %>%
  left_join(Race_2015) %>%
  left_join(Race_2016) %>%
  left_join(Race_2017)

# Calculate FTE student
bacc_master <- bacc_master %>%
  mutate(FTE_2009 = `DRVEF2009.Full-time enrollment` + 1/3 * `DRVEF2009.Part-time enrollment`,
         FTE_2010 = `DRVEF2010.Full-time enrollment` + 1/3 * `DRVEF2010.Part-time enrollment`,
         FTE_2011 = `DRVEF2011.Full-time enrollment` + 1/3 * `DRVEF2011.Part-time enrollment`,
         FTE_2015 = `DRVEF2015.Full-time enrollment` + 1/3 * `DRVEF2015.Part-time enrollment`,
         FTE_2016 = `DRVEF2016.Full-time enrollment` + 1/3 * `DRVEF2016.Part-time enrollment`,
         FTE_2017 = `DRVEF2017.Full-time enrollment` + 1/3 * `DRVEF2017.Part-time enrollment`) %>%
  select(-`DRVEF2009.Full-time enrollment`,
         -`DRVEF2009.Part-time enrollment`,
         -`DRVEF2010.Full-time enrollment`,
         -`DRVEF2010.Part-time enrollment`,
         -`DRVEF2011.Full-time enrollment`,
         -`DRVEF2011.Part-time enrollment`,
         -`DRVEF2015.Full-time enrollment`,
         -`DRVEF2015.Part-time enrollment`,
         -`DRVEF2016.Full-time enrollment`,
         -`DRVEF2016.Part-time enrollment`,
         -`DRVEF2017.Full-time enrollment`,
         -`DRVEF2017.Part-time enrollment`)

# Create a dummy variable called missing_FTE
bacc_master <- bacc_master %>%
  mutate(missing_FTE_2009 = ifelse(is.na(FTE_2009), 1, 0),
         missing_FTE_2010 = ifelse(is.na(FTE_2010), 1, 0),
         missing_FTE_2011 = ifelse(is.na(FTE_2011), 1, 0),
         missing_FTE_2015 = ifelse(is.na(FTE_2015), 1, 0),
         missing_FTE_2016 = ifelse(is.na(FTE_2016), 1, 0),
         missing_FTE_2017 = ifelse(is.na(FTE_2017), 1, 0))

# Replace NA with 0
bacc_master <- bacc_master %>%
  mutate(FTE_2009 = ifelse(is.na(FTE_2009), 0, FTE_2009),
         FTE_2010 = ifelse(is.na(FTE_2010), 0, FTE_2010),
         FTE_2011 = ifelse(is.na(FTE_2011), 0, FTE_2011),
         FTE_2015 = ifelse(is.na(FTE_2015), 0, FTE_2015),
         FTE_2016 = ifelse(is.na(FTE_2016), 0, FTE_2016),
         FTE_2017 = ifelse(is.na(FTE_2017), 0, FTE_2017))

# Calculate FTE_avg
bacc_master <- bacc_master %>%
  mutate(FTE_avg = (FTE_2009 +
           FTE_2010 +
           FTE_2011 +
           FTE_2015 +
           FTE_2016 +
           FTE_2017)/ (6 - missing_FTE_2009 -
           missing_FTE_2010 -
           missing_FTE_2011 -
           missing_FTE_2015 -
           missing_FTE_2016 -
           missing_FTE_2017)) %>%
  mutate(FTE_avg = ifelse(is.na(FTE_avg), 0, FTE_avg))

# Replace 0 with FTE_avg
bacc_master <- bacc_master %>%
  mutate(FTE_2009 = ifelse(FTE_2009 == 0, FTE_avg, FTE_2009),
         FTE_2010 = ifelse(FTE_2010 == 0, FTE_avg, FTE_2010),
         FTE_2011 = ifelse(FTE_2011 == 0, FTE_avg, FTE_2011),
         FTE_2015 = ifelse(FTE_2015 == 0, FTE_avg, FTE_2015),
         FTE_2016 = ifelse(FTE_2016 == 0, FTE_avg, FTE_2016),
         FTE_2017 = ifelse(FTE_2017 == 0, FTE_avg, FTE_2017)) %>%
  select(-FTE_avg)

# Create a dummy variable called missing_Indian_Alaska
bacc_master <- bacc_master %>%
  mutate(missing_Indian_Alaska_2009 = ifelse(is.na(`EF2009A.American Indian or Alaska Native total - new`), 1, 0),
         missing_Indian_Alaska_2010 = ifelse(is.na(`EF2010A.American Indian or Alaska Native total`), 1, 0),
         missing_Indian_Alaska_2011 = ifelse(is.na(`EF2011A.American Indian or Alaska Native total`), 1, 0),
         missing_Indian_Alaska_2015 = ifelse(is.na(`EF2015A.American Indian or Alaska Native total`), 1, 0),
         missing_Indian_Alaska_2016 = ifelse(is.na(`EF2016A.American Indian or Alaska Native total`), 1, 0),
         missing_Indian_Alaska_2017 = ifelse(is.na(`EF2017A.American Indian or Alaska Native total`), 1, 0))

# Replace NA with 0
bacc_master <- bacc_master %>%
  mutate(`EF2009A.American Indian or Alaska Native total - new` = ifelse(is.na(`EF2009A.American Indian or Alaska Native total - new`), 0, `EF2009A.American Indian or Alaska Native total - new`),
         `EF2010A.American Indian or Alaska Native total` = ifelse(is.na(`EF2010A.American Indian or Alaska Native total`), 0, `EF2010A.American Indian or Alaska Native total`),
         `EF2011A.American Indian or Alaska Native total` = ifelse(is.na(`EF2011A.American Indian or Alaska Native total`), 0, `EF2011A.American Indian or Alaska Native total`),
         `EF2015A.American Indian or Alaska Native total` = ifelse(is.na(`EF2015A.American Indian or Alaska Native total`), 0, `EF2015A.American Indian or Alaska Native total`),
         `EF2016A.American Indian or Alaska Native total` = ifelse(is.na(`EF2016A.American Indian or Alaska Native total`), 0, `EF2016A.American Indian or Alaska Native total`),
         `EF2017A.American Indian or Alaska Native total` = ifelse(is.na(`EF2017A.American Indian or Alaska Native total`), 0, `EF2017A.American Indian or Alaska Native total`))

# Calculate Indian_Alaska_avg
bacc_master <- bacc_master %>%
  mutate(Indian_Alaska_avg = (`EF2009A.American Indian or Alaska Native total - new` +
           `EF2010A.American Indian or Alaska Native total` +
           `EF2011A.American Indian or Alaska Native total` +
           `EF2015A.American Indian or Alaska Native total` +
           `EF2016A.American Indian or Alaska Native total` +
           `EF2017A.American Indian or Alaska Native total`)/ (6 - missing_Indian_Alaska_2009 -
           missing_Indian_Alaska_2010 -
           missing_Indian_Alaska_2011 -
           missing_Indian_Alaska_2015 -
           missing_Indian_Alaska_2016 -
           missing_Indian_Alaska_2017)) %>%
  mutate(Indian_Alaska_avg = ifelse(is.na(Indian_Alaska_avg), 0, Indian_Alaska_avg))

# Replace 0 with Indian_Alaska_avg
bacc_master <- bacc_master %>%
  mutate(`EF2009A.American Indian or Alaska Native total - new` = ifelse(`EF2009A.American Indian or Alaska Native total - new` == 0, Indian_Alaska_avg, `EF2009A.American Indian or Alaska Native total - new`),
         `EF2010A.American Indian or Alaska Native total` = ifelse(`EF2010A.American Indian or Alaska Native total` == 0, Indian_Alaska_avg, `EF2010A.American Indian or Alaska Native total`),
         `EF2011A.American Indian or Alaska Native total` = ifelse(`EF2011A.American Indian or Alaska Native total` == 0, Indian_Alaska_avg, `EF2011A.American Indian or Alaska Native total`),
         `EF2015A.American Indian or Alaska Native total` = ifelse(`EF2015A.American Indian or Alaska Native total` == 0, Indian_Alaska_avg, `EF2015A.American Indian or Alaska Native total`),
         `EF2016A.American Indian or Alaska Native total` = ifelse(`EF2016A.American Indian or Alaska Native total` == 0, Indian_Alaska_avg, `EF2016A.American Indian or Alaska Native total`),
         `EF2017A.American Indian or Alaska Native total` = ifelse(`EF2017A.American Indian or Alaska Native total` == 0, Indian_Alaska_avg, `EF2017A.American Indian or Alaska Native total`)) %>%
  select(-Indian_Alaska_avg)

# Create a dummy variable called missing_islander
bacc_master <- bacc_master %>%
  mutate(missing_islander_2009 = ifelse(is.na(`EF2009A.Native Hawaiian or Other Pacific Islander total - new`), 1, 0),
         missing_islander_2010 = ifelse(is.na(`EF2010A.Native Hawaiian or Other Pacific Islander total`), 1, 0),
         missing_islander_2011 = ifelse(is.na(`EF2011A.Native Hawaiian or Other Pacific Islander total`), 1, 0),
         missing_islander_2015 = ifelse(is.na(`EF2015A.Native Hawaiian or Other Pacific Islander total`), 1, 0),
         missing_islander_2016 = ifelse(is.na(`EF2016A.Native Hawaiian or Other Pacific Islander total`), 1, 0),
         missing_islander_2017 = ifelse(is.na(`EF2017A.Native Hawaiian or Other Pacific Islander total`), 1, 0))

# Replace NA with 0
bacc_master <- bacc_master %>%
  mutate(`EF2009A.Native Hawaiian or Other Pacific Islander total - new` = ifelse(is.na(`EF2009A.Native Hawaiian or Other Pacific Islander total - new`), 0, `EF2009A.Native Hawaiian or Other Pacific Islander total - new`),
         `EF2010A.Native Hawaiian or Other Pacific Islander total` = ifelse(is.na(`EF2010A.Native Hawaiian or Other Pacific Islander total`), 0, `EF2010A.Native Hawaiian or Other Pacific Islander total`),
         `EF2011A.Native Hawaiian or Other Pacific Islander total` = ifelse(is.na(`EF2011A.Native Hawaiian or Other Pacific Islander total`), 0, `EF2011A.Native Hawaiian or Other Pacific Islander total`),
         `EF2015A.Native Hawaiian or Other Pacific Islander total` = ifelse(is.na(`EF2015A.Native Hawaiian or Other Pacific Islander total`), 0, `EF2015A.Native Hawaiian or Other Pacific Islander total`),
         `EF2016A.Native Hawaiian or Other Pacific Islander total` = ifelse(is.na(`EF2016A.Native Hawaiian or Other Pacific Islander total`), 0, `EF2016A.Native Hawaiian or Other Pacific Islander total`),
         `EF2017A.Native Hawaiian or Other Pacific Islander total` = ifelse(is.na(`EF2017A.Native Hawaiian or Other Pacific Islander total`), 0, `EF2017A.Native Hawaiian or Other Pacific Islander total`))

# Calculate islander_avg
bacc_master <- bacc_master %>%
  mutate(islander_avg = (`EF2009A.Native Hawaiian or Other Pacific Islander total - new` +
           `EF2010A.Native Hawaiian or Other Pacific Islander total` +
           `EF2011A.Native Hawaiian or Other Pacific Islander total` +
           `EF2015A.Native Hawaiian or Other Pacific Islander total` +
           `EF2016A.Native Hawaiian or Other Pacific Islander total` +
           `EF2017A.Native Hawaiian or Other Pacific Islander total`)/ (6 - missing_islander_2009 -
           missing_islander_2010 -
           missing_islander_2011 -
           missing_islander_2015 -
           missing_islander_2016 -
           missing_islander_2017)) %>%
  mutate(islander_avg = ifelse(is.na(islander_avg), 0, islander_avg))

# Replace 0 with islander_avg
bacc_master <- bacc_master %>%
  mutate(`EF2009A.Native Hawaiian or Other Pacific Islander total - new` = ifelse(`EF2009A.Native Hawaiian or Other Pacific Islander total - new` == 0, islander_avg, `EF2009A.Native Hawaiian or Other Pacific Islander total - new`),
         `EF2010A.Native Hawaiian or Other Pacific Islander total` = ifelse(`EF2010A.Native Hawaiian or Other Pacific Islander total` == 0, islander_avg, `EF2010A.Native Hawaiian or Other Pacific Islander total`),
         `EF2011A.Native Hawaiian or Other Pacific Islander total` = ifelse(`EF2011A.Native Hawaiian or Other Pacific Islander total` == 0, islander_avg, `EF2011A.Native Hawaiian or Other Pacific Islander total`),
         `EF2015A.Native Hawaiian or Other Pacific Islander total` = ifelse(`EF2015A.Native Hawaiian or Other Pacific Islander total` == 0, islander_avg, `EF2015A.Native Hawaiian or Other Pacific Islander total`),
         `EF2016A.Native Hawaiian or Other Pacific Islander total` = ifelse(`EF2016A.Native Hawaiian or Other Pacific Islander total` == 0, islander_avg, `EF2016A.Native Hawaiian or Other Pacific Islander total`),
         `EF2017A.Native Hawaiian or Other Pacific Islander total` = ifelse(`EF2017A.Native Hawaiian or Other Pacific Islander total` == 0, islander_avg, `EF2017A.Native Hawaiian or Other Pacific Islander total`)) %>%
  select(-islander_avg)


# Calculate endowment per FTE
bacc_master <- bacc_master %>%
  mutate(`Endowment per FTE 2009` = `F0809_F2.Value of endowment assets at the end of the fiscal year`/FTE_2009,
         `Endowment per FTE 2010` = `F0910_F2.Value of endowment assets at the end of the fiscal year`/FTE_2010,
         `Endowment per FTE 2011` = `F1011_F2.Value of endowment assets at the end of the fiscal year`/FTE_2011,
         `Endowment per FTE 2015` = `F1415_F2.Value of endowment assets at the end of the fiscal year`/FTE_2015,
         `Endowment per FTE 2016` = `F1516_F2.Value of endowment assets at the end of the fiscal year`/FTE_2016,
         `Endowment per FTE 2017` = `F1617_F2.Value of endowment assets at the end of the fiscal year`/FTE_2017)

# Export bacc_master dataset
write_csv(bacc_master, here("data/bacc_master.csv"))