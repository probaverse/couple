test_that("pindep works", {
  # tests for vectors within unit square
  expect_equal(pindep(c(0.3, 0.2), c(0.2, 0.3)), c(0.06, 0.06))

  #tests for vectors with NA values
  expect_equal(pindep(c(NA, 2), c(0.2, 0.5)), c(NA, 0.5))

  #tests for vectors larger than 1
  expect_equal(pindep(c(2), c(0.4)), c(0.4))
  expect_equal(pindep(c(0.4), c(2)), c(0.4))
  expect_equal(pindep(c(7), c(2)), c(1))

  #tests combining all the operations
  expect_equal(pindep(c(2, 1, 0.2, NA, 0.7), c(2, 0.1, 0.4, 7, 4)), c(1, 0.1, 0.08, NA, 0.7))

  expect_equal(pindep(c(0.3), c()), c(0))
  expect_error(pindep(c(0.3, 2), c(0.2, 0.5, 0.4)))
  expect_error(pindep(c(0.3, NA), c(0.2, 0.5, 0.4)))
})
