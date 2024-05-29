#Christian Miller
#ECON-4223-001
#Dr. Liu
#5 August 2023

library(tidyverse)
library(broom)
library(wooldridge)
library(modelsummary)

#load the data
df <- as_tibble(hprice1)

#summary stats
datasummary_skim(hprice1)

#run the regression
est1 <- lm(price ~ sqrft + bdrms, data = df)
modelsummary(est1)

mean(est1$residuals)

#interpret the coef.
#sqrft:if sqrft increases by 1 foot, house price will increase by $128 on average, holding others constant

#bdrms: On average, holding others constant, an additional bedroom will lead to a $15,198 increase in house price.

#R^2 = 0.632
#This indicates the model is a pretty good fit.

#Adding in non-linearities (new variables)
df <- df %>% mutate(logprice = log(price), sqrftSq = sqrft^2, bdrmSq = bdrms^2)
#Run the new model
est2 <- lm(logprice ~ sqrft + sqrftSq + bdrms + bdrmSq, data = df)
modelsummary(est2, fmt = 10)

#Using the Frisch-Waugh Theorem to obtain partial effects
#Regress sqrft on the other X's and store residuals as a new column in df

est <- lm(sqrft ~ sqrftSq + bdrms + bdrmSq, data = df)
df <- df %>% mutate(sqrft.resid = est$residuals)
#Run a simple regression of logprice on sqrft.resid
est <- lm(logprice ~ sqrft.resid, data = df)
modelsummary(est)

beta1 <- sum(df$sqrft.resid*df$logprice)/sum(df$sqrft.resid^2)
print(beta1)
