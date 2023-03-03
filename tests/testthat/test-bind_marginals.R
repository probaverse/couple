test_that("bind_marginals works", {
  expect_equal(length(bind_marginals(cop_ig(theta = 1, alpha=2), rnorm(50, 2), rnorm(50, 4))), 3)
  expect_equal(names(bind_marginals(cop_ig(theta = 1, alpha=2), rnorm(50, 2), rnorm(50, 4))[1]), "copula")
  expect_equal(names(bind_marginals(cop_ig(theta = 1, alpha=2), rnorm(50, 2), rnorm(50, 4))[2]), "dst_x")
  expect_equal(names(bind_marginals(cop_ig(theta = 1, alpha=2), rnorm(50, 2), rnorm(50, 4))[3]), "dst_y")
  expect_equal(class(bind_marginals(cop_ig(theta = 1, alpha=2), rnorm(50, 2), rnorm(50, 4)))[1], "cop_dst")
  expect_equal(class(bind_marginals(cop_ig(theta = 1, alpha=2), rnorm(50, 2), rnorm(50, 4)))[2], "bi_dst")
  expect_equal(class(bind_marginals(cop_ig(theta = 1, alpha=2), rnorm(50, 2), rnorm(50, 4)))[3], "multi_dst")
})
