test_that("dindep works", {
  expect_equal(dindep(c(0.3, 2), c(0.2, 0.5)), c(1, 0))
  expect_equal(dindep(c(NA, 2), c(0.2, 0.5)), c(NA, 0))
  expect_equal(dindep(c(0.3, 2, 0.4), c(0.2)), c(1, 0, 1))
  expect_equal(dindep(c(0.3), c()), numeric(0))
  expect_error(dindep(c(0.3, 2), c(0.2, 0.5, 0.4)))
  expect_error(dindep(c(0.3, NA), c(0.2, 0.5, 0.4)))
})
