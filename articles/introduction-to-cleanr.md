# Introduction to cleanr

## Why cleanr?

When you first open a real dataset, you almost always run into the same
problems: missing values, messy column names, and weird extreme numbers.
cleanr gives you three simple functions to deal with all of that
quickly.

## The Sample Dataset

cleanr comes with a built-in dataset called `messy_data` that has all
three problems so you can practice.

``` r

messy_data
#>   first_name last_name age  salary
#> 1      Alice     Smith  25 5.0e+04
#> 2        Bob      <NA>  42 6.0e+04
#> 3       <NA>     Jones  31 5.5e+04
#> 4      Diana     Brown  28 1.0e+09
#> 5        Eve     Davis  NA 5.2e+04
```

## Step 1 — Find the Missing Values

``` r

describe_na(messy_data)
#>     variable n_missing pct_missing
#> 1 first_name         1          20
#> 2  last_name         1          20
#> 3        age         1          20
#> 4     salary         0           0
```

This shows you exactly which columns have missing data and how much.

## Step 2 — Clean the Column Names

``` r

clean <- standardize_names(messy_data)
names(clean)
#> [1] "first_name" "last_name"  "age"        "salary"
```

Now all names are lowercase with underscores, so they are easy to type.

## Step 3 — Remove Outliers

The salary of one billion is clearly wrong. We can remove it using the
IQR method:

``` r

clean <- remove_outliers(messy_data, col = "salary", method = "iqr")
clean
#>   first_name last_name age salary
#> 1      Alice     Smith  25  50000
#> 2        Bob      <NA>  42  60000
#> 3       <NA>     Jones  31  55000
#> 5        Eve     Davis  NA  52000
```

## Full Workflow in One Go

``` r

result <- messy_data |>
  remove_outliers(col = "salary", method = "iqr")

describe_na(result)
#>     variable n_missing pct_missing
#> 1 first_name         1          25
#> 2  last_name         1          25
#> 3        age         1          25
#> 4     salary         0           0
```
