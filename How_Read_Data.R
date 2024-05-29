library(tidyverse)
library(broom)
library(wooldridge)
library(car)
library(magrittr)
library(modelsummary)

df <- as_tibble(kielmc)


datasummary_skim(df, histogram=FALSE)

est <- lm(log(price) ~ log(dist), data = df)
tidy(est)
