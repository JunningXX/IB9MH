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

# Draw some plots 
esquisse::esquisser(rawdata)

tab_model(
  summary(
    lm(debt ~ months.enrolled + age + sex, data = rawdata)
    ), show.se = TRUE, show.stat = TRUE)



