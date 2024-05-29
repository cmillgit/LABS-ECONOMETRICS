#Christian Miller
#ECON4223


library(tidyverse)
library(wooldridge)
library(broom)
library(magrittr)
library(modelsummary)
library(estimatr)

#Load data
df <- as_tibble(injury)
df %<>% filter(ky==1)

#Summary Statistics
df %>% group_by(afchnge,highearn) %>% summarize(mean.ldurat = mean(ldurat))
#1. Difference in differences
#(1.58-1.13) - (1.38-1.13) = 0.2 => because y is in logs, interpret this as approx. a 20% increase in benefit duration.

#DiD regression
est.did <- lm_robust(ldurat ~ afchnge*highearn, data = df)
modelsummary(est.did)
#2. 0.191 is close to 0.2. Yes it is significant.
#The high earners, after the policy change, are taking work off at about a 19% longer duration.

#Include more x's
#• male
#• married
#• Quadratic in age
#• hosp (1 = hospitalized)
#• indust (1 = manuf, 2 = construc, 3 = other)
#• injtype (1-8; categories for different types of injury)
#• lprewage (log of wage prior to filing a claim)

df %<>% mutate(indust = as.factor(indust))
df %<>% mutate(injtype = as.factor(injtype))
est.did.x <- lm_robust(ldurat ~ afchnge*highearn + married +
                         male + age + I(age^2) + hosp +indust + injtype + lprewage, data = df)
modelsummary(list(est.did, est.did.x))

#3. even after including many covariates, we still see a positive and significant coefficient.
# about 16.7% increase in duration of benefits.

#4. Yes we see other variables with significant effects.