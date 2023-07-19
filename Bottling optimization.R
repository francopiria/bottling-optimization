
# A company that sells bottled carbonated water is interested in studying the
# bottle filling process. During the bottling process, three variables can be
# controlled: the percentage of carbonation, the filling operational pressure,
# and the line speed expressed as the number of bottles produced per minute.
# To evaluate the effect of these variables on the liquid height inside the
# bottles, a complete 2^3 factorial design experiment was conducted with the
# following levels:

# Variable                       Low Level (-1)     High Level (+1)
# Carbonation Percentage (%)          10                   14
# Pressure (psi)                      25                   30
# Line Speed (bottles/min)            200                  250

# The dependent variable considered is the height of the liquid column from a
# reference point, expressed in centimeters. Two replications of each
# experimental condition were performed. The results of the experiment can be
# found in the "Bottles" sheet of the Excel file
# "bottling optimization data.xlsx."

# To analyze the data in R I plotted the effects that are of interest for
# interpreting the results, and indicated the conclusions.

bottles <- read.delim2("clipboard", colClasses = c(rep("factor", 3), "numeric"))
View(bottles)

aov.bot <- aov(Height ~ Carbonatation*Pressure*Speed, data = bottles)
summary(aov.bot)

# In the analysis of variance, it is observed that all three variables have a
# significant effect on the response variable, with the carbonation percentage
# having the most pronounced effect, followed by Pressure and Line Speed. All
# three effects are positive, meaning that increasing the independent variable
# results in an increase in the dependent variable.

MEPlot(aov.bot)

# The only significant interaction is between carbonation and pressure. In the
# attached graph, it can be observed that for a low level of carbonation, an
# increase in pressure does not generate a substantial increase in height.
# However, for a high level of carbonation, the same increase in pressure
# results in a more significant increase in height.

IAPlot(aov.bot, select = 1:2)

# When pressure is low, the effect of changing the carbonatation is lower than
# the effect when the pressure is high

# Given the results of the analyisis, in order to minimizing the height of
# the liquid column we should choose the lower levels for the 3 independent
# variables.


# It is worth mentioning that an increase in carbonation percentage or pressure
# would likely entail higher costs. Therefore, by minimizing these factors, not
# only can we achieve our objective of minimizing the liquid height, but it also
# helps improve the economic efficiency of the process. On the other hand, a
# higher line speed would lead to an increase in the number of bottles produced.
# Additionally, this is the least influential factor among those evaluated,
# making it interesting to study the economic balance between minimizing the
# liquid height and maximizing the production quantity.

# Since the goal is to minimize the dependent variable (optimize the process),
# one approach could be to fit the data to a mathematical model and evaluate the
# response surface. However, as all three independent variables influence the
# response variable in the same direction, we simply need to minimize all of
# them simultaneously. Thus, it may not be necessary to create a mathematical
# model and response surface. Additionally, the response surface can only be
# evaluated for two variables at a time, and in this case, we have three
# independant variables involved.










