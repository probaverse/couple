#' Title: eval_bi_pdf_bi_cop_rvinecopulib - copula density
#'
#' @param distribution - output from Cop_rvine_cop_lib (dname, theta, rotation)
#' @param cop - the parameters for the copula that is the output of Cop_rvine_cop_lib
#' @param x - the first distribution
#' @param y - the second distribution
#'
#' @return - a list of values that is the new density distribution for a pdf
#' @export -
#'
#' @examples -
eval_bi_pdf_bi_cop_rvinecopulib <- function(distribution, x, y) {
  u <- matrix(c(x, y), ncol = 2)
  bicop <- rvinecoplib::dbicop(u,
                            family = distribution$dname,
                            rotation = distribution$rotation,
                            parameters = distribution$parameters)
  return(bicop)
}