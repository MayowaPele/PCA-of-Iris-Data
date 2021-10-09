# Principal Component Analysis of The Iris Data
data(iris)
head(iris)

summary(iris)
IrPc = prcomp(iris[ ,1:4], scale=TRUE) # scales and centers the feature-
# continuous data in the dataset

plot(iris$Sepal.Length, iris$Sepal.Width) # Plot of sepal length vs Sepal Width
plot(scale(iris$Sepal.Length), scale(iris$Sepal.Width)) # Plot of scaled Sepal length vs Sepal Width

IrPc

summary(IrPc) 
# From the summary, the proportion of variance shows the percentage of variance 
# explained by each component while the cummulative proportion is the cumulative
# percentage explained by each component

#Scree plot
plot(IrPc, type="l") # This plots the variance(square of standard dev.) of the
# components against the components themselves.

biplot(IrPc, scale= 0) # This gives an interpretation for the principal component
# values. From the plot, as an observation has a higher value of PC1, it has a 
# lower value for sepal width and a higer value for sepal length, petal width 
# and petal length. This explanation also applies for PC2 

# Extract principal component scores
str(IrPc)

# Bind the principal component to the original data
Ir_Pr = cbind(iris, IrPc$x[ ,1:2]) # We bind the first two principal comp. because
# they are the major components that have an effect on the data

install.packages('ggplot2')
library(ggplot2)

# Plot a graph that of PC1 against PC2
ggplot(Ir_Pr, aes(PC1, PC2, col=Species, fill=Species))+
  stat_ellipse(geom = 'polygon', col= 'black', alpha=0.5)+
  geom_point(shape=21)

# Another way to find correlations between our principal
# components and our data is by using the cor() function
cor(Ir_Pr[1:4], Ir_Pr[6:7]) 
# From the results we can deduce that the results are very similar to what was obtainable
# from the biplot as there is positive correlation between PC1 and Sepal.Length,
# Petal.Length, Petal.Width. There is negative correlation between PC1 between
# Sepal.Width
