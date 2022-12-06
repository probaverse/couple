#' Enframe a distributional representation
#'
#' This is the workhorse for the `enframe_` family of functions.
#' `enframe_general()` evaluates a specified distributional representation
#' for multiple distributions / copulas, and places the results in a data frame
#' or tibble.
#'
#' @param ... Copulas to evaluate
#' @param u,v Vectors of values to evaluate the copula at.
#' @param eval_fn Name of the `eval_` function for the desired distributional
#' representation, such as `eval_cdf` and `eval_density`.
#' @param fn_args A named list of arguments to pass to the `eval_fn` function,
#' besides the copula and `u`, `v` arguments (the `strict` argument
#' being the most common, and perhaps the only use case).
#' @return A data frame or tibble of the input arguments (`u`, `v`), with the
#' evaluated distributional representation for each copula in
#' `...` in its own column.
#' @details If only one copula is specified in `...`, then the evaluation
#' column will be named that of `fn_prefix`.
#'
#' If more than one copula
#' is specified in `...`, the evaluation columns will be named by the
#' prefix `fn_prefix` followed by the copula names, with `sep` in between.
#'
#' Copulas are named first by their argument names, if given, or if not,
#' the input text. Names are then made unique using `vctrs::vec_as_names()`
#' with the "unique" names repair. "Unique" is chosen instead of "universal"
#' because names are anticipated to be syntactic with the `eval_fn` prefix;
#' "minimal" is not sufficient because it may result in columns having the
#' same names.
enframe_general <- function(..., u, v, fn_prefix, sep,
                            eval_fn, fn_args = list()) {
  ellipsis <- rlang::quos(...)
  ellipsis <- rlang::quos_auto_name(ellipsis)
  copulas <- lapply(ellipsis, rlang::eval_tidy)
  is_copulas <- vapply(copulas, is_copula, FUN.VALUE = logical(1L))
  if (!all(is_copulas)) {
    stop("`enframe_*()` functions only accept copulas. ",
         "Entries that are not copulas: ",
         paste(which(!is_copulas), collapse = ", "))
  }
  n <- length(copulas)
  if (n == 0L) {
    stop("Need at least one copula in the `enframe_*()` function.")
  }
  f <- list()
  for (i in seq_len(n)) {
    f[[i]] <- rlang::exec(
      eval_fn, copula = copulas[[i]], u = u, v = v, !!!fn_args
    )
  }
  if (n == 1L) {
    eval_col_names <- fn_prefix
  } else {
    ellipsis_names <- rlang::names2(ellipsis)
    dist_names <- vctrs::vec_as_names(ellipsis_names, repair = "unique")
    eval_col_names <- paste0(fn_prefix, sep, dist_names)
  }
  names(f) <- eval_col_names
  arg <- list(u = u, v = v)
  res <- as.data.frame(c(arg, f))
  convert_dataframe_to_tibble(res)
}
