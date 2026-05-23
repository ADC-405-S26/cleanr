# Standardize Column Names of a Data Frame

Makes all column names lowercase and replaces spaces and special
characters with underscores.

## Usage

``` r
standardize_names(df)
```

## Arguments

- df:

  A data frame with messy column names.

## Value

A data frame with clean snake_case column names.

## Examples

``` r
df <- data.frame("First Name" = 1, "Last-Name!" = 2, check.names = FALSE)
standardize_names(df)
#>   first_name last_name
#> 1          1         2
```
