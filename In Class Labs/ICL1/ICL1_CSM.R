#Christian Miller
#ECON-4223
#Dr. Liu
#24 August 2023

#install.packages("tidyverse")
library(tidyverse)

#install.packages("modelsummary")
library(modelsummary)

#install.packages("wooldridge")
library(wooldridge)

#loading data
df <- as_tibble(wage1)

#summary statistics
datasummary_skim(df, histogram = FALSE) #then look at 'educ' column
#mean of education = 12.6

mean(df$female)
#or
datasummary_skim(df, histogram = FALSE) #then look at 'female' column
#female = 47.91%

#visualization
ggplot(df, aes(educ)) +
  geom_histogram(binwidth = 1) +
  theme_classic()
#mode = 12 years

ggplot(df, aes(wage)) +
  geom_histogram(binwidth = 1) +
  theme_classic()
#mode = $3 per hour

#creating a new variable
df <- df %>% mutate(realwage = wage * 4.53)
summary(df$realwage)
datasummary_skim(df, histogram = FALSE) #then look at realwage column

#dropping observations
summary(df$female)
df <- df %>% filter(female == 1)
summary(df$female)

#missing values
summary(df$wage)
df <- df%>% drop_na(wage)
summary(df$wage)