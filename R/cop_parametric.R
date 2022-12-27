#' Convert p/d Representations to a Copula
#'
#' When a copula has `p` and `d` functions available (such as
#' `pfrk()`, `dfrk()`), `cop_parametric()` creates a copula
#' that draws on these functions.
#'
#' @param .name Name of the copula. Specifically, a string with
#' the suffix of the `p` and `d` functions (such as `"frk"`).
#' @param ... Parameters, each its own argument, input as name-value pairs.
#' @param .variable Type of random variable represented by the copula;
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
#' # eval_density(d, u = c(0.3, 0.6, 0.5), v = c(0.4, 0.4, 0.9))
#' # eval_pmf(d, u = c(0.3, 0.6, 0.5), v = c(0.4, 0.4, 0.9), strict = FALSE)
#' # eval_hazard(d, u = c(0.3, 0.6, 0.5), v = c(0.4, 0.4, 0.9))
#' @export
cop_parametric <- function(
    .name, ..., .variable = c("unknown", "continuous", "discrete", "mixed"),
    .env = parent.frame()) {
  v <- match.arg(.variable)
  dots <- rlang::enquos(...)
  param_names <- names(dots)
  vctrs::vec_as_names(param_names, repair = "check_unique")
  params <- lapply(dots, rlang::eval_tidy)
  res <- list(name = .name,
              env = as.environment(.env),
              parameters = params)
  new_copula(res, variable = v, class = c(.name, "paramcop"))
}

#' @export
eval_cdf.paramcop <- function(copula, u, v) {
  uv <- vctrs::vec_recycle_common(u, v)
  args <- c(uv, copula$parameters)
  function_name <- paste0("p", copula$name)
  rlang::exec(function_name, !!!args, .env = copula$env)
}

#' @export
eval_density.paramcop <- function(copula, u, v, strict = TRUE) {
  uv <- vctrs::vec_recycle_common(u, v)
  args <- c(uv, copula$parameters)
  v <- variable(copula)
  if (v == "continuous") {
    function_name <- paste0("d", copula$name)
    return(rlang::exec(function_name, !!!args, .env = copula$env))
  }
  if (strict) {
    stop("Copula is of variable type '", v, "'; density only ",
         "exists for continuous variables. Perhaps you'd like to ",
         "evaluate outside of strict mode?")
  }
  if (v == "discrete") {
    l <- vctrs::vec_size_common(u, v)
    return(rep(0, l))
  }
  stop("Evaluating non-strict density for a parametric copula is ",
       "not yet available. Check that your copula's variable type ",
       "is specified correctly.")
}

#' @export
eval_pmf.paramcop <- function(copula, u, v, strict = TRUE) {
  uv <- vctrs::vec_recycle_common(u, v)
  args <- c(uv, copula$parameters)
  v <- variable(copula)
  if (v == "discrete") {
    function_name <- paste0("d", copula$name)
    return(suppressWarnings(
      rlang::exec(function_name, !!!args, .env = copula$env)
    ))
  }
  if (strict) {
    stop("Copula is of variable type '", v, "'; pmf only ",
         "exists for discrete variables. Perhaps you'd like to ",
         "evaluate outside of strict mode?")
  }
  if (v == "continuous") {
    return(rep(0, length(uv[[1L]])))
  }
  stop("Evaluating non-strict pmf for a parametric copula is ",
       "not yet available. Check that your copula's variable type ",
       "is specified correctly.")
}


#' @export
realise.paramcop <- function(copula, n = 1) {
  function_name <- paste0("r", copula$name)
  e <- copula$env
  if (exists(function_name, envir = e)) {
    rlang::exec(
      function_name, n, !!!copula$parameters,
      .env = e
    )
  } else {
    NextMethod()
  }
}
