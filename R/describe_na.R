#' Summarize Missing Values in a Data Frame
#'
#' Counts how many values are missing in each column and shows the percentage.
#'
#' @param df A data frame to check for missing values.
#'
#' @return A data frame with columns: variable, n_missing, pct_missing.
#'
#' @examples
#' df <- data.frame(a = c(1, NA, 3), b = c(NA, NA, "x"))
#' describe_na(df)
#'
#' @export
describe_na <- function(df) {
  checkmate::assert_data_frame(df)

  n_missing <- colSums(is.na(df))
  pct_missing <- round(n_missing / nrow(df) * 100, 2)

  data.frame(
    variable    = names(df),
    n_missing   = n_missing,
    pct_missing = pct_missing,
    row.names   = NULL
  )
}
