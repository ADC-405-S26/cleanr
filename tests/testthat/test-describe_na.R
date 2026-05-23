test_that("output has the right columns", {
  df <- data.frame(a = c(1, NA), b = c("x", "y"))
  result <- describe_na(df)
  expect_named(result, c("variable", "n_missing", "pct_missing"))
})

test_that("counts NAs correctly", {
  df <- data.frame(a = c(NA, NA, 1), b = c(1, 2, 3))
  result <- describe_na(df)
  expect_equal(result$n_missing[1], 2)
  expect_equal(result$n_missing[2], 0)
})

test_that("errors when input is not a data frame", {
  expect_error(describe_na(c(1, 2, 3)))
  expect_error(describe_na("hello"))
})
