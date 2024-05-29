#Christian Miller
#ECON-4223-001
#29 August 2023

library(tidyverse)
library(modelsummary)
library(broom)
library(wooldridge)

#load in data
df <- as_tibble(countymurders)

#summary statistics
glimpse(df)
datasummary_skim(df)

#regression syntax
est <- lm(y ~ x, data = data.name)

#first regression
est <- lm(murders ~ execs, data = df)

#view output
tidy(est)
glance(est)

#results
modelsummary(est)
