### R Stats ANOVA

# Exercise ANOVA

set.seed(234)
myobject = data.frame(group=rep(c("a", "b", "c"),10),
                      numeric=c(rnorm(5,5),6:15, rep(c(1,20,98),5)))

# Create the object myobject as stated above. There are 3 groups in it and every group has 
# 10 observations in the column numeric

# get 3 different visual impressions of this data ( hint; jitter, boxpl, violin will work)

# perfrom an ANOVA and do at least 2 post hoc tests (test for multiple comparison)
# hint: think about ways of adjusting p values ( multiplicity)
# what is the problem if you would not adjust for p values in this post hoc tests?

# which test would you choose if myobject would not be normally distributed
# perform a non parametric test instead of ANOVA

# myobject: 3 groups, balanced, rnorm

set.seed(234)
myobject = data.frame(group=rep(c("a", "b", "c"),10),
                      numeric=c(rnorm(5,5),6:15, rep(c(1,20,98),5)))

levels(myobject$group)

# simple boxplot in base
boxplot(data=myobject, numeric~group)

# violin plot gets a better view on the distribution of the data
library(lattice)
bwplot(data=myobject, numeric~group, panel=panel.violin)

# jitter plot displays all the points individually
library(ggplot2)
qplot(data=myobject, formula=y~x, x=group, y=numeric, geom="jitter")

myanova=aov(data=myobject, numeric~group)
summary(myanova)


TukeyHSD(myanova)

plot(TukeyHSD(myanova))
coefficients(myanova)

#pairwise t test with adjusted p value as an alternative post hoc test
pairwise.t.test(x=myobject$numeric, g=myobject$group, p.adj="BH")

library(DTK)
#Tukey Kramer Test
TK.test(x=myobject$numeric, f=myobject$group)

# we need those post hoc tests to adjust the p values - otherwise the T1 error rate
# would be inflated ( higher than significance level 0.05)

kruskal.test(data=myobject, numeric~group)

