#### R Stats Classisifacation
# Exercise Iris - LDA and KNN

# Classify the iris dataset according to Species
# using the predictors Petal.Length and Petal Width
# performing both LDA and KNN (k of 3)

# test data frame

Petal.Width = c(0.7, 2.5)
Petal.Length = c(2.4, 7)
Species = c("setosa", "virginica")
test = data.frame(Petal.Width, Petal.Length, Species)

library(lattice)

with(iris, xplot(Petal.Length ~ Petal.Width, group=Species,
                 auto.key=T, pch=20, cex=3))

library(MASS)

mylda =lda(data=iris, Species ~ Petal.Length+Petal.Width)

mylda
plot(mylda)

# to use the predict funtion, it is useful to create a data frame
# with the test vectors

# test dataframe
Petal.Width = c(0.7, 2.5)
Petal.Length = c(2.4, 7)
Speciaes = c("setosa", "virginica")
test = data.frame(Petal.Width, Petal.Length, Species)

mylda.prediction = predict(object = mylda, newdata = test[,c(1,2)])$class
# we specifiy that we want the class output

mylda.prediction
 table(mylda.prediction, test[ ,3])

#### KNN K nearest Neighbor

## Clear the environment 

attach(iris)

train <- cbind(Petal.Width, Petal.Length)

library(class)

test = matrix(c(0.7, 2.5, 2.4, 7), nrow=2)

knn(train, test, cl=Species, k=3, prob=T)