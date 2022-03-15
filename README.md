
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `rtists`

<!-- badges: start -->

[![R-CMD-check](https://github.com/astamm/rtists/workflows/R-CMD-check/badge.svg)](https://github.com/astamm/rtists/actions)
[![test-coverage](https://github.com/astamm/rtists/workflows/test-coverage/badge.svg)](https://github.com/astamm/rtists/actions)
[![codecov](https://codecov.io/gh/astamm/rtists/branch/master/graph/badge.svg)](https://app.codecov.io/gh/astamm/rtists)
[![pkgdown](https://github.com/astamm/rtists/workflows/pkgdown/badge.svg)](https://github.com/astamm/rtists/actions)
[![CRAN
status](https://www.r-pkg.org/badges/version/rtists)](https://CRAN.R-project.org/package=rtists)

<!-- badges: end -->

The goal of `rtists` is to provide visualization tools for tissue
integrity superimposed on tractography streamlines.

## Installation

You can install the development version of `rtists` from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("astamm/rtists")
```

## Example

The following code generates a basic 3D visualisation of the left
uncinate fasciculus:

``` r
library(rtists)
library(future)
plan(multisession)
out <- autoplotly::autoplotly(uf_left)
ℹ Displaying 2042 streamlines...
ℹ Coloring streamlines by orientation...
plan(sequential)
```

[![](man/figures/README-unnamed-chunk-2-1.png)](https://astamm.github.io/rtists/articles/rtists.html)
