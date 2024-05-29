#Christian Miller
#ECON 4223
#Dr. Liu

library(tidyverse)
library(wooldridge)
library(broom)
library(car)
library(pdfetch)
library(magrittr)
library(lmtest)
library(sandwich)
library(tsibble)

#load data on US macroeconomic indicators
df.ts <- as_tsibble(intdef)

#Plot time series data and look at the inflation rate in the US between 1948-2003
ggplot(df.ts, aes(year, inf)) +
  geom_line()

#estimate the regression model on determinants of the interest rate
est <- lm(i3 ~ inf +
            lag(inf, 1) + 
            lag(inf, 2) + 
            def, 
          data = df.ts)

tidy(est)
#The significant variable in this model is inf in the index year t.

#Compute HAC standard errors
coeftest(est) #re-display baseline results
coeftest(est, vcov = NeweyWest)

#The Newey-West SE's are larger for the estimates on deficit and inflation rate 2 years before t, and smaller for the other two dependent variables.
#This indicates that these estimates exhibit serial correlation, and their p-values are larger as a result.
#The only significant variable is still inflation rate in year t.

#Get rid of serial correlation by differencing the data.
est1 <- lm(difference(i3) ~ difference(inf) + 
             lag(difference(inf), 1) +
             lag(difference(inf), 2) +
             difference(def), 
           data = df.ts)
#Compute Newey-West SEs on the difference model.
coeftest(est1, vcov = NeweyWest)

#The Newey-West SEs in the difference model are smaller for each estimate than the baseline model.
#I conclude that inflation rate in the year t and two years prior to t are significant determinants with positive effects on the change in change in the 3-month Treasury Bill interest rate.