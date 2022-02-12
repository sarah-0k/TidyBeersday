# Get the Data

# Read in with tidytuesdayR package 

#install.packages("tidytuesdayR")
library(tidyverse)
library(skimr)

tuesdata <- tidytuesdayR::tt_load(2022, week = 2)

colony <- tuesdata$colony
stressor <- tuesdata$stressor

stressor.w <- stressor %>%
  pivot_wider(id=c(year, months, state),
              names_from=stressor,
              values_from=stress_pct)

all.w <- merge(colony, stressor.w, 
               by=c("year", "months", "state"))

skim(all.w)
