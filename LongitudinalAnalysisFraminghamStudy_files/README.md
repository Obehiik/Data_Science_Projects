# Longitudinal Analysis of Sex Differences in Cholesterol Trajectories

## Project Overview

This project investigates how sex influences changes in cholesterol levels over time, utilizing 10 years of data from the Framingham Heart Study. The findings aim to inform sex-specific approaches to cardiovascular health management.

---

## 1.1 Project Goal

Analyze cholesterol trajectories over time to uncover potential sex differences and their implications for cardiovascular health strategies.

---

## Key Findings

- Significant sex differences were observed in cholesterol progression over time.
- Females exhibit a **1.13 mg/dL greater biennial increase** in cholesterol compared to males, after controlling for:
  - Age
  - Body Mass Index (BMI)
  - Smoking status
- These findings support the need for sex-specific cardiovascular risk assessment and prevention strategies.

---

## Data Summary

- **Dataset**: 10-year Framingham Heart Study data
- **Participants**: 2,634 individuals
- **Variables**:
  - Cholesterol levels
  - Sex
  - Age
  - BMI
  - Smoking status

---

## Methods

### Statistical Models
- **Linear Mixed Effects Models**:
  - Used to account for repeated measures within individuals.
  - Implemented using the `lme4` package.
- **Generalized Estimating Equations (GEE)**:
  - Used for robustness checks and sensitivity analyses.

### Hypothesis Testing
- Comprehensive testing for sex differences in cholesterol change rates.

### Validation
- Multiple model specifications and diagnostics to ensure robustness.

---

## Tools

- **Programming Language**: R
- **Key Tools**:
  - `Quarto` for script and report generation.
  - `lme4` for mixed models.
  - `ggplot2` for data visualization.
  - `gee` for generalized estimating equations.
- **Visualization**:
  - Mean cholesterol trajectory plots stratified by sex.
  - Plots of correlated responses over time (stratified and crude)
  - Spaghetti plots

---

## Impact

This analysis provides insights into how cholesterol trajectories differ by sex and their implications for cardiovascular health. These findings contribute to advancing personalized medicine and tailoring prevention strategies.

---

## Getting Started

### Prerequisites

Ensure the following R packages are installed:

```r
install.packages(c("lme4", "gee", "ggplot2", "dplyr", "quarto"))
```

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
