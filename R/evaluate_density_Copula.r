#' eval_density
#'
#' @param dist the distribution of a copula, bivariate or multivariate distribution
#' @param x the x variable distribution
#' @param y the y variable distribution
#'
#' @return The probabilities of occurence for two points on a copula distribution
#' @export
#'
#' @examples - 
eval_bi_density <- function(dist, x, y) {
  cop <- dst[[1]]
  dst_x <- dst[[2]]
  dst_y <- dst[[3]]
  u <- eval_cdf(dst_x, at = x)
  v <- eval_cdf(dst_y, at = y)
  fx <- eval_density(dst_x, at = x)
  fy <- eval_density(dst_y, at = y)
  return(eval_density(cop, u, v) * fx * fy)
}