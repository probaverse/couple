#' Generate a Sample from a Copula
#'
#' Draw `n` independent observations from a copula.
#'
#' @param copula Copula
#' @param n Number of observations to generate
#' @return Vector of independent values drawn from the inputted copula
#' @note `realise()`, `realize()`, and `observe()` all do the same thing.
#' Although the language `observe()` is more common, it's only an alias here,
#' because this function name is common amongst other packages.
#' @rdname realise
#' @export
realise <- function(copula, n = 1) UseMethod("realise")

#' @export
realise.dst <- function(copula, n = 1) {
  stop("Function not yet implemented.")
  # u <- stats::runif(n)
  # return(eval_quantile(copula, at = u))
}

#' @rdname realise
#' @export
realize <- function(copula, n = 1) {
  realise(copula, n = n)
}

#' @rdname realise
#' @export
observe <- function(copula, n = 1) {
  realise(copula, n = n)
}
