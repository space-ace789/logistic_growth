library(here)

#Script to plot data and model

growth_data <- read.csv("experiment.csv")

source(here("Functions", "Logistic Function.R"))
source(here("Functions", "Exponential Function.R"))

N0 <- 986.5075 
r <- 0.0100086 
K <- 6.00e+10 


ggplot(aes(t,N), data = growth_data) +
  geom_function(fun=logistic_fun, aes(color= "Logistic")) +
  geom_function(fun=exponential_fun, aes(color= "Exponential")) +
  labs(y = "Log Transformed Population Size", x = "Time", title = "Exponential Model of Bacterial Growth compared to a Logistic Model of Growth") +
  scale_y_continuous(trans='log10') +
  scale_color_manual(name='Growth Model',
                     breaks=c('Exponential', 'Logistic'),
                     values=c('Exponential'='blue', 'Logistic'='red')) +
  theme(plot.title = element_text(size = 10, hjust = 0.5), legend.position = c(0.2, 0.750))


