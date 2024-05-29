#Christian Miller
#ECON 4223
#Dr. Liu
#12 September 2023

library(tidyverse)
library(broom)
library(wooldridge)
library(modelsummary)

install.packages("magrittr", repos='http://cran.us.r-project.org')

library(magrittr)

df <- as_tibble(affairs)

datasummary_skim(df,histogram=FALSE)

#Convert our 0/1 numeric variable "male" to a factor with levels "yes" and "no":
df <- df %<>% mutate(male = factor(male), male = fct_recode(male, yes = "1", no = "0"))

#Convert other variables
df %<>% mutate(ratemarr = factor(ratemarr),
               ratemarr = fct_recode(ratemarr, very_happy = "5", happy = "4", average = "3",
                                     unhappy = "2", very_unhappy = "1")) %>%
  mutate(relig = factor(relig),
         relig = fct_recode(relig, very_relig = "5", relig = "4", average = "3",
                            not_relig = "2", not_at_all_relig = "1")) %>%
  mutate(kids = factor(kids), kids = fct_recode(kids, yes = "1", no = "0")) %>%
  mutate(affair = factor(affair), affair = fct_recode(affair, yes = "1", no = "0"))

datasummary_skim(df, histogram = FALSE)

