#' Joins a copula with two distributions
#'
#' Creates a joint distribution object from a copula by binding marginal distributions
#'
#' @param copula copula object
#' @param dst_x marginal distribution
#' @param dst_y marginal distribution
#' @return A list with copula, dst_x and dst_y objects with their names retained.
#' The list belongs to cop_dst class, which is a class of bi_dst, which is a class of mult_dst.
#' @examples
#' bind_marginals(cop_ig(theta = 1, alpha = 3), mtcars$hp, mtcars$disp)
#' bind_marginals(copula_object, rnorm(50, 2), rnorm(50, 15))
#'
#' @export
bind_marginals <- function(copula, dst_x, dst_y){
  bivariate_dst <- list(copula, dst_x, dst_y)
  names(bivariate_dst) <- c("copula", "dst_x", "dst_y")
  structure(bivariate_dst, class = c('cop_dst', 'bi_dst', 'mult_dst'))
}
