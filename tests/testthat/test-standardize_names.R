test_that("names become lowercase", {
  df <- data.frame(NAME = 1, Age = 2)
  result <- standardize_names(df)
  expect_equal(names(result), c("name", "age"))
})

test_that("spaces and symbols become underscores", {
  df <- data.frame("First Name" = 1, "Last-Name!" = 2, check.names = FALSE)
  result <- standardize_names(df)
  expect_equal(names(result), c("first_name", "last_name"))
})

test_that("errors when input is not a data frame", {
  expect_error(standardize_names(42))
  expect_error(standardize_names("hello"))
})
