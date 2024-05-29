#Christian Miller
#ECON-4223

install.packages("AER")
library(tidyverse)
library(wooldridge)
library(broom)
library(AER)
library(magrittr)
library(modelsummary)

df <- as_tibble(fertil2)


df %>% datasummary_skim(histogram = F, output = "myfile.docx")

#OLS Estimation
est.ols <- lm(children ~ educ + age + I(age^2), data = df)

modelsummary(est.ols)
tidy(est.ols)

#Age has a positive effect on number of kids with a decreasing marginal rate

#Create IV
df %<>% mutate(firsthalf = mnthborn<7)

#1st stage: regress educ on firsthalf
est.iv1 <- lm(educ ~ firsthalf, data = df)
tidy(est.iv1)

#IV estimation
est.iv <- ivreg(children ~ educ + age + I(age^2) | firsthalf + age + I(age^2), data = df)
modelsummary(list(est.ols, est.iv1, est.iv))

modelsummary(list(est.ols, est.iv1, est.iv), output = "results.jpg")
modelsummary(list(est.ols, est.iv1,est.iv), output = "results.docx")

confint(est.iv)
