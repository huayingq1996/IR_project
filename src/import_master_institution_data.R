# This R script is created to import data for master institutions

# Install package if it is not already installed
if (!require(here))
  install.packages("here")

# Library
library(tidyverse)
library(here)

# Import IPEDS data for master institutions. The csv files named by the years contain every variable except
# fall enrollment. The csv files named by year_FE contain the fall enrollment data.
IPEDS_2009 <- read_csv(here("data/2009.csv"))
IPEDS_2009_FE <- read_csv(here("data/2009_FE.csv"))
IPEDS_2010 <- read_csv(here("data/2010.csv"))
IPEDS_2010_FE <- read_csv(here("data/2010_FE.csv"))
IPEDS_2011 <- read_csv(here("data/2011.csv"))
IPEDS_2011_FE <- read_csv(here("data/2011_FE.csv"))
IPEDS_2015 <- read_csv(here("data/2015.csv"))
IPEDS_2015_FE <- read_csv(here("data/2015_FE.csv"))
IPEDS_2016 <- read_csv(here("data/2016.csv"))
IPEDS_2016_FE <- read_csv(here("data/2016_FE.csv"))
IPEDS_2017 <- read_csv(here("data/2017.csv"))
IPEDS_2017_FE <- read_csv(here("data/2017_FE.csv"))
