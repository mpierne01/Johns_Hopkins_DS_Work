### R Stats T-Tests 2 Sample

# Exercises: 2 sample T test

# dataset = ships, library = MASS

# get familiar with the dataset ships
# we are interested in the relationship of period and incidents
# use an appropriate graphical tool to show the relationship
# use a T ttest to compare the incidents in the 2 periods ( code it in 2 different ways)
# are there significant difference in period?

library(MASS)
? ships
attach(ships)
head(ships)

boxplot(incidents ~ period)

t.test(incidents ~ period)

t.test(incidents[period==60], incidents[period==75])