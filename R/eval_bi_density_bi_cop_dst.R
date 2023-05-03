#'Title: eval_bi_density_bi_cop_dst bivariate distribution from a copula
#'purpose : evaluate the density of the copula distribution
#'
#' @param x - the first marginal distribution
#' @param y - the second marginal distribution
#'
#' @return - density values in the form of a list
#' @export -
#'
#' @examples -

eval_bi_density_bi_dst_cop <- function(distribution, x, y) {

  d1 <- distribution$marginals$d1
  d2 <- distribution$marginals$d2
  copula <- distribution$copula

  f1 <- distionary::eval_density(d1, at = x)
  f2 <- distionary::eval_density(d2, at = y)
  F1 <- distionary::eval_cdf(d1, at = x)
  F2 <- distionary::eval_cdf(d2, at = y)
  copula_density <- distionary::eval_bi_density(copula, F1, F2)
  bi_density <- (f1 * f2) * copula_density
  return(bi_density)
}