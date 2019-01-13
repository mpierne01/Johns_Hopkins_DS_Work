#### R Stats Machine Learning Cross Validation

# Exercise Cross Validation

# Crate a model with the faithful dataset
?faithful
# explain waiting with eruptions
# get a visual impression to get an idea of the relationship
# get the MSE using simple cross validation and 5 fold CV
# in the solution I will use a 50/50 split of the dataset for simple CV
# compare the results - Which one has a lower error rate?
# what could be possible problems with the cv approach I outlined

# Simple CV
# Simple xy plot
plot(faithful$waiting, faithful$eruptions)

# linear model explaining the waiting time - training data 1-136
mymodel = glm(data = faithful[1:136,], waiting ~ eruptions)

# MSE on the second half of the data ( validation set)
# (difference of the ture values of faithful$waiting from the predicted model)
mean((faithful$waiting - predict(mymodel, faithful))[137:272]^2)

#### 5-fold CV

library(boot) # for the cv.glm function

# we are going to get a model with the full dataset
mymodel2 = glm(data=faithful, waiting ~ eruptions)

# cv.glm for 5 fold cv
cv.result = cv.glm(data = faithful, mymodel2, K =5)

# the error rate is slightly lower with standard CV
cv.result$delta

### 5 fold Cv will keep bias out of your data

