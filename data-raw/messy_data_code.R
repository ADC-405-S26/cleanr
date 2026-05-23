# Code used to generate the messy_data dataset

messy_data <- data.frame(
  first_name = c("Alice", "Bob", NA, "Diana", "Eve"),
  last_name  = c("Smith", NA, "Jones", "Brown", "Davis"),
  age        = c(25, 300, 31, 28, NA),
  salary     = c(50000, 60000, 55000, 1000000000, 52000)
)

usethis::use_data(messy_data, overwrite = TRUE)
