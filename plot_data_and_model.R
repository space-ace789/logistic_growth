#Script to plot data and model

growth_data <- read.csv("experiment.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N) #give us the N value out of the function
  
}

N0 <- 1320.207 # initial size of the population
  
r <- 0.0095218 # growth rate (t from the datasubset1 model)
  
K <- 6.00e+10 #top of the graph lol, or the intercept of datasubset 1

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()

  scale_y_continuous(trans='log10')


