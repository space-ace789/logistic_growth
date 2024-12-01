#Script to estimate the model parameters using a linear approximation

library(dplyr)

growth_data <- read.csv("experiment.csv")

#Case 1. K >> N0, t is small

data_subset1 <- growth_data |> filter(t< 1500) |> mutate(N_log = log(N))
#creating a new data set where you only have the dat up to t=1500 and also
#you add an extra column with the Log of the populations.

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)
#The intercept of this is the starting population, however as it is logged you 
#need to unlog it.

exp(7.185544) #unlogging the intercept of Datasubset 1 to find N0

#N0 = 1320.207

#Case 2. N(t) = K

data_subset2 <- growth_data |> filter(t>2500)

model2 <- lm(N ~ 1, data_subset2)
summary(model2)

