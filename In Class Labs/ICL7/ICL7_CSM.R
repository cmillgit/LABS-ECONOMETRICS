#Christian Miller
#EECON4223
#Dr. Liu
#19 September 2023


library(tidyverse)
library(broom)
library(wooldridge)
library(magrittr)
library(modelsummary)

df <- as_tibble(rdchem)
datasummary_skim(df,histogram=FALSE)

#estimate the regression model
est <- lm(rdintens ~ lsales + profmarg, data = df)

modelsummary(est)
tidy(est)
confint(est)
#When sales increase by 1%, rdintens is estimated to increase by .321%.
#If sales increase by 10%, rdintens is estimated to increase by 3.3021%

#No it is not economically significant.

#Ho : b_lsales = 0

#R tells us t = 1.49
#So we fail to reject --> 1.49 < 1.65

# 2 sided p-value = .147
# 1 sided p-value = .0735
#compared to alpha = .1, we find that.0735 < .1, so we reject the null.
#Conclusion changes with a one-sided test

#Because t = 1.09 and 1.09< 1.65, we fail to reject the null
#Beta2 is not statistically significant.

