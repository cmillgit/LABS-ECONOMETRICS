#Christian Miller
#ECON-4223
# 20 November 2023

# Problem Set 6


#Warm Up
#Independent cross sections observe different units or entities, so differencing them across the two years would provide no information of the temporal effects.
#Panel data is used for first differences because it observes the same group over different periods of time, which allows us to observe temporal effects.

#Exercises
#13.6.i
#P(arrest = 1) = beta_0 + delta_0year90 + beta_1florida + delta_1year90*florida + u
#Where year90 is equal to unity if in the year 1990, 0 if 1985
#Where florida is equal to unity if the person lives in Florida, 0 if Georgia
#delta_1 in this model measures the effect of the law.

#13.6.ii
#You might want to control for other factors in this model because there are many other factors that could influence the probability of being arrested for drunk driving, aside from the policy.
#These factors may include gender, age, race, and reason for being pulled over.

#13.6.iii
#This new data structure provides actual arrest rates instead of a sample, which will reduce the error from sampling.
#The interpretation of the coefficients will be different as the represent averages across the counties in each of the states rather than state level averages.
#I would use a first difference because the data observes the same counties across two periods of time.

#14.7
#I would use the heteroskedasticity-robust standard error because the set of data is obtained from a random sample from the population.
#There is usually no reason to account for cluster effects in computing standard errors after OLS estimation. 
#The fact that the units can be put into groups after the random sample has been obtained—is not a reason to make inference robust to cluster correlation.

#Computer Exercises
#13.C5.i
df <- as_tibble(rental)
table(df$year)
df %<>% mutate(year = as.factor(year))
est <- lm(lrent ~ y90 + lpop + lavginc + pctstu, data = df)
modelsummary(list(est), stars = T)
# lrent = -0.569 + 0.262y90 + 0.041lpop + 0.571lavginc + 0.005pctstu
# SE's are (0.535), (0.035), (0.023),     (0.053),       (0.001) respectively
#The estimate on y90 indicates that the year 1990 is associated with a 26.2% higher rent compared to the reference year 1980, ceteris paribus.
#The estimate on pctstu indicates that every percent increase in the population of students is associated with a 0.5% increase in rent.

#13.C5.ii
#The standard errors are not valid because a_i is not in the actual pooled OLS estimation and could be included in the error term.

#13.C5.iii
est.dif <- plm(the.formula, data = df, index = c("city", "year"), model = "fd")
modelsummary(list(est, est.dif), stars = T)
# lrent = 0.386 + 0.072lpop + 0.310lavginc + 0.011pctstu
# SE's are (0.037), (0.088),   (0.066),      (0.004) respectively
#In the first difference model, the effect of pctstu has more than doubled compared to the original estimate.
#This allows us to conclude that the relative size of the student population appears to affect rental prices.

#13.C5.iv
#Robust standard errors for the FD model are (0.049), (0.070), (0.089), (0.003) respectively.
#The robust standard errors do not change the statistical significance in the FD model at the 5% level.

#14.C14.i
df <- as_tibble(airfare)
df %<>% mutate(year = as.factor(year),
               y98 = as.factor(y98), 
               y99 = as.factor(y99),
               y00 = as.factor(y00))
df.within <- df %>% select(id, year, concen) %>%
  group_by(id) %>%
  summarize(concenbar = mean(concen))
min(df.within$concenbar)
max(df.within$concenbar)
#There can be 1149 different averages. The min is 0.1862 and the max is 0.9997.

#14.C14.ii
est.fe <- lm_robust(lfare ~ y98 +
                      y99 +
                      y00 +
                      concen +
                      ldist +
                      I(ldistsq) +
                      concenbar, data = df, fixed_effects = ~id)
modelsummary(est.fe)
# FE model: lfare = 0.023y98 + 0.036y99 + 0.098y00 + 0.169concen
#SE's are     (0.005), (0.005), (0.005) , (0.040) respectively
est.re <- plm(lfare ~ y98 +
                y99 +
                y00 +
                concen +
                ldist +
                I(ldistsq) +
                concenbar, data = df, index = c("id", "year"), model = "random")
modelsummary(est.re)
#RE model: lfare = 6.208 + 0.023y98 + 0.036y99 + 0.098y00 + 0.169concen - 0.909ldist + 0.104ldistsq + 0.214concenbar
#SE's are (0.809), (0.004), (0.004), (0.004), (0.029), (0.247), (0.019), (0.068) respectively.

#14.C14.iii
#Dropping ldist and ldistsq does not change the coefficient on concen but it changes the coefficient on concenbar to -0.709.

#14.C14.iv
#The p-value is 0.0017 which indicates that the gamma_1 estimate is statistically significant at the 5% level.
#The estimate of beta_1 is the same regardless of the model.

#14.C14.v
#The t-statistic is 2.618 and the corresponding p-value is 0.009.
#This does not change the conclusion reached when the RE model was estimated using the usual RE standard error as the p-value continued to remain below 0.05 at the 5$ level.

#Cool Down
#First differencing will remove the effect of age from the error term of the model. This will allow us to estimate the effect of age on saving.