#' Define a floating grid coordinate reference system for a legacy grid
#'
#' This function defines a floating grid coordinate reference system in the
#' Oblique Mercator projection for a legacy (existing) floating grid
#' based on the coordinates for a primary datum and a secondary point.
#'
#' This function requires the latitude and longitude coordinates
#' (in WGS84 decimal degrees) of the
#' primary datum and a secondary point.
#'
#' @param pt_0_geo A numeric vector of the geographic coordinates
#' (`c(longitude, latitude)`) of the primary datum,
#' in WGS84 decimal degrees
#' @param pt_0_grid A numeric vector of the geographic coordinates
#' (`c(easting, northing)`) of the primary datum,
#' in local coordinates (defaults to `c(0,0)`)
#' @param pt_1_geo A numeric vector of the geographic coordinates
#' (`c(longitude, latitude)`) of the secondary point,
#' in WGS84 decimal degrees
#' @param pt_1_grid A numeric vector of the geographic coordinates
#' (`c(easting, northing)`) of the secondary point,
#' in local coordinates
#' @param name An optional name for the floating grid coordinate
#' reference system
#'
#' @return Object of class `crs`, which is a list with elements `input`
#' (length-1 character) and `wkt` (length-1 character).
#'
#' @export
#'
#' @examples
#' define_legacy_grid(
#'   pt_0_geo = c(-108.51, 37.385),
#'   pt_0_grid = c(500, 500),
#'   pt_1_geo = c(-108.511, 37.384),
#'   pt_1_grid = c(360, 380),
#'   name = "Screwy Legacy Grid"
#' )
define_legacy_grid <-
  function(pt_0_geo,
           pt_0_grid = c(0, 0),
           pt_1_geo,
           pt_1_grid,
           name = NULL) {
    datums <-
      tibble::tibble(
        `Float Easting` = c(
          pt_0_grid[[1]],
          pt_1_grid[[1]]
        ),
        `Float Northing` = c(
          pt_0_grid[[2]],
          pt_1_grid[[2]]
        ),
        `GEO Easting` = c(
          pt_0_geo[[1]],
          pt_1_geo[[1]]
        ),
        `GEO Northing` = c(
          pt_0_geo[[2]],
          pt_1_geo[[2]]
        )
      ) %>%
      sf::st_as_sf(
        coords = c(
          "GEO Easting",
          "GEO Northing"
        ),
        remove = FALSE,
        crs = 4326
      )

    datums_omerc <-
      define_new_grid(
        pt_0_geo = pt_0_geo,
        pt_0_grid = pt_0_grid
      )

    floating_rotation <-
      datums %>%
      sf::st_transform(datums_omerc) %>%
      dplyr::mutate(
        `OMERC Easting` =
          sf::st_coordinates(geometry)[, "X"],
        `OMERC Northing` =
          sf::st_coordinates(geometry)[, "Y"]
      ) %$%
      {
        (180 / pi) *
          (
            do.call(
              atan2,
              list(
                diff(`Float Northing`[c(1, 2)]),
                diff(`Float Easting`[c(1, 2)])
              )
            ) -
              do.call(
                atan2,
                list(
                  diff(`OMERC Northing`[c(1, 2)]),
                  diff(`OMERC Easting`[c(1, 2)])
                )
              )
          )
      } %>%
      as.numeric()

    ## Scaling correction
    floating_scaler <-
      datums %>%
      sf::st_transform(datums_omerc) %>%
      dplyr::mutate(
        `OMERC Easting` =
          sf::st_coordinates(geometry)[, "X"],
        `OMERC Northing` =
          sf::st_coordinates(geometry)[, "Y"]
      ) %$%
      {
        sqrt((diff(`Float Northing`[c(1, 2)])^2) +
          (diff(`Float Easting`[c(1, 2)])^2)) /
          sqrt((diff(`OMERC Northing`[c(1, 2)])^2) +
            (diff(`OMERC Easting`[c(1, 2)])^2))
      } %>%
      as.numeric()

    out_proj <-
      list(
        proj = "omerc",
        lat_0 = pt_0_geo[[2]],
        lonc = pt_0_geo[[1]],
        alpha = floating_rotation,
        gamma = 0,
        k_0 = floating_scaler,
        x_0 = pt_0_grid[[1]],
        y_0 = pt_0_grid[[2]]
      ) %>%
      as_proj() %>%
      sf::st_crs()

    if (!is.null(name)) {
      out_proj$wkt %<>%
        stringr::str_replace_all(
          pattern = "unknown",
          replacement = name
        )
    }

    out_proj
  }
