# Heart Failure Mortality Analysis

## Project Goal:
The goal of this project is to evaluate how key comorbidities (such as diabetes, anemia, and high blood pressure) affect the mortality risk in heart failure patients. The objective is to improve risk assessment and treatment planning based on these findings.

## Key Findings & Impact:
- Analyzed survival patterns in a cohort of 299 heart failure patients with a median follow-up of 44.5 days.
- Discovered significant mortality risk factors:
  - High blood pressure increased death risk by 53% (Adjusted Hazard Ratio = 1.53, 95% CI: 1.01-2.31).
  - Age significantly impacted survival across all models.
  - Observed a 32% mortality rate (96 deaths) in the cohort.
- The results emphasize the critical importance of blood pressure management in heart failure patients, offering valuable insights for clinical decision-making.

## Methods & Tools:
- **Survival Analysis**: Utilized Kaplan-Meier and Cox Proportional Hazards models to assess the survival probabilities and identify risk factors.
- **Model Validation**: Performed proportional hazards assumption testing to ensure the validity of the Cox model.
- **Visualization**: Comprehensive survival patterns were visualized using Kaplan-Meier survival curves to illustrate the effect of key comorbidities on mortality.
- **R Programming**:
  - `survival` and `survminer` packages were used for conducting survival analysis and generating visualizations.
  - The analysis was carried out using Quarto for reproducibility and dynamic reporting.

## Files:
- `Proj_SurvAna_Comorbidities_HeartFail_Mortality.qmd`: Quarto markdown file used for survival analysis, including data processing, Kaplan-Meier curves, and Cox regression analysis.


## Results:
The analysis identified several significant comorbidities that impact mortality risk in heart failure patients:
- **High blood pressure** significantly increased the risk of mortality (Adjusted Hazard Ratio = 1.53).
- **Age** was found to be a major determinant of survival across all models, with older patients having a higher mortality risk.
- **32% of the patients in the cohort died** during the follow-up period, emphasizing the need for improved management strategies.

## Getting Started:
To run the analysis, follow these steps:
1. Clone the repository: 
   ```bash
   git clone https://github.com/your_username/Heart-Failure-Mortality-Analysis.git
   ```
2. Install the necessary R packages (if not already installed):
   ```r
   install.packages(c("survival", "survminer", "ggplot2", "quarto"))
   ```
3. Open and render the `Proj_SurvAna_Comorbidities_HeartFail_Mortality.qmd` file in your Quarto environment.

## License:
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

