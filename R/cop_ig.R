#' Integrated Gamma Copula
#'
#' Makes a copula belonging to the Integrated Gamma (IG)
#' and IG Limit (IGL) families of copulas.
#'
#' @param theta,alpha Parameters; positive numeric.
#'
#' @examples
#' cop_ig(0.3, 1.4)
#' cop_igl(1.4)
#'
#' @export
#' @rdname cop_ig
cop_ig <- function(theta, alpha) {
  if (theta <= 0) {
    stop("theta must be positive; received ", theta, ".")
  }
  if (is.infinite(theta)) return(cop_igl(alpha))
  if (alpha <= 0) {
    stop("alpha must be positive; received ", alpha, ".")
  }
  cop_parametric("ig", theta = theta, alpha = alpha, .variable = "continuous",
                 .env = "package:igcop")
}

#' @rdname cop_ig
#' @export
cop_igl <- function(alpha) {
  if (alpha <= 0) {
    stop("alpha must be positive; received ", alpha, ".")
  }
  cop_parametric("igl", theta = theta, alpha = alpha, .variable = "continuous",
                 .env = "package:igcop")
}
