#' Create a copula from the rvinecopulib package
#'
#' @param dist The family name of the copula.
#' @param parameters A vector of parameters anticipated by rvinecopulib.
#' @param rotation The rotation of the copula; 0, 90, 180, or 270.
#'
#' @return A copula object of class `"cop_rvinecopulib"`.
#' @export
#' @examples
#' cop_rvinecopulib("frank", rotation = 0, parameters = 3)
cop_rvinecopulib <- function(dist, rotation, parameters) {
  res <- list(dname = dist, rotation = rotation, parameters = parameters )
  class(res) <- c("bicop_rvinecopulib", "bicop")
  #Return list which is the Dist Name, theta, and rotation
  return(res)
}
