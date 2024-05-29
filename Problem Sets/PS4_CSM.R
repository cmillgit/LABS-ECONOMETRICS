#Christian Miller
#E*C*ON-4223
#Dr. Liu
#22 October 2023

#                                   Problem Set 4

#Warm Up 
#9.2.i
#On average, candidate A's share of the two party vote in 1990 increases by 0.067 votes for every one-unit increase in their vote share in 1988, ceteris paribus. 
#The t-stat is approximately 1.26 which is less than the critical value of 1.96, therefore we fail to reject the null.
#9.2.ii
#Adding voteA88 slightly decreases the estimated coefficients on all variables in the model and minutely increases the R^2.

#Exercises
#9.4.i
#The CEV assumptions require that the measurement error in tvhours has a mean of zero and is statistically independent of, or at least uncorrelated with age, parents' education, and number of siblings.
#9.4.ii
#The CEV assumptions are not likely to hold in this case because tvhours may be misreported and the degree of misreporting my vary depending on some of the other factors like age.

#15.2.i
#dist might be uncorrelated with u depending on a multitude of factors, but is a decent instrumental variable to start with.
#15.2.ii
#dist must be partially correlated with atndrte, giving predictive power for the attendance rate based on distance.
#In this case, a negative correlation between distance and attendance rate would only make sense.
#15.2.iii
#The interaction term priGPA*dist can be used as an instrumental variable as both variables are assumed to be exogenous.

#Computer Exercises
#9.C2.i
#On average, wage will increase by 5.8% per year of education, ceteris paribus.
#9.C2.ii
#The coefficient for education decreases to 0.048, meaning that the estimated return to education has decreased by 1%.
#9.C2.iii
#IQ has a t-statistic of 0.75 in magnitude and is not individually significant.
#KWW has a t-statistic of about 1.27 in magnitude and is not individually significant.
#They are not jointly significant as they have an F-statistic of 1.64, which is less than the critical value of 1.96.

#15.C3.i
#nearc4 might indeed be correlated with other things in the error term.
#For example, someone might have grown up near a four-year college because at least one of their parents taught at the school.
#If their parents were involved in academia, it is likely that they value education and learning which could be passed on to their children and result in higher wages in the future.
#15.C3.ii
#On average, living near a college increases IQ by 2.596 points, ceteris paribus, and is statistically significant.
#15.C3.iii
#After partialling out the geographic dummy variables, the effect nearc4 is smaller and is statistically insignificant.
#15.C3.iv
#I conclude that controlling for smsa66 and the regional dummies is important because it reduces the bias in the model.

#Cool Down
#15.1.i
#PC ownership might be correlated with u because, for example, someone with a PC might be from a wealthier family and this can have an effect on GPA.
#15.1.ii
#Students who own a PC might come from higher income families because they can afford to buy one for their children, so as parental income increases, so could PC ownership.
#Parental income might not be a good IV for PC because although it is likely relevant, it is probably correlated with other factors in the error term such as quality of education.
#15.1.iii
#Since receiving the grant is strongly correlated with PC ownership, and grants were distributed randomly, it is likely that this would be a good IV.
#I would gather the data on which students received the grants and create a binary variable for this,
#I would then use a 2SLS regression to obtain consistent and unbiased estimates for the effect of PC ownership on GPA.
