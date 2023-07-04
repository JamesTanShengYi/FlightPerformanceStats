# EMBO Drosophila Course - Flight Performance Data Analysis Normal R Script
# James Tan of the Pallares Lab, Friedrich Miescher Laboratory of the Max Planck Institute


############################################
## Required Packages
############################################

# Base R will suffice


############################################
## Set working directory and import datasets
############################################

# Change these out for the actual dataset obtained in the course
setwd("C:/Users/jtanshengyi/Desktop/Teaching/EMBO_DrosGen_Course_2023/Data/")
flight_data <- read.csv('DummyFlightExperimentData.csv')


############################################
## Plot distributions of data - histograms
############################################

# E.g., to visualize differences between two species. 
# Substitute 'Species ==' for 'Sex ==' or 'Population ==' to test the other hypotheses.

# D. melanogaster only
mel <- subset(flight_data, Species == 'melanogaster')
mel_flight <- hist(mel$Landing_height_cm,breaks = 15)

# D. simulans only
sim <- subset(flight_data, Species == 'simulans')
sim_flight <- hist(sim$Landing_height_cm,breaks=10)

# Combined - as seen in presentation
plot(mel_flight,col = adjustcolor( "yellow", alpha.f = 0.2),xlim = c(15,55),ylim=c(0,10),xlab='Landing Height / cm',
     main = 'Landing Heights of Two Species of Fly')
plot(sim_flight,col = adjustcolor( "blue", alpha.f = 0.3), add = T)
text(23,9,substitute(paste(italic('Drosophila'))),col='lightgoldenrod3')
text(23,8,substitute(paste(italic('melanogaster'))),col='lightgoldenrod3')
text(45,9,substitute(paste(italic('Drosophila'))),col='blue')
text(45,8,substitute(paste(italic('simulans'))),col='blue')


############################################
## Plot distributions of data - boxplots
############################################

boxplot(flight_data$Landing_height_cm~flight_data$Sex,xlab='Sex',ylab='Landing Height / cm')


############################################
## F-test
############################################
#Used to test whether the variance of two sample populations are not significantly different from each other. Oftentimes, this is used as prerequisite for the t-test to test the assumption of equal variances. However, it can be a standalone test too if you are interested in measuring the variance rather than the mean.

var.test(flight_data$Landing_height_cm~flight_data$Sex)


############################################
## t-test
############################################
#Used to test whether the mean flight peformance of two sample populations are not significantly different from each other. 
# Use this test if the two distributions you want to compare appear to be normal (i.e., Gaussian) distributions and have equal variances based on the F test. 

t.test(flight_data$Landing_height_cm~flight_data$Sex)


############################################
## Wilcoxon tests
############################################
# Used to test whether the median value of two sample populations are not significantly different from each other. If the equal variances assumption is violated, this is one popular hypothesis test for differences between two sample populations.

wilcox.test(flight_data$Landing_height_cm~flight_data$Sex)


############################################
## Kolmogorov-Smirnoff tests
############################################
# Used to test whether the shape of two distributions are significantly different from one another. If the equal variances assumption is violated, this is another hypothesis test for differences between two sample populations.

ks.test(flight_data$Landing_height_cm~flight_data$Sex)

