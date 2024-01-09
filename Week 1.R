# Set corret working directory
setwd("/Users/pengjunning/Desktop/Teaching/IB9MH Analytics for Behavioural Research/IB9MH")

#import data 
library(readr)
rawdata <- read_csv("fake_pension_and_debt.csv")
View(rawdata)

# load pacakges 
library(tidyverse)
library(ggplot2)
library(esquisse)
library(sjPlot)
library(afex)

# Draw some plots 
esquisse::esquisser(rawdata)

# Treating months enrolled as continuous variable
tab_model(
  summary(
    lm(debt ~ months.enrolled + age + sex, data = rawdata)
    ), show.se = TRUE, show.stat = TRUE)

# Treating months enrolled as categorical variable
rawdata$months.enrolled <- factor(rawdata$months.enrolled, levels = c(19,21,22,24,25,27,28,29,31,32,33,34,41))
# now it has become a categorical with 13 levels 
set_default_contrasts()
tab_model(
  summary(
    lm(debt ~ months.enrolled + age + sex, data = rawdata)
  ), show.se = TRUE, show.stat = TRUE)




