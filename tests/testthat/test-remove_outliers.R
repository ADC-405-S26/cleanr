test_that("IQR method removes extreme values", {
  df <- data.frame(x = c(1, 2, 3, 4, 100))
  result <- remove_outliers(df, col = "x", method = "iqr")
  expect_s3_class(result, "data.frame")
  expect_false(100 %in% result[["x"]])
})

test_that("zscore method removes extreme values", {
  df <- data.frame(x = c(rep(2, 20), 1000))
  result <- remove_outliers(df, col = "x", method = "zscore")
  expect_s3_class(result, "data.frame")
  expect_false(1000 %in% result[["x"]])
})

test_that("errors on bad inputs", {
  df <- data.frame(x = c(1, 2, 3))
  expect_error(remove_outliers(df, col = "z"))
  expect_error(remove_outliers(df, col = "x", method = "mean"))
  expect_error(remove_outliers("not a df", col = "x"))
})
