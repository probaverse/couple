#' Joins a copula with two distributions
#'
#' Creates a joint distribution object from a copula by binding marginal distributions
#'
#' @param copula copula object
#' @param dst_x marginal distribution
#' @param dst_y marginal distribution
#' @return A list with copula, dst_x and dst_y objects with their names retained.
#' The list belongs to cop_dst class, which is a class of bi_dst, which is a class of multi_dst.
#' @examples
#' bind_marginals(cop_ig(theta = 1, alpha = 3), mtcars$hp, mtcars$disp)
#' bind_marginals(cop_ig(theta = 1, alpha=2), distionary::dst_norm(50, 2), distionary::dst_norm(50, 15))
#'
#' @export
bind_marginals <- function(copula, dst_x, dst_y){
  bivariate_dst <- list(copula = copula, dst_x = dst_x, dst_y = dst_y)
  structure(bivariate_dst, class = c('cop_dst', 'bi_dst', 'multi_dst'))
}
