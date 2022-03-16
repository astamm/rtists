test_that("S3 method autoplotly for `maf_df` objects works", {
  expect_snapshot(autoplotly::autoplotly(uf_left))
})

test_that("Passing a user-defined point coloring function works", {
  color_by_orientation <- function(streamline) {
    streamline %>%
      dplyr::mutate(
        dplyr::across(
          .cols = c(.ux = .data$X, .uy = .data$Y, .uz = .data$Z),
          .fns = ~ {
            d <- abs(.x - dplyr::lag(.x))
            dplyr::if_else(is.na(d), 0, d)
          }
        ),
        .sum_u = .data$.ux + .data$.uy + .data$.uz,
        dplyr::across(
          .cols = c(.data$.ux, .data$.uy, .data$.uz),
          .fns = ~ dplyr::if_else(.data$.sum_u == 0, .x, .x / .data$.sum_u)
        ),
        PointColor = grDevices::rgb(.data$.ux, .data$.uy, .data$.uz)
      ) %>%
      dplyr::select(-dplyr::starts_with("."))
  }
  expect_snapshot(autoplotly::autoplotly(uf_left, color_fn = color_by_orientation))
})

test_that("S3 method plot for `maf_df` objects works", {
  expect_snapshot(plot(uf_left))
})
