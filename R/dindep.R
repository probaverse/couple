#' Density of the Independence Copula
#'
#' Evaluates the density of the independence copula,
#' 1 everywhere on the unit square, and 0 elsewhere
#'
#' @param u,v Numeric vectors.
#' @return A numeric vector.
#' @examples
#' dindep(c(1, 0.3, 5, 0.8), c(0.5, 0.7, 3, 8))
#' dindep(c(0.2, 0.3), 4)
#'
#' @export
dindep <- function(u, v) {
  if ((length(u) == 0) | (length(v) == 0)) {
    return(numeric(0))
  }
  vectors_update <- vctrs::vec_recycle_common(u, v)
  u <- vectors_update[[1]]
  v <- vectors_update[[2]]
  as.numeric((0 <= u) & (u <= 1) & (0 <= v) & (v <= 1))
}

