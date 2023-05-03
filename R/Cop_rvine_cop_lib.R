#' Title:Cop_rvine_cop_lib
#' Purpose: Creates a class object to store the copula parameters
#'
#' @param dist - The family name of the copula being used
#' @param theta -The theta parameter to scale the copula
#' @param rotation - the rotation of the copula
#'
#' @return res - a class object for the copula which is a list holding the parameters of the copula
#' @export
#'
#' @examples -

cop_rvine_cop_lib <- function(dist, rotation, parameters) {
  res <- list(dname = dist, rotation = rotation, parameters = parameters )
  class(res) <- c("bicop_rvinecopulib", "bi_cop")
  #Return list which is the Dist Name, theta, and rotation
  return(res)
}
