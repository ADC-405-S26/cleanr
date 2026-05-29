#' Standardize Column Names of a Data Frame
#'
#' Makes all column names lowercase and replaces spaces and special characters
#' with underscores. Similar to janitor::clean_names() but lightweight with
#' no additional dependencies required.
#'
#' @param df A data frame with messy column names.
#'
#' @return A data frame with clean snake_case column names.
#'
#' @examples
#' df <- data.frame("First Name" = 1, "Last-Name!" = 2, check.names = FALSE)
#' standardize_names(df)
#'
#' @export
standardize_names <- function(df) {
  checkmate::assert_data_frame(df)

  names(df) <- tolower(names(df))
  names(df) <- gsub("[^a-z0-9]", "_", names(df))
  names(df) <- gsub("_+", "_", names(df))
  names(df) <- gsub("^_|_$", "", names(df))

  df
}
