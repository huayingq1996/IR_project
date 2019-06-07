# This R script is created to import data of Baccalaureate Colleges

# Install package if it is not already installed
if (!require(here))
  install.packages("here")

# Library
library(tidyverse)
library(here)

# Import data
IPEDS_2009_bacc <- read_csv(here("data/2009_bacc.csv"))
IPEDS_2009_bacc_FE <- read_csv(here("data/2009_bacc_FE.csv"))
IPEDS_2010_bacc <- read_csv(here("data/2010_bacc.csv"))
IPEDS_2010_bacc_FE <- read_csv(here("data/2011_bacc_FE.csv"))
IPEDS_2011_bacc <- read_csv(here("data/2011.csv"))
IPEDS_2011_bacc_FE <- read_csv(here("data/2011_bacc_FE.csv"))
IPEDS_2015_bacc <- read_csv(here("data/2015_bacc.csv"))
IPEDS_2015_bacc_FE <- read_csv(here("data/2015_bacc_FE.csv"))
IPEDS_2016_bacc <- read_csv(here("data/2016_bacc.csv"))
IPEDS_2016_bacc_FE <- read_csv(here("data/2016_bacc_FE.csv"))
IPEDS_2017_bacc <- read_csv(here("data/2017_bacc.csv"))
IPEDS_2017_FE <- read_csv(here("data/2017_bacc_FE.csv"))