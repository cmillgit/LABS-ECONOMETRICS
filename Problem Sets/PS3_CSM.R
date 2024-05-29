#Christian Miller
#ECON-4223
#Dr. Liu
#26 September 2023

                                                #Problem Set 3
#Warm Up

#Both heteroskedasticity and omitting an important explanatory variable can cause the usual OLS t-statistic to be invalid


#Exercises
#Wooldridge 4.5

#4.5.i
#The 95% Confidence Interval at a 5% significance level for B_hsGPA is (0.23, 0.60)

#4.5.ii
#|0.128| < 1.96, so we fail to reject the null against the two-sided alternative at 5% significance level.

#4.5.iii
#|-6.255| > 1.96, so we reject the null against the two-sided alternative at 5% significance level.

#Wooldridge 8.4

#8.4.i
#The variables mentioned have positive effects on termGPA which is to be expected.
#crsGPA and cumGPA have t-statistics above the critical value of 1.96, making them statistically significant at the  5% level.
#tothrs has a t-statistic below the critical value of 1.96, making it insignificant at the 5% level.
#The standard errors used in this case do not matter in this case.

#8.4.ii
#The null hypothesis makes sense in this case as the weighted average of overall GPA in courses taken will give the term GPA.
#The absolute value of the t-statistics calculated from both standard errors approximately equal 0.6 which is less than the critical value of 1.96, so we fail to reject the null in both cases.

#8.4.iii
#The t-statistics for each standard error are 1.6 and 1.96, indicating that the variable is not statistically significant at the 5% level, regardless of which standard error is used.
#At the 10% significance level, the null hypothesis can be rejected.


#Computer Exercises
#Wooldridge 4.C12

#4.C12.i
#colGPA = 0.028 + 0.659hsGPA + 0.013actmth + 0.012acteng
#Each explanatory variable is statistically significant.

#4.C12.ii
#In increase in hsGPA by about .343 will increase colGPA by about 0.226.
#actmth would need to increase by 4.587 standard deviations.

#4.C12.iii
#p-value = 0.92523
#Reject the null hypothesis

#4.C12.iv
#Since the R^2 from the model = 0.256, I could find more explanatory variables to make a better fitting model.

#Wooldridge 8.C2

#8.C2.i
#The robust standard errors are greater than the usual standards errors for all variables in the model.

#8.C2.ii
#Again, the robust standard errors are greater for all variables, but the differences in standard errors are smaller than in the previous model.

#8.C2.iii
#This suggests that the transformed model contains less heteroskedasticity, which results in the transformed model being a slightly better fit.

#Wooldridge 8.C7

#8.C7.i
#approve = 0.708 + 0.201white + 0other


#8.C7.ii
##In both cases, other factors contain a lower value less than zero, and the fitted values for white are greater than zero but less than one.


#Cool Down
#The usual F statistic no longer having an F distrubution, and the OLS estimators no longer being BLUE are consequences of heteroskedasticity.