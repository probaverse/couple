#' @title density of the independence copula
#'
#' @description identifies the density of the independence copula,
#' 1 everywhere on the unit square, and 0 elsewhere
#'
#' @param u A numeric vector
#'
#' @param v A numeric vector
#' @return A numeric vector
#' @examples
#' dindep(c(1, 0.3, 5, 0.8), c(0.5, 0.7, 3, 8))
#' dindep(c(0.2, 0.3), c(4))
#'
#' @export

dindep <- function(u, v) {
  if ((length(u) == 0) | (length(v) == 0)) {
    return(numeric(0))
  }
  vectors_update <- vctrs::vec_recycle_common(u, v)
  u <- vectors_update[[1]]
  v <- vectors_update[[2]]
  density <- c(as.integer((0 <= u) & (u <= 1) & (0 <= v) & (v <= 1)))
  return(density)
}

