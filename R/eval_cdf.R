#' Cumulative Distribution Function
#'
#' Access a copula's cumulative distribution function (cdf).
#'
#' @param copula,... A copula, or possibly multiple
#' copulas in the case of `...`.
#' @param u,v Vectors of values to evaluate the copula at.
#' @param arg_name For `enframe_`, name of the column containing
#' the function arguments.
#' @param fn_prefix For `enframe_`, name of the function to
#' appear in the column(s).
#' @param sep When `enframe`'ing more than one copula, the
#' character that will be separating the `fn_name` and the copula name.
#' @return The evaluated cdf in vector form (for `eval_`) and data frame
#' or tibble form (for `enframe_`).
#' @family distributional representations
#' @examples
#' d1 <- dst_unif(0, 4)
#' d2 <- dst_pois(1.1)
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
