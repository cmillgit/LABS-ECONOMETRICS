#Chirstian Miller
#ECON-4223
#Dr. Liu
#26 September 2023

install.packages(c("lmtest", "estimatr"))
library(tidyverse)
library(broom)
library(wooldridge)
library(car)
library(lmtest)
library(estimatr)
library(magrittr)
library(modelsummary)

df <- as_tibble(gpa3)
datasummary_skim(df)

df %<>% filter(term==2)

df %<>% select(cumgpa, sat, hsperc, tothrs, female, black, white)

#Run the two regressions
est <- lm(cumgpa ~ sat + hsperc + tothrs + female + black + white, data=df)
modelsummary(est, stars = T)

est.rob <- lm_robust(cumgpa ~ sat + hsperc + tothrs + female + black + white, data=df)
modelsummary(list(est,est.rob), stars = TRUE)

#Overall, using the robust standard error does not change our hypothesis results

glance(est)
linearHypothesis(est.rob, c('sat', 'hsperc', 'tothrs', 'female', 'black', 'white'))

#The LM test
#Conduct an LM test following the steps above
restr <- lm(cumgpa ~ 1, data=df)
LMreg <- lm(resid(restr) ~ sat + hsperc + tothrs + female + black + white, data=df)
LM <- nobs(LMreg)*glance(LMreg)$r.squared
pval <- 1-pchisq(LM,6)
#With a p value of 0, reject the null
#All three test results give us a tiny p value, resulting in the same conclusion.

#Load another dataset
df.auto <- read_csv('https://tyleransom.github.io/teaching/MetricsLabs/auto.csv')

#Estimate the regression model
df.auto %<>% mutate(log.price = log(price), foreign = as.factor(foreign))
est.auto <- lm(log.price ~ weight + foreign, data=df.auto)
#Regular Standard Errors
modelsummary(est.auto)

#Now use Heteroskedasticity-robust SEs
est.rob.auto <- lm_robust(log.price ~ weight + foreign, data=df.auto)
modelsummary(list(est.auto,est.rob.auto), fmt=4, star=T)

#Now use cluster-robust SEs
est.clust.auto <- lm_robust(log.price ~ weight + foreign, data=df.auto,
                            clusters=manufacturer)
modelsummary(list(est.auto,est.rob.auto,est.clust.auto), fmt=4, star=T)

#Do an F test
linearHypothesis(est.clust.auto,c("weight=0","foreignForeign=0"))
#p-value is tiny so we can reject the null from the overall F test.