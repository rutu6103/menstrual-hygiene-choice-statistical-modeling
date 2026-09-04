# Data notes

## Source

The study is based on 146 survey responses collected for an MSc Statistics research project on menstrual-hygiene product awareness, preferences, and behavior.

## Why the raw file is not public

The original spreadsheet contains detailed respondent-level answers and fields that could increase re-identification risk. It is intentionally excluded from GitHub.

Fields removed from the public analytical dataset include:

- institution
- state / UT
- open or free-text information-source responses
- menstrual-health status
- age at first period
- prior-product free text
- unit-count responses
- any other variables not needed for the published analysis

## Public file

`processed/anonymized_survey_data.csv`

Each row receives a synthetic ID (`R001`, `R002`, ...). These IDs do not correspond to any external identifier.

## Awareness score

Five awareness questions are scored as:

- Yes = 1.0
- No = 0.0
- Not sure = 0.5 (only applicable to the self-reported information sufficiency question)

The score is the mean of the five components and therefore ranges from 0 to 1.

Categories:

- Low: 0.00–0.40
- Moderate: >0.40–0.70
- High: >0.70–1.00

## Usage conditions

Use the public file only for reproducing the analyses in this repository. Do not attempt to re-identify respondents.
