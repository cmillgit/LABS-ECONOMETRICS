#Christian Miller
#ECON-4223
#Dr. Liu

library(tidyverse)
library(broom)
library(wooldridge)
library(car)
library(magrittr)
library(modelsummary)

df <- as_tibble(htv)
datasummary_df(df)
datasummary_skim(df, histogram = FALSE)

df %<>% mutate(region = case_when(ne==1 ~ "Northeast",
                                     nc==1 ~ "NorthCentral",
                                     west==1 ~ "West",
                                     south==1 ~ "South")) %>%
  mutate(region = factor(region))

df %<>% mutate(abilsq = abil^2)

est <- lm(educ ~ motheduc + fatheduc + abil + abilsq + region, data=df)
tidy(est)
modelsummary(est)

#1. Test the hypothesis that abil has a linear effect on educ.
#Ho: b_abilsq = 0
#Ha: b_abilsq =/= 0

#t-stat = 6.08 > critical value (1.96) so we reject the null
#p-value = 1.59e-9 < alpha (0.05), so we reject the null
#ConfInt [0.03426749 , 0.0669033], CI around abilsq doesn't include 0, so we reject the null


#F-test single parameter
#Ho: motheduc = fatheduc
#Ha: motheduc =/= fatheduc
linearHypothesis(est, "motheduc = fatheduc")

#p-value = 0.0524
#p-value > alpha(0.05), so we fail to reject the null

#F-test multiple parameters
#Ho: all region dummies = 0
#Ha: any region dummy =/= 0
linearHypothesis(est, c("regionNortheast=0", "regionSouth=0", "regionWest=0"))
#p-value (0.4987) > alpha (.05), so we fail to reject the null