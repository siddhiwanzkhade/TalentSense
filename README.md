TalentSense is my attempt to bring clarity to messy job and salary data and understand how companies hire and pay across roles and locations. — the project focuses on cleaning data and making real sense out of it.

## **Project Overview :**

TalentSense is a data-driven analytics project designed to bring clarity to messy job and salary data and uncover how companies hire and compensate talent across roles, experience levels, and locations in the United States. The project focuses on **cleaning and normalizing inconsistent salary data**, performing exploratory and statistical analysis, and delivering **insightful Tableau dashboards** backed by machine learning.

## **Key achievements :**

Improved data usability from ~24% raw records to 100% analytics-ready data by validating required fields, filtering incomplete postings, and normalizing mixed compensation formats (hourly, contract, part-time, annual) into standardized monthly salaries.

Built an end-to-end data pipeline to process 124K+ LinkedIn job postings and trained an XGBoost regression

model, achieving an R² of 0.48 for salary prediction.

Generated actionable hiring and salary insights through data visualizations using Matplotlib, Seaborn, Plotly,

and Tableau.

## Dataset Description :

**Source:** https://www.kaggle.com/datasets/arshkon/linkedin-job-postings

**Size:** ~124,000 job postings

**Key Fields:**

- company_id
- company_name
- job_id
- role_title
- skills_desc
- experience_level
- currency
- compensation_type
- pay_period
- work_type
- Location
- Datetime
- Views
- Applies
- monthly_salary_usd

**Challenge:** Salary data appeared in **mixed formats** (hourly, annual, contract-based), which requiring extensive cleaning and normalization before analysis.

## **Tech Stack**

**Programming & Data Processing**

- Python
- Pandas
- NumPy

**Exploratory Analysis & Visualization (Python)**

- Matplotlib
- Seaborn
- Plotly

**Machine Learning**

- Scikit-learn
- Random Forest Regressor
- XGBoost Regressor

**Database & BI**

- PostgreSQL
- **Tableau Desktop**

## **Quick Start :**

Clone the repository

git clone <your-repo-url>
cd TalentSense

Requirements 

## Workflow :

**ETL & Data Preparation**

- Cleaned and standardized **124K+ LinkedIn job postings**
- Handled missing values and invalid records
- Normalized hourly, annual, contract, and part-time salaries into **monthly USD**
- Validated required fields to ensure analytics- and model-ready data

**Exploratory Data Analysis (EDA)**

- Analyzed salary distributions across roles and experience levels
- Studied hiring volume by:
    - Company
    - Role
    - Experience level
    - U.S. state
- Examined relationships between **salary, role demand, and experience**

**Machine Learning**

- Built regression models to predict **normalized monthly salaries**
- Models implemented:
    - Random Forest Regressor (baseline)
    - XGBoost Regressor (final model)
- Evaluation metrics:
    - R²
    - RMSE
    - MAE

**Results:**

When the models were compared using R², RMSE, and MAE, XGBoost consistently outperformed Random Forest ,achieving **R² ≈ 0.48** with lower prediction error and more stable predictions.

Based on these results, the tuned **XGBoost** model was selected as the final model, as it provides more accurate and reliable salary predictions for this dataset.

**Data Visualization (Tableau)**

- Designed **interactive Tableau dashboards** connected to PostgreSQL
- Built KPI cards, leaderboards, and analytical charts to explore:
    - Experience-level salary vs demand
    - Top roles by hiring volume
    - State-wise role demand
    - Company hiring intensity

## Tableau Dashboards:

![Screenshot 2026-01-15 at 12.49.38 AM.png](attachment:4ceedb42-09cc-4fef-87cb-a6f70a28cab5:Screenshot_2026-01-15_at_12.49.38_AM.png)

![Screenshot 2026-01-15 at 12.50.08 AM.png](attachment:3f568a3f-9388-4164-930c-cac32158d6e7:Screenshot_2026-01-15_at_12.50.08_AM.png)

What TalentSense answers?

- *Where (in which US state) is hiring demand increasing?*
- *Which roles are paid the most?*
- *Which experience levels are most in demand?*
- *Are companies paying more for remote roles?*
- *Which jobs get more engagement (views/applies)?*

## **FUTURE ENHANCEMENTS**

- **Time-Series Analysis:** Detect hiring trends and seasonality over time.
- **Automated Real-Time ETL Pipeline:** Integrate live job-posting APIs to enable continuous data ingestion, transformation, and upsert-based loading into PostgreSQL for near real-time analytics.
- **Topic Modeling:** Identify emerging technologies and role trends from job description text.
- **Deep Learning NLP:** **NLP Models:** Apply transformer-based models such as **BERT** or **RoBERTa** to analyze job descriptions and extract skills, role requirements for deeper hiring trend analysis.
- **Multi-Source Integration:** Combine job data from multiple platforms for broader market insights.
- **Recommendation System:** Recommend roles, skills, or hiring strategies based on data-driven patterns.
- **Dockerization:** Containerize the ETL and ML workflow to enable reproducible, portable, and environment-independent execution.