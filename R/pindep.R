#' @rdname indep_funs
#' @export
pindep <- function(u, v) {

  if ((length(u) == 0) | (length(v) == 0)) {
    return(numeric(0L))
  }
  vectors_update <- vctrs::vec_recycle_common(u, v)
  u <- vectors_update[[1]]
  v <- vectors_update[[2]]

  pmin(1, pmax(0, u)) * pmin(1, pmax(0, v))
}
