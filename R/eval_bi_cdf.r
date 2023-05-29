#' eval_bi_cdf
#'
#' @param Dist - output from the cop_rvinecopulib. It has the distribution / family name, rotation, and parameters
#' @param Marginals - output from the bind_marginals function
#' @param var_types a length 2 vector; e.g., c("c", "c") for both continuous (default), or c("c", "d") for first variable continuous and second discrete.
#' @param x - the at X value for the first marginal distribution
#' @param y - the at Y value for the second marginal distribution
#'
#' @return - the evaluation of the copula cdf, it returns a single integer value representing the probability of occurence at x and y
#'
#' @examples test<- eval_bi_cdf(Dist, Marginals, var_types, x, y)

eval_bi_cdf <- function(Dist, Marginals, var_types, x, y) {
  UseMethod("eval_bi_cdf")
  F1 <- distionary::eval_cdf(Marginals[2][1], at = x)
  F2 <- distionary::eval_cdf(Marginals[2][2], at = y)
  combined <- c(F1, F2)
  marginal_matrix <- matrix(combined, nrow = 2)
  copula <- rvinecopulib::pbicop(family = Dist[1],
                                 u = marginal_matrix,
                                 rotation = Dist[2],
                                 parameters = Dist[3],
                                 var_types = var_types)
                                 
  class(copula) <- c("bicop_rvinecopulib", "bicop")

  return(copula)
}
