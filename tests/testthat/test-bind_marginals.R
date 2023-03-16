test_that("bind_marginals works", {
  expect_equal(length(bind_marginals(cop_ig(theta = 1, alpha=2), distionary::dst_norm(50, 2), distionary::dst_norm(50, 4))), 3)
  expect_equal(names(bind_marginals(cop_ig(theta = 1, alpha=2), distionary::dst_norm(50, 2), distionary::dst_norm(50, 4))), c("copula", "dst_x", "dst_y"))
  expect_equal(class(bind_marginals(cop_ig(theta = 1, alpha=2), distionary::dst_norm(50, 2), distionary::dst_norm(50, 4))), c("cop_dst", "bi_dst", "multi_dst"))
})
