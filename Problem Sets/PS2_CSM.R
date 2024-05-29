#Christian Miller
#ECON-4223
#Dr. Liu
#11 September 2023

#                             Problem Set 2


#Warm Up (Chapter 3, Problem 7)

#Omitting an important variable can cause OLS estimators to be biased.


#Exercises


#Chapter 3, Problem 9

#9.i***
#The sign for beta_1 will likely be negative, as more pollution is likely to decrease median house price.
#The sign for beta_2 will likely be positive because more bedrooms in a home will likely increase house price.
#beta_1 can be interpreted as the percentage effect of a one percent change in nox pollution on median house price.

#9.ii
#nox and rooms might be negatively correlated because home prices likely increase as pollution decreases. This may draw in wealthier residents who can afford larger homes with more rooms.
#The simple regression of log(price) on log(nox) will produce a downward biased estimator of beta_1.

#9.iii
#Given my answer in part ii, the relationship is what I expected.
#Beta_one in the multiple linear regression is definitely closer to the true elasticity than in the simple linear regression as it suffers less from omitted variable bias.

#Chapter 7, Problem 4

#4.i
#The approximate difference is -32.82%, holding sales and roe fixed.

#4.ii
#Using equation 7.10, the exact difference in estimates salary between the utility and transportation industries is -32.82%.
#This aligns with the approximated difference calculated in the previous question.

#4.iii
#The approximate difference in salary between the consumer products and finance industries is 2.33%.


#Computer Exercises

#Chapter 3, Computer Exercise 8

#3.C8.i
#Mean for prpblck is .1 indicating that, on average, 10% of people in the data are black. The standard deviation of prpblck is 0.2.
#Mean for income = 47053.8 indicating that, on average, the median family income in the data is $47053,8. The standard deviation of income is $13179.3.

#3.C8.ii
#psoda = 0.956 + 0.115prpblck + 0.00000160income. n = 410 R^2 = 0.064.
#Coefficient on prpblck is interpreted as for a one unit change in prpblck, the price of medium soda increases by $0.115
#I believe this is economically large.

#3.C8.iii
#The discrimination effect is smaller when you control for income.

#3.C8.iv
#log(psoda) = -.794 + .122prpblck + .077log(income)
#If prpblck increseas by 20%, the estimated percentage change in soda is $0.244.

#3.C8.v
#the coefficient for prpblck in this model decreases to .073.

#3.C8.vi
#Correlation = -0.838467
#This is what I expect because median income will likely decrease as proportion of people in poverty increases.

#3.C8.vii
#This statement is false because they not perfectly collinear.

#Chapter 7, Computer Exercise 8

#7.C8.i
#The sign will be positive indicating that being white leads to a higher chance of being approved for a loan.

#7.C8.ii
#approve = .708 + .201white 
#The predicted probability of white applicants getting approved is .201 greater than non white applicants.

#7.C8.iii
#The coefficient on white decreases to .129.
#There is still evidence for discrimination.

#7.C8.iv
#The effect of being white on probability of approval when obrat=32 is -4.672.


#Cool Down

#Chapter 7, Problem 5

#7.5.i
#The intercept in the equation will become 1.417.
#The coefficient on noPC is -.157

#7.5.ii
#The R^2 will remain the same.

#7.5.iii
#Inlcuding both PC and noPC in the model would violate assumption 3 of Gauss Markov as they are perfectly collinear.