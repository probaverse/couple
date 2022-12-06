#' Survival Function
#'
#' Access a copula's survival function.
#'
#' @inheritParams eval_cdf
#' @return The evaluated survival function
#' in vector form (for `eval_`) and data frame
#' or tibble form (for `enframe_`).
#' @examples
#' d1 <- cop_ig(20, 4)
#' d2 <- cop_igl(1.1)
#' eval_survival(d1, u = 0.4, v = 1:9 / 10)
#' enframe_survival(d1, u = 0.4, v = 1:9 / 10)
#' enframe_survival(d1, d2, u = 1:9 / 10, v = 1:9 / 10)
#' @family distributional representations
#' @rdname survival
#' @export
eval_survival <- function(copula, u, v) UseMethod("eval_survival")

#' @export
eval_survival.dst <- function(copula, u, v) {
  1 - eval_cdf(copula, u = u, v = v)
}

#' @rdname survival
#' @export
enframe_survival <- function(..., u, v, fn_prefix = "survival",
                             sep = "_") {
  enframe_general(..., u = u, v = v, fn_prefix = fn_prefix,
                  sep = sep, eval_fn = eval_survival)
}
