## Longitudinal Data Analysis
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
theme_set(theme_minimal() + theme(legend.position = "bottom")) # theme for ggplot


## Dental Growth study
load(url("http://alecri.github.io/downloads/data/dental.RData"))

head(dental)

# 16 boys and 11 girls 
# ages 8, 10, 12, and 14 had their distance (mm) from the center of the
# pituitary gland to the pteryomaxillary fissure measured.
# We want to investigate the change in these distances with ages,
# and how the sex of the children influences these changes.



# Exploratory Data Analysis

## Converting data to longer format

dental_long<-pivot_longer(dental, cols=starts_with("y"), names_to="measurement", values_to="distance")|>
  mutate(
    age=parse_number(measurement),
    measurement=fct_inorder(paste("Measure at age", age))
  )|>
  set_variable_labels(
    age="Age of the child at measurement",
    measurement="Label for time measurement",
    distance="Measurement"
  )
head(dental_long)


## Descriptive statistics


#1. Mean response over time
group_by(dental_long, age)|>get_summary_stats(distance)


#2. Boxplot of response by time

dental_long|>ggplot(aes(measurement, distance, fill=measurement)) + geom_boxplot()+ geom_jitter(width=0.2)+ guides(fill="none") + labs(x="", y="Dental growth, mm")

#3. Mean response over time stratified by sex
group_by(dental_long, sex, measurement)|>
  get_summary_stats(distance, show=c("mean", "sd"))


#4. Boxplot visualizations
dental_long|>ggplot(aes(sex, distance, fill=measurement)) + geom_boxplot()+ guides(fill="none") + labs(x="", y="Dental growth, mm", fill="")


#5. Bar plot
group_by(dental_long, sex, measurement) %>% 
  summarise(mean_distance = mean(distance), .groups = "drop") %>% 
  ggplot(aes(sex, mean_distance, fill = measurement, label = round(mean_distance))) +
  geom_col(position = "dodge") +
  geom_text(position = position_dodge(width = 0.9), vjust = -0.5) +
  coord_flip() +
  labs(x = "", y = "Mean Dental growth, mm", fill = "")



## Correlation of responses

#a. co-variance matrix
cov_obs<-dental|>select(starts_with("y"))|>cov()
cov_obs

#b. Correlation matrices
cov2cor(cov_obs)

ggpairs(select(dental, starts_with("y")), lower = list(continuous = "smooth"))


#c. Correlation matrixes by sex
ggpairs(dental, mapping = aes(colour = sex), columns = 3:6,
        lower = list(continuous = "smooth"))



## Trajectories over time (plot of means)

group_by(dental_long, sex, age) %>% 
  summarise(mean = list(mean_ci(distance)), .groups = "drop") %>% 
  unnest_wider(mean) %>% 
  mutate(agex = age - .05 + .05*(sex == "Boy")) %>% 
  ggplot(aes(agex, y, col = sex, shape = sex)) +
  geom_point() +
  geom_errorbar(aes(ymin = ymin, ymax = ymax), width = 0.2) +
  geom_line() +
  labs(x = "Age, years", y = "Mean Dental growth, mm", shape = "Sex", col = "Sex")

## plot of individual data over time
ggplot(dental_long, aes(age, distance, col = factor(id))) +
  geom_point() +
  geom_line() +
  facet_wrap(~ id) +
  labs(x = "Age, years", y = "Dental growth, mm", col = "Child id") +
  guides(col = guide_legend(nrow = 3))


## spagetthi plot
ggplot(dental_long, aes(age, distance, col = factor(id))) +
  geom_line() +
  labs(x = "Age, years", y = "Dental growth, mm", col = "Child id") +
  guides(col = guide_legend(nrow = 3))


## spagetthi plot by sex
ggplot(dental_long, aes(age, distance)) +
  geom_line(aes(group = factor(id))) +
  geom_smooth() +
  facet_grid(~ sex) 