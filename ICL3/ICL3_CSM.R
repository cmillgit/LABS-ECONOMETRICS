#Christian Miller
#ECON-4223
#31 August 2023

#Open libraries
library(tidyverse)
library(modelsummary)
library(broom)
library(wooldridge)

#Load in data
df <- as_tibble(meap93)

#Estimate the regression model
est <- lm(math10 ~ expend, data = df)
tidy(est)
glance(est)
#Interpretation: On average, pass rate increases by 0.002 percent per dollar spent on students.

#Verifying the regression coefficients
beta1 <- cov(df$math10, df$expend) / var(df$expend)
beta0 <- mean(df$math10) -beta1 * mean(df$expend)

#Visualizing Regression Estimates
ggplot(df, aes(expend, math10)) +
  geom_point() +
  geom_smooth(method = 'lm')

#Nonlinear Transformations
df <- df %>% mutate(logexpend = log(expend))

#Re-estimate and re-visualize the model showing both functional forms together
est <- lm(math10 ~ logexpend, data = df)
tidy(est)
glance(est)
modelsummary(est)

ggplot(df, aes(expend, math10)) +
  geom_point() +
  stat_smooth(method = "lm", col = "red", se = F, formula = y ~ log(x)) +
  stat_smooth(method = "lm", col = "blue", se = F)
#Interpretation of Beta1 in this model?

#Standard Errors and Regression Output
n <- dim(df)[1]
sig <- sqrt(sum(est$residuals ^ 2) / (n - 2)) #or more simply, glance(est)$sigma
SSTx <- (n - 1) * var(df$logexpend)
sumx2 <- sum(df$logexpend ^ 2)

#Compute Standard Error of the Intercept
sqrt((sig^2 * (1 / n) * sumx2) / SSTx)
#SE = 26.53013

#Compute Standard Error of the Slope Coefficient
sqrt(sig^2 / SSTx)
#SE = 3.169011