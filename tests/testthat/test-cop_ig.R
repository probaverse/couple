test_that("IG / IGL parameterization is intact", {
  expect_error(cop_ig(-3, 4))
  expect_error(cop_ig(3, -4))
  expect_error(cop_igl(-4))
})
