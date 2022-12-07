#' @title Cdf of the independence copula
#'
#' @description Identifies the cdf of the independence copula:
#' vector_1 * vector_2 - if both vectors are located on the unit square;
#' 1 - if both vectors are larger than 1;
#' 0 - if one of the vectors is below 0;
#' vector_1 value - if vector_2 is larger than 1;
#' vector_2 value - if vector_1 is larger than 1
#'
#' @param vector_1 A numeric vector
#'
#' @param vector_2 A numeric vector
#' @return A numeric vector
#' @examples pindep(c(1, 0.2), c(0.5))
#' pindep(c(-2, 8, NA), c(3, 4, 0.1))
#' pindep(c(-2, 8), c(4, 0.1))
#'
#' @export

pindep <- function(vector_1, vector_2) {

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
  bool_vector_unit_square <- between(vector_1, 0, 1) & between(vector_2, 0, 1)
  final_vector_unit_square <- ifelse(bool_vector_unit_square == TRUE, vector_1 * vector_2, FALSE)

  bool_vector_larger_than_1 <- (vector_1 > 1) & (vector_2 > 1) & (final_vector_unit_square == FALSE)
  final_both_vectors_larger_than_1 <- ifelse(bool_vector_larger_than_1 == TRUE, 1, final_vector_unit_square)

  bool_vector_negative <- (vector_1 < 0) | (vector_2 < 0) & (final_both_vectors_larger_than_1 == FALSE)
  final_vector_negative <- ifelse(bool_vector_negative == TRUE, 0, final_both_vectors_larger_than_1)

  bool_vector_1_larger_than_1 <- (vector_1 > 1) & (final_vector_unit_square == FALSE) & (bool_vector_larger_than_1 == FALSE)
  final_vector_1_larger_than_1 <- ifelse(bool_vector_1_larger_than_1 == TRUE, vector_2, final_vector_negative)

  bool_vector_2_larger_than_1 <- (vector_2 > 1) & (final_vector_1_larger_than_1 == FALSE) & (bool_vector_larger_than_1 == FALSE)
  final_vector_2_larger_than_1 <- ifelse(bool_vector_2_larger_than_1 == TRUE, vector_1, final_vector_1_larger_than_1)

  final_vector_2_larger_than_1

}
