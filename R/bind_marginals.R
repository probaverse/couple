#' Make a multivariate distribution through a copula
#'
#' In other words, this function transforms a copula from its uniform scale
#' to the original scale of the data, such as m3/s.
#'
#' @param d1,d2 The first and second marginal distributions to bind.
#' @param cop A copula object (has class "bicop").
#'
#' @return A bivariate probability distribution of class `"bidst_cop"`
#' @export
#' @examples
#' d1 <- distionary::dst_norm(0, 1)
#' d2 <- distionary::dst_exp(1)
#' bind_marginals(
#'   d1, d2,
#'   cop_rvinecopulib("gumbel", rotation = 0, parameters = 2)
#' )
#' bind_marginals(
#'   d1, d2,
#'   cop_ig(2, 3)
#' )
bind_marginals <- function(d1, d2, cop) {
  cop_d <- list(copula = cop, marginals = list(d1, d2))
  class(cop_d) <- c("bidst_cop", "bidst", "multidst")
  return(cop_d)
}
