
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
htmlwidgets::saveWidget(
  out, 
  file = "man/figures/README-example.html", 
  selfcontained = FALSE, 
  libdir = "widgets"
)
htmltools::tags$iframe(
  src = file.path(getwd(), "man/figures/README-example.html"), 
  scrolling = "no", 
  seamless = "seamless",
  frameBorder = "0", 
  width = "100%", 
  height = 800
)
```

<iframe src="/Users/stamm-a/Softs/rtists/man/figures/README-example.html" scrolling="no" seamless="seamless" frameBorder="0" width="100%" height="800"></iframe>
