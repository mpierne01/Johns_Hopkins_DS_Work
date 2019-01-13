### R- Programming Stats
## Exercise: Test for normality

# Dataset = diamonds, library = ggplot2

# Get familiar with the diamons dataset. What does the couln depth tell us?

# Perform at least 2 graphical tests for normality

# Get familiar with the package nortest and perform at least 3 different tests for normality.

# Shipiro Wilk test can only tackle 5000 rows max

library(ggplot2)
head(diamonds)
attach (diamonds)

qqnorm(depth) # looks too curvy for a normal distribution
hist(depth) #hist looks abnormal as well

depthsmall = sample(depth,5000) # sampling to get a vector fitted for shapiro test


#Base package
shapiro.test(depthsmall) # Shapiro wilk test from base pack  (The Shapiro-Wilk test utilizes the null hypothesis principle to check whether a sample x1, ..., xn came from a normally distributed population. The test statistic is:)

#Nortest =Tests for normality
library(nortest) # Pack contains several useful normality tests

cvm.test(depth) # Cramer von Mises Test, since AD gives NAs for that high significance

lillie.test(depth) #Kolmogorov Smirnov

sf.test(depthsmall) #Shapiro Franca Test

pearson.test(depth) # Pearson normality test ( Run against the whole set)

