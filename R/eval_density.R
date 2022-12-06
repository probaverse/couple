#' Probability Density Function
#'
#' Access a copula's probability density function (pdf).
#'
#' @inheritParams eval_cdf
#' @param strict Only evaluate when the density exists? `TRUE` if so;
#' if `FALSE`, evaluates the derivative of the cdf.
#' @return The evaluated density in vector form (for `eval_`) and data frame
#' or tibble form (for `enframe_`).
#' @examples
#' d1 <- cop_ig(20, 4)
#' d2 <- cop_igl(1.1)
#' eval_density(d1, u = 0.4, v = 1:9 / 10)
#' enframe_density(d1, u = 0.4, v = 1:9 / 10)
#' enframe_density(d1, d2, u = 1:9 / 10, v = 1:9 / 10)
#' @family distributional representations
#' @rdname density
#' @export
eval_density <- function(copula, u, v, strict = TRUE) {
  UseMethod("eval_density")
}


#' @export
eval_density.dst <- function(copula, u, v, strict = TRUE) {
  if (variable(copula) == "continuous") {
    stop("Cannot find this copula's density function.")
  }
  if (strict) {
    stop("This copula does not have a density function. ",
         "Maybe you want to evaluate outside of strict mode?")
  } else {
    if (variable(copula) == "discrete") {
      l <- vctrs::vec_size_common(u, v)
      return(rep(0, l))
    } else {
      stop("Cannot find the derivative of the cdf.")
    }
  }
}

#' @rdname density
#' @export
enframe_density <- function(..., u, v, fn_prefix = "density",
                            sep = "_", strict = TRUE) {
  enframe_general(..., u = u, v = v, fn_prefix = fn_prefix,
                  sep = sep, eval_fn = eval_density,
                  fn_args = list(strict = strict))
}
