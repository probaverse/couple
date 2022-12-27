#' Convert a data frame to a tibble
#'
#' If the tibble package is installed, convert a data frame to a tibble.
#'
#' @param df Data frame to possibly convert to a tibble.
#' @return If the user has the tibble package installed, returns the inputted
#' data frame converted to a tibble. Otherwise, returns the input.
convert_dataframe_to_tibble <- function(df) {
  if (rlang::is_installed("tibble")) {
    df <- tibble::as_tibble(df)
  }
  df
}
