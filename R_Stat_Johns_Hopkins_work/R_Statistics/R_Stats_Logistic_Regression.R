### R Stats Logistic Regression

# Exercise - Logisitic Regression

# Get a visual impression of the PlantGrows df. Hows does the group influence weight?

# extract treatment gr 1 and 2 from the PlantGrows dataframe ( do not include the control) 

# fit a ligistic regression model and check for significance of the variable weight

# add a weight of 7.5 to the dataframe and predict the group of this weight value

attach(PlantGrowth)
plot(group,weight) # gets a box plot

mysubset = subset(PlantGrowth, group !="ctrl") ctrl is omitted

model = glm(data=mysubset, group ~ weight, family="binomial")
summary(model) # fitting the model and checking for significance

addon = data.frame(weight=7.5) # creating the extrapolation to 7.5

predict(model, addon, type="response") # getting the probability

# we can be 99% sure that if the plant has 7.5 weight units it will be in group 2 = trt2