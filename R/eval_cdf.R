#' Cumulative Distribution Function
#'
#' Access a copula's cumulative distribution function (cdf).
#'
#' @param copula,... A copula, or possibly multiple
#' copulas in the case of `...`.
#' @param u,v Vectors of values to evaluate the copula at.
#' @inheritParams enframe_general
#' @return The evaluated cdf in vector form (for `eval_`) and data frame
#' or tibble form (for `enframe_`).
#' @family distributional representations
#' @examples
#' d1 <- cop_ig(20, 4)
#' d2 <- cop_igl(1.1)
#' eval_cdf(d1, u = 0.4, v = 1:9 / 10)
#' enframe_cdf(d1, u = 0.4, v = 1:9 / 10)
#' enframe_cdf(d1, d2, u = 1:9 / 10, v = 1:9 / 10)
#' @rdname cdf
#' @export
eval_cdf <- function(copula, u, v) UseMethod("eval_cdf")

#' @export
eval_cdf.dst <- function(copula, u, v) {
  stop("Can't find a cdf for this copula.")
}

#' @rdname cdf
#' @export
enframe_cdf <- function(..., u, v, fn_prefix = "cdf",
                        sep = "_") {
  enframe_general(..., u = u, v = v, fn_prefix = fn_prefix,
                  sep = sep, eval_fn = eval_cdf)
}
