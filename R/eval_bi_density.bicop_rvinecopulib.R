#' Density of an rvinecopulib copula
#'
#' Evaluates the density of a copula from the rvinecopulib package.
#'
#' @param distribution An rvinecopulib copula, as in the output of
#' `cop_rvinecopulib()`.
#' @param x,y Vectors of values between 0 and 1 in which to evaluate the
#' copula density.
#'
#' @return A vector of copula density values.
#' @examples
#' cop <- cop_rvinecopulib("frank", rotation = 0, parameters = 2)
#' eval_bi_density(cop, c(0.2, 0.7, 0.4), 0.2)
#' @export
eval_bi_density.bicop_rvinecopulib <- function(distribution, x, y) {
  xy <- vctrs::vec_recycle_common(x, y)
  x <- xy[[1]]
  y <- xy[[2]]
  u <- matrix(c(x, y), ncol = 2)
  rvinecopulib::dbicop(u,
                       family = distribution$dname,
                       rotation = distribution$rotation,
                       parameters = distribution$parameters)
}
