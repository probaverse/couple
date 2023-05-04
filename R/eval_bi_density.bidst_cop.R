#' Density of a copula-based bivariate distribution
#'
#' @param distribution Bivariate distribution.
#' @param x,y Vectors of values to evaluate the distribution at.
#'
#' @return Vector of density values.
#' @examples
#' d <- bind_marginals(
#'   distionary::dst_norm(0, 1),
#'   distionary::dst_exp(1),
#'   cop_ig(2, 4)
#' )
#' eval_bi_density(d, x = -3:3, y = 1)
#' @export
eval_bi_density.bidst_cop <- function(distribution, x, y) {
  xy <- vctrs::vec_recycle_common(x, y)
  x <- xy[[1L]]
  y <- xy[[2L]]
  d1 <- distribution$marginals$d1
  d2 <- distribution$marginals$d2
  copula <- distribution$copula
  f1 <- distionary::eval_density(d1, at = x)
  f2 <- distionary::eval_density(d2, at = y)
  F1 <- distionary::eval_cdf(d1, at = x)
  F2 <- distionary::eval_cdf(d2, at = y)
  copula_density <- distionary::eval_bi_density(copula, F1, F2)
  (f1 * f2) * copula_density
}
