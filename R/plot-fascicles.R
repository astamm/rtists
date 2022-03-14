color_by_orientation <- function(streamline) {
  streamline %>%
    dplyr::mutate(
      dplyr::across(
        .cols = c(.ux = X, .uy = Y, .uz = Z),
        .fns = ~ {
          d <- abs(.x - dplyr::lag(.x))
          dplyr::if_else(is.na(d), 0, d)
        }
      ),
      .sum_u = .ux + .uy + .uz,
      dplyr::across(
        .cols = c(.ux, .uy, .uz),
        .fns = ~ dplyr::if_else(.sum_u == 0, .x, .x / .sum_u)
      ),
      PointColor = grDevices::rgb(.ux, .uy, .uz)
    ) %>%
    dplyr::select(-dplyr::starts_with("."))
}

#' Basic 3D visualisation of tractography streamlines
#'
#' @param x An object of class `maf_df`.
#' @param ... Additional parameters to be passed to
#'   \code{\link[autoplotly]{autoplotly}}.
#' @param color_fn A function or other R objects coercible into a function via
#'   \code{\link[rlang]{as_function}} that adds a column `PointColor` to the
#'   input `maf_df` object. Defaults to `NULL` which uses the internal
#'   `color_by_orientation()` function.
#'
#' @return An object of class `plotly`.
#'
#' @examples
#' autoplotly::autoplotly(uf_left)
#'
#' @importFrom autoplotly autoplotly
#' @export
autoplotly.maf_df <- function(x, ..., color_fn = NULL) {
  cli::cli_alert_info("Displaying {length(unique(x$StreamlineId))} streamline{?s}...")
  if (!("PointColor" %in% names(x))) {
    cfq <- rlang::enquo(color_fn)
    if (rlang::quo_is_null(cfq)) {
      cli::cli_alert_info("Coloring streamlines by orientation...")
      color_fn <- color_by_orientation
    } else {
      cli::cli_alert_info("Coloring streamlines using user-supplied function {.fn {rlang::as_label(cfq)}}...")
      color_fn <- rlang::as_function(color_fn)
    }

    x <- x %>%
      tidyr::nest(data = -StreamlineId) %>%
      dplyr::mutate(data = furrr::future_map(
        .x = data,
        .f = color_fn,
        .progress = TRUE
      )) %>%
      tidyr::unnest(cols = data)
  }

  x <- x %>%
    dplyr::group_by(StreamlineId) %>%
    dplyr::arrange(PointId) %>%
    dplyr::ungroup()

  plotly::plot_ly(
    data = x,
    x = ~X, y = ~Y, z = ~Z,
    type = 'scatter3d', mode = 'lines', opacity = 0.5,
    line = list(color = ~PointColor),
    transforms = list(list(
      type = 'groupby',
      groups = ~StreamlineId
    ))
  )
}

#' @inherit autoplotly.maf_df
#' @return NULL
#'
#' @examples
#' plot(uf_left)
#'
#' @importFrom graphics plot
#' @export
plot.maf_df <- function(x, ..., color_fn = NULL) {
  print(autoplotly(x, ..., color_fn = {{ color_fn }}))
}
