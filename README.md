
<!-- README.md is generated from README.Rmd. Please edit that file -->

# copulary

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/copulary)](https://CRAN.R-project.org/package=copulary)
<!-- badges: end -->

copulary:

1.  make standard copula families available, like the Frank, Gumbel,
    Gaussian, and empirical copulas – and even your own copulas, and
2.  provides a framework for evaluating copulas.

## Installation

You can install the development version of copulary like so:

``` r
remotes::install_github("probaverse/copulary")
```

## Example

We can make copulas from standard families, such as this Integrated
Gamma copula:

``` r
library(copulary)
#> Loading required package: igcop
(my_copula <- cop_ig(theta = 3, alpha = 4))
#> ig paramcop cop
#> 
#>  name :
#> [1] "ig"
```

We can evaluate different distributional forms, such as the density or
cdf:

``` r
# eval_density(my_copula, u = c(0.3, 0.4, 0.6), v = c(0.1, 0.9, 0.4))
# eval_cdf(my_copula, u = c(0.3, 0.4, 0.6), v = c(0.1, 0.9, 0.4))
```

Or, you can enframe the results in a tibble / data frame:
