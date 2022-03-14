
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `rtists`

<!-- badges: start -->
<!-- badges: end -->

The goal of `rtists` is to provide visualization tools for tissue
integrity superimposed on tractography streamlines.

## Installation

You can install the development version of rtists from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("astamm/rtists")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(rtists)
library(future)
plan(multisession)
out <- autoplotly::autoplotly(uf_left)
ℹ Displaying 2042 streamlines...
ℹ Coloring streamlines by orientation...
plan(sequential)
iframe_htmlwidget(out)
```

<iframe src="man/figures/README-example-1.html" width="70%" height="600" scrolling="no" seamless="seamless" frameBorder="0" style="display: block; margin: auto;"></iframe>
