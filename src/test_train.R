# This R script is created to split the dataset into traning and testing dataset

library(tidyverse)
library(here)

# Load dataset
bacc_master <- read_csv(here("data/bacc_master.csv"))

# Hold out schools
train <- bacc_master %>%
  filter(`institution name` != "Agnes Scott College" &
           `institution name` != "Albion College" &
           `institution name` != "Allegheny College" &
           `institution name` != "Alma College" &
           `institution name` != "Belmont University" &
           `institution name` != "Beloit College" &
           `institution name` != "Benedictine College" &
           `institution name` != "Berea College" &
           `institution name` != "Bryn Mawr College" &
           `institution name` != "Bucknell University" &
           `institution name` != "Carleton College" &
           `institution name` != "Centre College" &
           `institution name` != "Colby College" &
           `institution name` != "Colorado College" &
           `institution name` != "Connecticut College" &
           `institution name` != "Dension University" &
           `institution name` != "Dickinson College" &
           `institution name` != "Drew University" &
           `institution name` != "Earlham College" &
           `institution name` != "Emerson College" &
           `institution name` != "Furman" &
           `institution name` != "Gettysburg College" &
           `institution name` != "Goshen College" &
           `institution name` != "Grinnell College" &
           `institution name` != "Guilford College" &
           `institution name` != "Gustavus Adolphus College" &
           `institution name` != "Hamilton College" &
           `institution name` != "Harvey Mudd College" &
           `institution name` != "Haverford College" &
           `institution name` != "Hiram College" &
           `institution name` != "Hobart William Smith Colleges" &
           `institution name` != "Illinois College" &
           `institution name` != "Illinois Wesleyan University" &
           `institution name` != "Juniata College" &
           `institution name` != "Kalamazoo College" &
           `institution name` != "Knox College" &
           `institution name` != "Lake Forest College" &
           `institution name` != "Lawrence University" &
           `institution name` != "Lebanon Valley College" &
           `institution name` != "Linfield College-McMinnville Campus" &
           `institution name` != "Luther College" &
           `institution name` != "Macalester College" &
           `institution name` != "Mills College" &
           `institution name` != "Millsaps College" &
           `institution name` != "Muhlenberg College" &
           `institution name` != "Occidental College" &
           `institution name` != "Oxford College of Emory University" &
           `institution name` != "Principia College" &
           `institution name` != "Reed College" &
           `institution name` != "Saint Marys College" &
           `institution name` != "Saint Vincent College" &
           `institution name` != "Scripps College" &
           `institution name` != "Sewanee-The University of the South" &
           `institution name` != "Smith College" &
           `institution name` != "Southwestern University" &
           `institution name` != "St Lawrence University" &
           `institution name` != "Susquehanna University" &
           `institution name` != "Transylvania University" &
           `institution name` != "Trinity University" &
           `institution name` != "Union College" &
           `institution name` != "University of Portland" &
           `institution name` != "University of Puget Sound" &
           `institution name` != "University of Scranton" &
           `institution name` != "Vassar College" &
           `institution name` != "Wabash College" &
           `institution name` != "Washington and Lee University" &
           `institution name` != "Whitman College" &
           `institution name` != "Willamette University" &
           `institution name` != "Wittenberg University" &
           `institution name` != "Wofford College") %>%
  sample_frac(0.8)

# Test dataset
test <- anti_join(bacc_master, train)

# Export csv
write_csv(train, here("data/train.csv"))
write_csv(test, here("data/test.csv"))
