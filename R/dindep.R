#' The Independence Copula
#'
#' Density and cdf of the independence copula.
#'
#' @param u,v Numeric vectors.
#' @return `dindep` gives the density, and `pindep` gives the cdf, both as
#' numeric vectors.
#' @examples
#' dindep(c(1, 0.3, 5, 0.8), c(0.5, 0.7, 3, 8))
#' dindep(c(0.2, 0.3), 4)
#' pindep(c(1, 0.2), 0.5)
#' pindep(c(-2, 8, NA), c(3, 4, 0.1))
#' pindep(c(-2, 8), c(4, 0.1))
#' @rdname indep_funs
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

