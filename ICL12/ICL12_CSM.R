#Christian Miller
#ECON-4223

library(tidyverse)
library(wooldridge)
library(broom)
library(AER)
library(magrittr)
library(estimatr)
library(modelsummary)
install.packages("vtable")
library(vtable)

#Load the data
df <- as_tibble(mroz)

#Use stargazer to get a quick view of our data:
df %>% sumtable(out="return")
#It is a problem because it can introduce bias and lead to weak instruments.

#Drop missing wages
df.filtered <- df %>% drop_na(wage, lwage)

#Estimate the Model
df.filtered %<>% mutate(expersq = exper^2)
est <- lm(lwage ~ educ + 
            exper + 
            expersq, 
          data = df.filtered)
modelsummary(est)

#First Stage Regression
# Estimate the first-stage regression (a regression of the endogenous variable (educ) 
#on the instrument(s) (motheduc and fatheduc) and the exongenous explanatory variables (exper and exper^2))
est1 <- lm(educ ~ motheduc + 
             fatheduc +
             exper +
             expersq,
           data = df.filtered)
modelsummary(est1)
#Make sure motheduc and fatheduc are jointly significant with an F-stat larger than 10
linearHypothesis(est1, c("motheduc", "fatheduc"))

#Second Stage Regression
# Estimate the second stage regression, using fitted(est1) to access fitted values from the first stage.
est2 <- lm(lwage ~ fitted(est1) +
             exper +
             I(expersq),
           data = df.filtered)
modelsummary(est2)

#Both stages at once
#Estimate the stages at once using ivreg() or iv_robust().
est.2sls <- iv_robust(lwage ~ educ +
                   exper +
                   I(expersq) |
                   motheduc +
                   fatheduc +
                   exper +
                   I(expersq),
                 data = df.filtered)
#Compare OLS to est2 and est.2sls
est.ols <- lm(lwage ~ educ +
                exper +
                expersq,
              data = df.filtered)
modelsummary(list("OLS" = est.ols, "IV By Hand" = est2, "IV Automatic" = est.2sls))
