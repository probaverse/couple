#' Constructor Function for "cop" Objects
#'
#' @param l List containing the components of a copula object.
#' @param variable Type of random vector: `"continuous"`, `"discrete"`,
#'   `"mixed"`, or `"unknown"`.
#' @param ... Attributes to add to the list.
#' @param class If making a subclass, specify its name here.
#' @export
new_copula <- function(l, variable, ..., class = character()) {
  structure(
    l,
    variable = variable,
    class    = c(class, "cop")
  )
}


#' Copula Objects
#' @param object Object to be tested
#' @rdname copula
#' @export
is_copula <- function(object) inherits(object, "cop")

#' @rdname copula
#' @export
is.copula <- function(object) inherits(object, "cop")

#' Make a blank copula
#'
#' Currently, this function makes a copula object with nothing in it. The
#' idea is that you can then set things downstream, with functions such as
#' set_cdf() and set_mean(). The idea behind this function is expected to be in
#' flux.
#'
#' @param variable Type of random vector: `"continuous"`, `"discrete"`,
#'   `"mixed"`, or `"unknown"`.
#' @return A copula object with nothing in it.
#' @export
copula <- function(variable = c("unknown", "continuous", "discrete", "mixed")) {
  variable <- match.arg(variable)
  new_copula(list(), variable = variable)
}
