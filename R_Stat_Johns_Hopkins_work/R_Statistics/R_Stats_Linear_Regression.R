### R Stat Linear Regression

# Exercise Multiple Linear Regression

# Dataset = dimonds, library = ggplot2

# fit a model for a price explained with depth, x,y,z and check if the varable contribute significantly

# get summary information of the model. How much of the price can you explain?

# get confintervals, correlations and anova tables

library(ggplot2)
head(diamonds)
attach(diamonds)

mymodel = lm(price ~ depth + x + y + z)
summary(mymodel) # we can explain approx 78% of the price with our model

confint(mymodel) # to get the confidence intervals

cor(diamonds[,c(5,8:10)]) # to check the cor matrix of the x variables

anova(mymodel) # to check for the variance of the x variables


