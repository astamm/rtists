color_by_orientation <- function(streamline) {
  streamline %>%
    dplyr::add_row(streamline[1, ], .before = 1) %>%
    dplyr::mutate(
      dplyr::across(
        .cols = c(.ux = X, .uy = Y, .uz = Z),
        .fns = ~ abs(.x - dplyr::lag(.x, default = 0))
      ),
      .sum_u = .ux + .uy + .uz,
      dplyr::across(
        .cols = c(.ux, .uy, .uz),
        .fns = ~ dplyr::if_else(.sum_u == 0, .x, .x / .sum_u)
      ),
      PointColor = grDevices::rgb(.ux, .uy, .uz)
    ) %>%
    dplyr::select(-dplyr::starts_with(".")) %>%
    dplyr::slice(-1)
}

#' @importFrom autoplotly autoplotly
#' @export
autoplotly.maf_df <- function(x, ..., color_fn = NULL) {
  if (!("PointColor" %in% names(x))) {
    if (is.null(color_fn)) {
      cli::cli_alert_info("Coloring streamlines by orientation...")
      color_fn <- color_by_orientation
    } else {
      # color_fnq <- rlang::enquo({{color_fn}})
      cli::cli_alert_info("Coloring streamlines using user-supplied function {.fn {rlang::as_name({{ color_fn }})}}...")
      color_fn <- rlang::as_function(color_fn)
    }

    x <- x %>%
      tidyr::nest(data = -StreamlineId) %>%
      dplyr::mutate(data = furrr::future_map(
        .x = data,
        .f = color_by_orientation,
        .progress = TRUE
      )) %>%
      tidyr::unnest(cols = data)
  }

  x <- x %>%
    dplyr::group_by(StreamlineId) %>%
    dplyr::arrange(PointId) %>%
    dplyr::ungroup()

  cli::cli_alert_info("\nDisplaying {length(unique(x$StreamlineId))} streamline{?s}...")

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

#' @importFrom graphics plot
#' @export
plot.maf_df <- function(x, ...) {
  print(autoplotly(x, ...))
}
