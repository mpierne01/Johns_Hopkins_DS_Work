### R Stats Data independance

# Exercise Chi Squared Test

# data = bacteria, library = MASS

# get familiar with the dataset and get a contingency table of y and a treatment group
# get a visual impression of the data
# check for independence with a suitable test

library(MASS)
?bacteria
head(bacteria)
head(bacteria)
attach(bacteria)

table(y, trt)

barplot((table(y,trt)), beside=T)

chisq.test(table(y,trt))
# independance can be rejected


#Pearson correlation coefficent  - 2 numeric variables, linear coefficient, parametric

#Spearman rank correlation coefficent - 2 numeric variables, momotonic coefficient, non-parametic
