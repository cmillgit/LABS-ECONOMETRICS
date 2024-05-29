#Christian Miller
#ECON-4223-001
#Dr. Liu

#Library
library(tidyverse)
library(broom)
library(wooldridge)
library(modelsummary)
library(car)

#load data
df <- as_tibble(wage2)

#View the data
datasummary_df(df)

#Run regression of IQ to obtain delta1~
est1 <- lm(IQ ~ educ, data = df)
tidy(est1)

#Run regression of log wage on educ to obtain beta1~
df <- df %>% mutate(logwage = log(wage))
est2 <- lm(logwage ~ educ, data = df)
tidy(est2)

#Run ful regression of log wage on educ and IQ to obtain beta1hat and beta2hat
est3 <- lm(logwage ~ educ + IQ, data = df)
tidy(est3)
#Verify that beta1~ = beta1hat + beta2hat*delta1~
est2$coefficients["educ"] == est3$coefficients["educ"] +
  est3$coefficients["IQ"]*est1$coefficients["educ"]
#Returns TRUE if the equality holds and FALSE if it doesn't hold

#look at output
modelsummary(
  list(est1,est2,est3)
)
#beta1~ is larger than beta1hat, meaning there is a negative bias.


#Multicollinearity
df <- as_tibble(meapsingle)

#Run the regression of math4 on pctsgle
est1 <- lm(math4 ~ pctsgle, data = df)
tidy(est1)
#The slope coefficient is -0.833 which seems a large effect

#Compute the correlation between lmedinc and free
cor(df$lmedinc, df$free)
#The correlation is -0.7469703, signifying a negative correlation which is expected.
#This is not close enough to 1 to violate the "No perfect collinearity" assumption

#Add lmedinc and free to the regression
est2 <- lm(math4 ~ pctsgle + lmedinc + free, data = df)
tidy(est2)

#Computing Variance Inflation Factors
vif(est2)
