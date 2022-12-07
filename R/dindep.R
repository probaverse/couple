#' density of the independence copula
#'
#' identifies the density of the independence copula,
#' 1 everywhere on the unit square, and 0 elsewhere
#'
#' @param vector_1 A numeric vector
#'
#' @param vector_2 A numeric vector
#' @return A numeric vector
#' @examples
#' dindep(c(1, 0.3, 5, 0.8), c(0.5, 0.7, 3, 8))
#'
#' @export

library(dplyr)
dindep <- function(vector_1, vector_2) {

  if ((length(vector_1) == 1) | (length(vector_2) == 1)) {
    vector_1 <- vctrs::vec_recycle_common(vector_1, vector_2)[[1]]
    vector_2 <- vctrs::vec_recycle_common(vector_1, vector_2)[[2]]
  }
  if ((length(vector_1) == 0) | (length(vector_2) == 0)) {
    return(0)
  }

  if (length(vector_1) != length(vector_2)) {
    stop("Unable to operate on the vectors of a different length if none of them is of length 1 ")
  }
  output_vector <- between(vector_1, 0, 1) & between(vector_2, 0, 1)
  ifelse(is.na(output_vector), NA, as.integer(output_vector))
}

