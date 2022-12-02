#' Convert p/d Representations to a Copula
#'
#' When a copula has `p` and `d` functions available (such as
#' `pfrk()`, `dfrk()`), `cop_parametric()` creates a copula
#' that draws on these functions.
#'
#' @param .name Name of the copula. Specifically, a string with
#' the suffix of the `p` and `d` functions (such as `"frk"`).
#' @param ... Parameters, each its own argument.
#' @param .variable Type of random variable represented by the distribution;
#' one of `"continuous"`, `"discrete"`, `"mixed"`, or `"unknown"`.
#' Warning: defaults to `"unknown"`, where density and pmf cannot be evaluated.
#' @param .env Environment beginning the search path when looking for the
#' representation, or the name of an environment (or any object that
#' can be coerced to an environment with `as.environment()`.) Defaults to
#' the calling environment.
#' @note This function is anticipating the `p` and `d` copula functions
#' to have its parameters input as a single vector, either named `cpar`,
#' or as the third function argument.
#' @return A bivariate copula object of class `"paramcop"`.
#' @examples
#' # Not working yet:
#' # d <- cop_parametric("frk", .variable = "continuous")
#' # eval_density(d, at = -3:3)
#' # eval_pmf(d, at = -3:3, strict = FALSE)
#' # eval_hazard(d, at = -3:3)
#' @export
cop_parametric <- function(
    .name, ..., .variable = c("unknown", "continuous", "discrete", "mixed"),
    .env = parent.frame()) {
  v <- match.arg(.variable)
  dots <- rlang::enquos(...)
  params <- lapply(dots, rlang::eval_tidy)
  res <- list(name = .name,
              env = as.environment(.env),
              parameters = params)
  new_copula(res, variable = v, class = c(.name, "paramcop"))
}
