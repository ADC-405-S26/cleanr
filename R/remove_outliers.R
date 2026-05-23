#' Remove Outliers from a Numeric Column
#'
#' Removes rows where a numeric column has extreme values, using either
#' the IQR method or the Z-score method.
#'
#' @param df A data frame.
#' @param col The name of the numeric column to check (as a string).
#' @param method Either "iqr" (default) or "zscore".
#'
#' @return A data frame with outlier rows removed.
#'
#' @examples
#' df <- data.frame(x = c(1, 2, 3, 4, 100))
#' remove_outliers(df, col = "x", method = "iqr")
#' remove_outliers(df, col = "x", method = "zscore")
#'
#' @export
remove_outliers <- function(df, col, method = "iqr") {
  checkmate::assert_data_frame(df)
  checkmate::assert_string(col)
  checkmate::assert_choice(method, c("iqr", "zscore"))

  if (!col %in% names(df)) {
    stop(paste("Column not found:", col))
  }

  x <- df[[col]]
  checkmate::assert_numeric(x)

  if (method == "iqr") {
    q1  <- stats::quantile(x, 0.25, na.rm = TRUE)
    q3  <- stats::quantile(x, 0.75, na.rm = TRUE)
    iqr <- q3 - q1
    keep <- x >= (q1 - 1.5 * iqr) & x <= (q3 + 1.5 * iqr)
  } else {
    z    <- (x - mean(x, na.rm = TRUE)) / stats::sd(x, na.rm = TRUE)
    keep <- abs(z) <= 2
  }

  df[keep, , drop = FALSE]
}
