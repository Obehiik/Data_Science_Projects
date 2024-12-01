## Exploratory Data Analysis 
# Longitudinal Data
library(labelled)   # labeling data
library(rstatix)    # summary statistics
library(ggpubr)     # convenient summary statistics and plots
library(GGally)     # advanced plot
library(car)        # useful for anova/wald test
library(Epi)        # easy getting CI for model coef/pred
library(lme4)       # linear mixed-effects models
library(lmerTest)   # test for linear mixed-effects models
library(emmeans)    # marginal means
library(multcomp)   # CI for linear combinations of model coef
library(geepack)    # generalized estimating equations
library(ggeffects)  # marginal effects, adjusted predictions
library(gt)         # nice tables
library(tidyverse)  # for everything (data manipulation, visualization, coding, and more)

#load("data/dental.RData")
load(url("http://alecri.github.io/downloads/data/dental.RData"))

head(dental)

## Converting to longer format for analysis

dental_long<-dental|>pivot_longer(
  cols=starts_with("y"), names_to="measurement", values_to = "distance"
)|>mutate(
  age=parse_number(measurement),
  measurement=fct_inorder(paste("Measure at age", age))
)|>
  set_variable_labels(
    age="Age of the child at measurement",
    measurement="Label for time measurement",
    distance="Measurment"
  )
head(dental_long)

## Descriptive statistics

#1. Mean response over time
group_by(dental_long, age)|>
  get_summary_stats(distance)

#2. 
ggplot(dental_long, aes(measurement, distance, fill = measurement)) +
  geom_boxplot() +
  geom_jitter(width = 0.2) +
  guides(fill = "none") +
  labs(x = "", y = "Dental growth, mm")