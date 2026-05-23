# Remove Outliers from a Numeric Column

Removes rows where a numeric column has extreme values, using either the
IQR method or the Z-score method.

## Usage

``` r
remove_outliers(df, col, method = "iqr")
```

## Arguments

- df:

  A data frame.

- col:

  The name of the numeric column to check (as a string).

- method:

  Either "iqr" (default) or "zscore".

## Value

A data frame with outlier rows removed.

## Examples

``` r
df <- data.frame(x = c(1, 2, 3, 4, 100))
remove_outliers(df, col = "x", method = "iqr")
#>   x
#> 1 1
#> 2 2
#> 3 3
#> 4 4
remove_outliers(df, col = "x", method = "zscore")
#>     x
#> 1   1
#> 2   2
#> 3   3
#> 4   4
#> 5 100
```
