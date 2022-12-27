test_that("density evaluates appropriately", {
  expect_equal(
    dindep(c(0.1, 0.2, 0.8, 0.9, 0.0, 0.2, 0.2, 1.0,
             -1, -1,  -1, 0.5, 0.5, 1.5, 1.5, 1.5),
           c(0.2, 0.5, 0.1, 0.9, 0.2, 0.0, 1.0, 0.2,
             -1, 0.5, 1.5, -1, 1.5, -1,  0.5, 1.5)),
    c(1, 1, 1, 1, 1, 1, 1, 1,
      0, 0, 0, 0, 0, 0, 0, 0)
  )
})

test_that("cdf evaluates appropriately", {
  # tests for vectors within unit square
  expect_equal(pindep(c(0.3, 0.2), c(0.2, 0.3)), c(0.06, 0.06))
  expect_equal(
    pindep(c(0.0, 0.2, 0.2, 1.0,
             -1, -1,  -1, 0.5, 0.5, 1.5, 1.5, 1.5),
           c(0.2, 0.0, 1.0, 0.2,
             -1, 0.5, 1.5, -1, 1.5, -1,  0.5, 1.5)),
    c(c(0.0, 0.2, 0.2, 1.0) *
        c(0.2, 0.0, 1.0, 0.2),
      0, 0, 0, 0, 0.5, 0, 0.5, 1)
  )
})

test_that("NA handling is appropriate", {
  na <- dindep(c(NA,  NaN, 0.4, 0.4, NA, NA, NaN, NaN),
               c(0.4, 0.4, NA,  NaN, NA, NaN, NA, NaN))
  expect_true(all(is.na(na)))
  expect_equal(dindep(NA, 0.4), NA_real_)
  expect_equal(dindep(NA, NA), NA_real_)
  na <- pindep(c(NA,  NaN, 0.4, 0.4, NA, NA, NaN, NaN),
               c(0.4, 0.4, NA,  NaN, NA, NaN, NA, NaN))
  expect_true(all(is.na(na)))
  expect_equal(pindep(NA, 0.4), NA_real_)
  expect_equal(pindep(NA, NA), NA_real_)
  expect_null(dindep(c(0.3, 0.4), NULL))
  expect_null(dindep(NULL, c(0.3, 0.4)))
  expect_null(pindep(c(0.3, 0.4), NULL))
  expect_null(pindep(NULL, c(0.3, 0.4)))
})

test_that("empty vector handling is appropriate", {
  expect_length(dindep(c(0.4, 0.5), numeric(0L)), 0L)
  expect_length(dindep(numeric(0L), c(0.4, 0.5)), 0L)
  expect_length(dindep(numeric(0L), numeric(0L)), 0L)
  expect_length(pindep(c(0.4, 0.5), numeric(0L)), 0L)
  expect_length(pindep(numeric(0L), c(0.4, 0.5)), 0L)
  expect_length(pindep(numeric(0L), numeric(0L)), 0L)
})


test_that("vector recycling is appropriate", {
  expect_length(dindep(1:10, 1), 10L)
  expect_length(dindep(1, 1:10), 10L)
  expect_length(pindep(1:10, 1), 10L)
  expect_length(pindep(1, 1:10), 10L)
  expect_error(pindep(c(0.3, 2), c(0.2, 0.5, 0.4)))
  expect_error(pindep(c(0.3, NA), c(0.2, 0.5, 0.4)))
  expect_error(dindep(c(0.3, 2), c(0.2, 0.5, 0.4)))
  expect_error(dindep(c(0.3, NA), c(0.2, 0.5, 0.4)))
})
