#Christian Miller
#ECON 4223
#7 November 2023

#Poblem Set 5 

#Warm Up
#we want to understand the relationship between two or more variables using regression analysis, we need to assume some sort of stability over time.
#Allowing two variables to change arbitrarily over time makes it difficult for us to learn how a change in one variable changes the other.

#18.7
#To test if the growth in money supply Granger causes unemployment, I’d first confirm that both time series are stationary, using tests like ADF. If they’re not, I’d difference them to achieve stationarity. 
#I would then specify your AR(1) model for unemployment, incorporating lagged values of money supply growth. The optimal number of lags can be chosen based on criteria like AIC or BIC.
#I would then perform an F-test to check the joint significance of the money supply growth lags in the unemployment equation. If these lags are statistically significant, I can reject the null hypothesis of no Granger causality, indicating that past values of money supply growth have predictive power over unemployment. 

#18.9
#The error in forecasting the difference directly translates into an error in forecasting the level, since the level forecast is dependent on the change forecast.

#11.c10.i
#The intercept negligibly increases from 2.8 to 2.828. Similarly, the coefficient on unem decreases from -0.515 to -0.518 in the new model.
#Neither the intercept or slope parameter change notably with this new regression.
#The estimate for the coefficient on unem is significant at the 5% level.
#Note: the data available in PHILLIPS only contains data until 2003, where the textbook says "Using the data through 2006 in PHILLIPS" to estimate equation 11.19.

#11.c10.ii
#The new estimate of the natural rate of unemployment is roughly 5.5%, which is consistent with the estimate in example 11.5.

#11.c10.iii
#The first order autocorrelation for unem is about 0.742, and after running an ADF test, we fail to reject the null hypothesis that it has a unit root.

#11.c10.iv
#The model with cunem as the explanatory variable gives a higher R^2 at 0.135.

#18.c3.i
# pcip = 1.804 + 0.349pcip_1 + 0.071pcip_2 + 0.067pcip_3
#The coefficient on pcip_4 is 0.051 and is insignificant at the 10% level.

#18.c3.ii
#pcsp does not Granger cause pcip

#18.c3.iii
#pcsp granger causes pcip conditional on the differences in i3.

#Cool Down

#10.1.i
#We cannot assume that observations in time series are independently distributed because there is no notion of random sampling and we need to worry about serial correlation.

#10.1.ii
#Under the first three GM assumptions, the OLS estimators should be unbiased, however they are often violated in the context of time series.

#10.1.iii
#This is not true and trending variables are often included in time series regression to account for trends.

#10.1.iv
#Seasonality is often an issue when using annual time series observations and can caused biased estimators when omitted from the regression.