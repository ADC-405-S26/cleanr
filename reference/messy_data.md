# Messy Sample Dataset

A small intentionally messy data frame used to demonstrate the functions
in the cleanr package. It contains missing values, extreme outliers in
age (years) and salary (USD), making it ideal for practicing data
cleaning.

## Usage

``` r
messy_data
```

## Format

A data frame with 5 rows and 4 columns:

- first_name:

  Character. First name of the person. Contains one NA.

- last_name:

  Character. Last name of the person. Contains one NA.

- age:

  Numeric. Age in years. Contains one extreme outlier (300) and one NA.

- salary:

  Numeric. Annual salary in USD. Contains one extreme outlier
  (1,000,000,000).

## Source

Simulated data created for the cleanr package.
