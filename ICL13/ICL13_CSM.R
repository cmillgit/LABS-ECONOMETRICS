#Christian Miller
#ECON-4223
#Dr. Liu

library(tidyverse)
library(wooldridge)
library(broom)
library(magrittr)
library(modelsummary)
library(tsibble)
library(pdfetch)
library(tseries)
library(lubridate) # This package converts dates to a special date numbering system
library(fable) # This one may take awhile to install
library(feasts) # You also need to install this one
library(urca) # and this one

df1 <- as_tibble(intqrt)
df1 %<>% mutate(quarter = seq(yq('1960:Q1'),yq('1990:Q4'), by = 'quarters')) # create quarter
df1 %<>% select(r3,quarter)

df1 %<>% as_tsibble(index=quarter)

autoplot(df1) + xlab("Year") + ylab("T-bill return")

#Testing for a unit root
adf.test(df1$r3, k=1) #testing one lag
#p-vallue of 0.2492
#Fail to reject the null (unit root), aka "we will assume that we have a unit root"
#Because we have a unit root, we will need to take a first difference to get cov stationarity

est.tbill <- lm(r3 ~ lag(r3,1), data=df1)
modelsummary(est.tbill)
#coef on lag (r3, 1) is pretty close to one, suggesting our rho is close to one --> we likely have a unit root

#Are the R^2 values from these estimates meaningful?
#No, unless the process is cov. stationary.

#First difference, ARIMA(1, 1, 0)
est.ARIMA <- lm(difference(r3) ~ lag(difference(r3)), data = df1)
modelsummary(est.ARIMA)
#note that the coefficient is not close to 1, we reject null that rho = 1