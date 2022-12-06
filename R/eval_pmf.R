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
#' d <- dst_empirical(1:10)
#' eval_pmf(d, at = c(1, 2, 2.5))
#' enframe_pmf(d, at = 0:4)
#' eval_pmf(dst_norm(0, 1), at = -3:3, strict = FALSE)
#' @family distributional representations
#' @rdname pmf
#' @export
eval_pmf <- function(copula, at, strict = TRUE) UseMethod("eval_pmf")

#' @export
eval_pmf.dst <- function(copula, at, strict = TRUE) {
  if (variable(copula) == "discrete") {
    stop("Cannot find the pmf for this copula.")
  }
  if (strict) {
    stop("This copula does not have a pmf. ",
         "Maybe you want to evaluate outside of strict mode?")
  } else {
    if (variable(copula) == "continuous") {
      return(rep(0, length(at)))
    } else {
      stop("Cannot find probabilities for this copula.")
    }
  }
}

#' @rdname pmf
#' @export
enframe_pmf <- function(..., at, fn_prefix = "pmf",
                        sep = "_", strict = TRUE) {
  enframe_general(..., at = at, fn_prefix = fn_prefix,
                  sep = sep, eval_fn = eval_pmf,
                  fn_args = list(strict = strict))
}
