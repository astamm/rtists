
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
library(widgetframe)
Le chargement a nécessité le package : htmlwidgets
plan(multisession)
out <- autoplotly::autoplotly(uf_left)
ℹ Displaying 2042 streamlines...
ℹ Coloring streamlines by orientation...
plan(sequential)
frameWidget(out)
```

<img src="man/figures/README-example-1.png" width="100%" />
