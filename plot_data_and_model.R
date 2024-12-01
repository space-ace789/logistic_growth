library(here)

#Script to plot data and model

growth_data <- read.csv("experiment.csv")

source(here("Functions", "Logistic Function.R"))

logistic_fun(growth_data)

N0 <- 1320.207 # initial size of the population
  
r <- 0.0095218 # growth rate (t from the datasubset1 model)
  
K <- 6.00e+10 #top of the graph lol, or the intercept of datasubset 2

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()

  scale_y_continuous(trans='log10')


