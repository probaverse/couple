
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
eval_density(my_copula, u = c(0.3, 0.4, 0.6), v = c(0.1, 0.9, 0.4))
#> [1] 1.0005908 1.0531806 0.9428813
eval_cdf(my_copula, u = c(0.3, 0.4, 0.6), v = c(0.1, 0.9, 0.4))
#> [1] 0.03003158 0.37861680 0.24363783
```

Or, you can enframe the results in a tibble / data frame:

    #> # A tibble: 3 × 3
    #>      .u    .v    cdf
    #>   <dbl> <dbl>  <dbl>
    #> 1   0.3   0.1 0.0300
    #> 2   0.4   0.9 0.379 
    #> 3   0.6   0.4 0.244

Randomly generate data from the copula:

``` r
realise(my_copula, n = 5)
#> # A tibble: 5 × 2
#>        u     v
#>    <dbl> <dbl>
#> 1 0.0568 0.320
#> 2 0.771  0.727
#> 3 0.0898 0.232
#> 4 0.251  0.599
#> 5 0.789  0.590
```
