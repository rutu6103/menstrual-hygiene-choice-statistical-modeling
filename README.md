# Menstrual Hygiene Choice: Statistical Modeling

Exploratory statistical analysis of menstrual-hygiene awareness, product
preferences, and switching behavior using privacy-safe survey data in R.

## Project Overview

This project investigates how educational, behavioral, cultural, and
product-related factors are associated with menstrual-hygiene awareness
and product-choice behavior.

The analysis is based on a survey of **146 respondents**. The original
academic research was restructured into a reproducible portfolio project
with privacy-safe data, exploratory analysis, statistical inference,
model diagnostics, and clearly documented limitations.

## Research Questions

1.  How does menstrual-hygiene awareness vary across respondents, and is
    formal menstrual education associated with awareness?
2.  Which product attributes are most important to respondents?
3.  What behaviors are associated with having changed menstrual-hygiene
    products?
4.  Which factors are associated with future product-switching
    intention?

## Dataset and Privacy

The analysis-ready dataset contains **146 observations and 36 analytical
variables**.

The original questionnaire dataset is **not included** in this
repository. Direct or unnecessarily identifying fields were removed from
the public analytical dataset. The repository uses only the privacy-safe
processed dataset required to reproduce the published analyses.

Data-quality checks found:

-   146 rows
-   36 analytical variables
-   0 duplicate rows
-   0 duplicate respondent IDs
-   1 missing value in `primary_product`

> **Important:** This is a convenience sample concentrated among younger
> and student respondents. Results describe associations within this
> sample and should not be interpreted as population estimates or causal
> effects.

## Analysis Workflow

The project is organized as a reproducible four-stage workflow:

1.  **Data cleaning and validation**
    -   schema and type checks
    -   missing-value assessment
    -   duplicate checks
    -   factor preparation
2.  **Exploratory analysis**
    -   respondent profile
    -   current product usage
    -   product-attribute importance
    -   switching behavior
    -   cultural and social context
3.  **Awareness analysis**
    -   awareness-score distribution
    -   formal-education group comparison
    -   Kruskal-Wallis test
    -   parsimonious logistic regression
    -   model diagnostics
4.  **Behavioral modeling**
    -   logistic regression for past product change
    -   ordinal logistic regression for future switching intention
    -   odds-ratio interpretation
    -   stability and diagnostic checks

## Key Findings

### 1. Awareness and formal menstrual education

The mean awareness score was approximately **0.73 on a 0-1 scale**.

Awareness categories:

  Category     Respondents
  ---------- -------------
  High                  81
  Moderate              39
  Low                   26

Awareness differed significantly across formal menstrual-education
groups using a Kruskal-Wallis test (**p = 0.008**).

In the final exploratory logistic model, respondents reporting formal
menstrual education had approximately **3.48 times the estimated odds of
high awareness** compared with respondents reporting no formal
education, conditional on region type (**95% CI: 1.56-8.02; p =
0.0027**).

![Distribution of awareness
score](figures/awareness_score_distribution.png)

### 2. Product attributes

The highest-rated product attributes were:

  Attribute              Mean rating (1-5)
  -------------------- -------------------
  Quality                             4.64
  Affordability                       4.62
  Comfort                             4.52
  Leakage Protection                  4.48
  Health Risk                         4.38

These rankings indicate that product quality, affordability, and comfort
were especially important within this sample.

![Average importance rating by product
attribute](figures/product_attribute_importance.png)

### 3. Current product usage

Among valid and applicable responses, **sanitary pads dominated current
primary-product usage**. Because product choice was highly imbalanced,
current product type was not treated as a suitable target for a
conventional predictive classification model.

![Current primary menstrual-hygiene
product](figures/product_usage_distribution.png)

### 4. Past product-changing behavior

Only **27 respondents (18.5%)** reported changing their
menstrual-hygiene product during the previous five years.

In the exploratory logistic model, use of alternative products was
associated with greater odds of having changed products:

-   respondents who **sometimes** used alternatives: OR ≈ **3.39**
-   respondents who **used** alternatives: OR ≈ **7.76**

These are sample associations rather than causal effects.

### 5. Future switching intention

Future switching intention was more balanced:

  Intention     Respondents   Share
  ----------- ------------- -------
  Maybe                  84   57.5%
  No                     33   22.6%
  Yes                    29   19.9%

A parsimonious ordinal logistic model was used after removing sparse
categorical predictors that produced unstable estimates in an earlier
specification.

In the final model, **cost importance** was positively associated with
higher switching intention (**OR ≈ 1.42; 95% CI: 1.03-1.94; p ≈
0.031**). Other included predictors were not statistically significant
at the 5% level.

## Why the Modeling Strategy Is Conservative

The goal of this project is not to force complex machine learning onto a
small survey dataset.

Several design decisions were made deliberately:

-   current product choice was not used as a headline classifier because
    sanitary-pad usage overwhelmingly dominated the outcome;
-   models were simplified when sparse categories created separation or
    unstable estimates;
-   statistical associations are reported with uncertainty rather than
    presented as causal effects;
-   model diagnostics and stability checks are retained in `results/`;
-   limitations of the sample are stated explicitly.

This makes the analysis more defensible and reproducible than optimizing
for an artificially impressive prediction metric.

## Repository Structure

``` text
menstrual-hygiene-choice-statistical-modeling/
├── README.md
├── LICENSE
├── .gitignore
├── install_packages.R
├── renv.lock
├── R/
│   └── helpers.R
├── analysis/
│   ├── 01_data_cleaning.Rmd
│   ├── 02_exploratory_analysis.Rmd
│   ├── 03_awareness_analysis.Rmd
│   └── 04_behavioral_modeling.Rmd
├── data/
│   ├── README.md
│   └── processed/
│       └── anonymized_survey_data.csv
├── figures/
│   ├── awareness_score_distribution.png
│   ├── product_usage_distribution.png
│   └── product_attribute_importance.png
└── results/
    └── generated CSV summaries and model diagnostics
```

## Reproducing the Analysis

### 1. Clone the repository

``` bash
git clone https://github.com/rutu6103/menstrual-hygiene-choice-statistical-modeling.git
cd menstrual-hygiene-choice-statistical-modeling
```

### 2. Install required R packages

Open the project in RStudio and run:

``` r
source("install_packages.R")
```

### 3. Run the analysis in order

Run or knit:

``` text
analysis/01_data_cleaning.Rmd
analysis/02_exploratory_analysis.Rmd
analysis/03_awareness_analysis.Rmd
analysis/04_behavioral_modeling.Rmd
```

The scripts regenerate the analytical outputs in `results/` and
visualizations in `figures/`.

## Tools and Methods

**Language:** R

**Data manipulation & visualization:** `dplyr`, `tidyr`, `readr`,
`ggplot2`, `forcats`

**Statistical methods:**

-   descriptive statistics
-   non-parametric group comparison
-   binary logistic regression
-   ordinal logistic regression
-   odds ratios and confidence intervals
-   model diagnostics and stability assessment

**Other skills demonstrated:**

-   survey-data preparation
-   privacy-aware data publishing
-   reproducible analytical workflows
-   statistical interpretation
-   class-imbalance awareness
-   model-specification refinement
-   Git-based project organization

## Limitations

-   The dataset contains only 146 respondents.
-   The sample is a convenience sample and is concentrated among
    younger, student, and urban respondents.
-   Current product choice is highly imbalanced.
-   Regression results are exploratory associations, not causal
    estimates.
-   The ordinal switching model assumes proportional odds; a formal
    proportional-odds assessment would be required before using the
    model for publication or production decision-making.
-   Self-reported survey responses may be affected by recall or response
    bias.

## Author

**Rutuja Kadam**

MSc Statistics \| Data Analyst \| Data Science & Statistical Modeling

This repository is a portfolio restructuring of an academic research
project. The analysis has been reorganized for reproducibility, privacy,
clearer statistical interpretation, and transparent model diagnostics.
