---
output:
  html_document:
    keep_md: true
---

<!-- README.md is generated from README.Rmd. Please edit that file -->



# `rtists`

<!-- badges: start -->
<!-- badges: end -->

The goal of `rtists` is to provide visualization tools for tissue integrity superimposed on tractography streamlines.

## Installation

You can install the development version of rtists from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("astamm/rtists")
```

## Example

This is a basic example which shows you how to solve a common problem:


```r
library(rtists)
library(future)
plan(multisession)
out <- autoplotly::autoplotly(uf_left)
ℹ Displaying 2042 streamlines...
ℹ Coloring streamlines by orientation...
plan(sequential)
# html_path <- knitr::fig_path("html")
# print(html_path)
# htmlwidgets::saveWidget(
#     widget = out, 
#     file = normalizePath(html_path), 
#     selfcontained = TRUE
#   )
# htmltools::tags$iframe(
#     src = html_path,
#     width = "70%",
#     height = "600",
#     scrolling = "no",
#     seamless = "seamless",
#     frameBorder = "0",
#     style = "display: block; margin: auto;"
#   )
widgetframe::frameWidget(out)
```

```{=html}
<div id="htmlwidget-970cc7c4f2374c6d8b6c" style="width:100%;height:480px;" class="widgetframe html-widget"></div>
<script type="application/json" data-for="htmlwidget-970cc7c4f2374c6d8b6c">{"x":{"url":"man/figures/README-/widgets/widget_example.html","options":{"xdomain":"*","allowfullscreen":false,"lazyload":false}},"evals":[],"jsHooks":[]}</script>
```
