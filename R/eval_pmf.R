#' Probability Mass Function
#'
#' Access a copula's probability mass function (pmf).
#'
#' @inheritParams eval_cdf
#' @param strict Only evaluate when the pmf exists? `TRUE` if so;
#' if `FALSE`, simply evaluates the probability of the specified outcomes.
#' @return The evaluated probabilities
#' in vector form (for `eval_`) and data frame
#' or tibble form (for `enframe_`).
#' @examples
#' d1 <- cop_ig(20, 4)
#' d2 <- cop_igl(1.1)
#' eval_pmf(d1, u = 0.4, v = 1:9 / 10, strict = FALSE)
#' enframe_pmf(d1, u = 0.4, v = 1:9 / 10, strict = FALSE)
#' enframe_pmf(d1, d2, u = 1:9 / 10, v = 1:9 / 10, strict = FALSE)
#' @family distributional representations
#' @rdname pmf
#' @export
eval_pmf <- function(copula, u, v, strict = TRUE) UseMethod("eval_pmf")

#' @export
eval_pmf.dst <- function(copula, u, v, strict = TRUE) {
  if (variable(copula) == "discrete") {
    stop("Cannot find the pmf for this copula.")
  }
  if (strict) {
    stop("This copula does not have a pmf. ",
         "Maybe you want to evaluate outside of strict mode?")
  } else {
    if (variable(copula) == "continuous") {
      l <- vctrs::vec_size_common(u, v)
      return(rep(0, l))
    } else {
      stop("Cannot find probabilities for this copula.")
    }
  }
}

#' @rdname pmf
#' @export
enframe_pmf <- function(..., u, v, fn_prefix = "pmf",
                        sep = "_", strict = TRUE) {
  enframe_general(..., u = u, v = v, fn_prefix = fn_prefix,
                  sep = sep, eval_fn = eval_pmf,
                  fn_args = list(strict = strict))
}
