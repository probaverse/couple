#' @title Cdf of the independence copula
#'
#' @description Identifies the cdf of the independence copula:
#' u * v - if both vectors are located on the unit square;
#' 1 - if both vectors are larger than 1;
#' 0 - if one of the vectors is below 0;
#' u value - if v is larger than 1;
#' v value - if u is larger than 1
#'
#' @param u A numeric vector
#'
#' @param v A numeric vector
#' @return A numeric vector
#' @examples pindep(c(1, 0.2), c(0.5))
#' pindep(c(-2, 8, NA), c(3, 4, 0.1))
#' pindep(c(-2, 8), c(4, 0.1))
#'
#' @export

pindep <- function(u, v) {

  if ((length(u) == 0) | (length(v) == 0)) {
    return(0)
  }
  vectors_update <- vctrs::vec_recycle_common(u, v)
  u <- vectors_update[[1]]
  v <- vectors_update[[2]]

  bool_vector_unit_square <- (0 <= u) & (u <= 1) & (0 <= v) & (v <= 1)
  final_vector_unit_square <- ifelse(bool_vector_unit_square == TRUE, u * v, bool_vector_unit_square)

  bool_vector_larger_than_1 <- (u > 1) & (v > 1) & (final_vector_unit_square == FALSE)
  final_both_vectors_larger_than_1 <- ifelse(bool_vector_larger_than_1 == TRUE, 1, final_vector_unit_square)

  bool_vector_negative <- (u < 0) | (v < 0) & (final_both_vectors_larger_than_1 == FALSE)
  final_vector_negative <- ifelse(bool_vector_negative == TRUE, 0, final_both_vectors_larger_than_1)

  bool_u_larger_than_1 <- (u > 1) & (final_vector_unit_square == FALSE) & (bool_vector_larger_than_1 == FALSE)
  final_u_larger_than_1 <- ifelse(bool_u_larger_than_1 == TRUE, v, final_vector_negative)

  bool_v_larger_than_1 <- (v > 1) & (final_u_larger_than_1 == FALSE) & (bool_vector_larger_than_1 == FALSE)
  final_v_larger_than_1 <- ifelse(bool_v_larger_than_1 == TRUE, u, final_u_larger_than_1)

  final_v_larger_than_1
}
