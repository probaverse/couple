#' Title: bind_marginals_copula
#' purpose: Transforms the copula distribution from uniform to its scale values such as m3/s
#'
#' @param d1 - the first distribution to compare
#' @param d2 - the second distribution to compare
#' @param cop - any copula object of class "bi_cop"
#'
#' @return - cop.d which is a bivariate distribution
#' @export
#'
#' @examples -

bind_marginals_copula <- function(d1, d2, cop) {

  #cop = cop_rvine_cop_lib output
  cop_d <- list(copula = cop, marginals = list(d1, d2))
  class(cop_d) <- c("bi_cop_dst", "bi_dist")
  return(cop_d)
}