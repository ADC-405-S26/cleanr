# Summarize Missing Values in a Data Frame

Counts how many values are missing in each column and shows the
percentage.

## Usage

``` r
describe_na(df)
```

## Arguments

- df:

  A data frame to check for missing values.

## Value

A data frame with columns: variable, n_missing, pct_missing.

## Examples

``` r
df <- data.frame(a = c(1, NA, 3), b = c(NA, NA, "x"))
describe_na(df)
#>   variable n_missing pct_missing
#> 1        a         1       33.33
#> 2        b         2       66.67
```
