#' Type of random vector represented by a copula
#'
#' Copulas will either be discrete, continuous, or mixed.
#'
#' @param copula Copula
#' @return As of now, the type of variable that it is -- one
#' of "continuous", "discrete", or "mixed".
#' @rdname variable
#' @export
variable <- function(copula) {
  attributes(copula)[["variable"]]
}
