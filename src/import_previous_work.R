# This R script is created to load the data set Shulav worked on 

library(here)
library(tidyverse)

shulav_data <- read_csv(here("previous_work/Data_5-9-2019---594.csv"))

converted_sat <- read_csv(here("previous_work/convertedscore.csv"))
