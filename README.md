# logistic_growth

Answers to Questions 1-3 of the Version Control Coding Assignment

<ins>**Question 1**<ins>

The data used to create these models was from experiment.csv is attached under the same name to this git repository. The data was originally sourced from OSF and was created on 22<sup>nd</sup>  September 2023.

<ins>Plotting the Data:<ins> 

The analysis began by simply plotting time against the population size of the *E. coli*. This produced an S shaped curve which suggests the bacterial population is growing via logistic growth. This is when you initially have exponential growth, before slowing and becoming more linear as you reach the carrying capacity (k) , once at carrying capacity growth stops and the population is expected to remain constant if all else remains equal. The result is that at small populations and early in time very little change in population happens, however this quickly turns into rapid increase in population around intermediate values of t and population size before tailing off at high population sizes, was shown in the plots produced by the code in plot_data.R.

<img width="532" alt="Screenshot 2024-12-12 at 21 26 29" src="https://github.com/user-attachments/assets/6a393bc5-74c6-4bd5-a8db-1d4ccfaae284" />

Plot of time against population size from plot_data.R.

This is the sort of growth that is expected from bacteria as while they are able to reproduce very quickly and could in theory grow exponentially forever in reality the amount of resources available to them e.g. nutrients, space etc, are limited and each ecosystem will have a maximum number of bacteria it is able to support. The logistic growth model predicts that unless stochastic events cause large decreases in population sizes will tend towards the carrying capacity, and bacteria can reach this especially quickly. Feedback loops in the effect of being above or below carrying capacity on growth rate help to keep populations centered around it. If populations somehow exceed the carrying capacity then resource limitation, competition and other limiting factors quickly cause growth rate (r) to become negative, swifly bringing the population back to carrying capacity. If the population starts to decrease awayfrom carrying capacity r will begin to increase again rapidly returning population size to K. 


The exponential, then linear behaviour of logistic growth can be better observed when the y-axis (population size) is log transformed. Therefore the next part of the analysis involved plotting the same data from experiment.csv but with the y-axis log transformed. Just the scale of the axis was transformed rather than the data itself to preserve the original raw data and prevent it being overwritten and potentially introducing issues later on. This plot can be seen below it shows linear increase in log population size (exponential growth) up until around the t = 1500 when it begins to slow, then around t = 2000 the line plateaus showing that population size has reached a constant and growth has stopped.

<img width="535" alt="Screenshot 2024-12-12 at 21 32 35" src="https://github.com/user-attachments/assets/02b96683-04ad-44f9-9f4b-3701dc56cd75" />

<ins>Extracting Values for Models:<ins>

The value of N0 was found by taking the exponential of the y-intercept as predicted by the linear model fitted to the exponential growth section. The exponential of the intercept has to be taken as the N has been log transformed in this model. 

K is simply the y intercept of the linear model applied the constant population/no growth part of the the graph.

r is the gradient of the linear model fitted to the exponential growth portion of the graph.

<ins>Creating and Plotting Models:<ins>

The next part of the analysis involved creating subsets of the data so that both the exponential growth section from the constant population section. This is useful as it allows you to extract the values of N0 (initial population size), r and K  from the data. A linear model was fitted to both sections of the data, however for the model representing growth between 0 ≤ t ≤ 1500 n was log transformed so the linear model actually represents exponentiial growth. The values extracted from the linear models were then substituted into a logistic growth function which used code from the file Logistic Function.R in the functions folder of this repository. This was then plotted on top of the log transformed plot the experimental data to see how well data fit the logistic growth model (plotted in red) (see below image). 

<img width="565" alt="Screenshot 2024-12-12 at 21 54 49" src="https://github.com/user-attachments/assets/28e40bd2-3b34-4151-9c95-e9e8b7c1bc9a" />

<ins>Results:<ins>

Although no statistical tests were performed as seen in the plot above the logistic growth model fit the data very well, suggesting that this population could be reliably modelled logistic growth theory, however stastical tests e.g. a goodness of fit test could be performed to confirm the strength of this fit and makes sure there isnt another model with a better fit.

As calculated from linear models fitted to data from the dataset included on experiment.csv ...

N0 = 986.5075 <br/>
r = 0.0100086 <br/>
K = 6.00 x 10<sup>10</sup>

<ins>**Question 2**<ins>

Assuming exponential growth and based on the values extracted earlier N<sub>(t)</sub> = 986.5075 x (1+0.0100086)<sup>t</sup>.

Therefore at t= 4980, N = 3.41159686x10<sup>24</sup>.

Thus the exponential model predicts that after 4980 minutes the *E. coli* population will be 3.41x10<sup>24</sup>. 

On the otherhand the logistic model predicts that at this time population size will be 6.00 x 10<sup>10</sup>. The reason the exponential growth predicts a much higher number than the logistic growth model is that it does not account for carrying capacity, it is therefore modelling a population with infinite resources or one that has not reached its carrying capactiy yet. However we know that the carrying capacity of this population has been predicted to be 6.00 x 10<sup>10</sup>, and from the plots it is clear that by 4980 minutes the population has reached carrying capacity. 

<ins>**Question 3**<ins>

The R script used to create the plot comparing the logistic growth model with the exponential model is saved in the file, comparing_growth_models.R. To accompany this code I also created a new function for exponetial models, this can be found in the Functions folder, the path to reach it is Functions/Exponential Function.R.  

This is the path to find the plot created from the code in comparing_growth_models.R, Outputs/Logistic_vs_Exponential_plot.png or <https://github.com/space-ace789/logistic_growth/blob/main/comparing_growth_models.R>, which can be seen below.

![Logistic_vs_Exponential_plot](https://github.com/user-attachments/assets/9b804ee9-1707-4b31-bb86-1357c0e29d8c)

This graph shows the same results as our comparison of the predicted N when t = 4980, which is that while under the logistic growth curve growth rate will eventually stop increasing and the population will settle at the carrying capacity. However an exponential model simulates a species which grows continuously at an increasing rate, potentially for forever, which can be seen in this plot as the exponential model continues past the carrying capacity and continues to increase after the logistic model has plateaued. 

Interestingly both models predict the same thing up until aroud t=1500, this is expected as logistic growth models should follow exponential growth in the early stages of population growth. They only begin to slow down and deviate from the exponential growth model as they start to come close to K.

