#' Define a floating grid coordinate reference system for a new grid
#'
#' #' This function defines a new floating grid coordinate reference system in the
#' Oblique Mercator projection for a new floating grid
#' based on the coordinates for a primary datum.
#'
#' This function requires the latitude and longitude coordinates
#' (in WGS84 decimal degrees) of the
#' primary datum for a new floating grid.
#'
#' @param pt_0_geo A numeric vector of the geographic coordinates
#' (`c(longitude, latitude)`) of the primary datum,
#' in WGS84 decimal degrees
#' @param pt_0_grid A numeric vector of the geographic coordinates
#' (`c(easting, northing)`) of the primary datum,
#' in local coordinates (defaults to `c(0,0)`)
#' @param geo_crs The coordinate reference system of the geographic coordinates,
#' defined using any method used by `[sf::st_crs()]`
#' #' @param name An optional name for the floating grid coordinate
#' reference system
#'
#' @return Object of class `crs`, which is a list with elements `input`
#' (length-1 character) and `wkt` (length-1 character).
#'
#' @export
#'
#' @examples
#' define_new_grid(
#'   pt_0_geo = c(-108.51, 37.385),
#'   pt_0_grid = c(500, 500),
#'   name = "Great New Grid"
#' )
#'
#' # Or define from a different coordinate reference system:
#' define_new_grid(
#'   pt_0_geo = c(720446.8, 4140492.5),
#'   pt_0_grid = c(500, 500),
#'   geo_crs = 6341,
#'   name = "Great New Grid"
#' )
define_new_grid <-
  function(pt_0_geo,
           pt_0_grid = c(0, 0),
           geo_crs = 4326,
           name = NULL) {
    pt_0_geo %<>%
      as_wgs84(crs = geo_crs)

    out_proj <-
      list(
        proj = "omerc",
        lat_0 = pt_0_geo[[2]],
        lonc = pt_0_geo[[1]],
        alpha = 0,
        gamma = 0,
        k_0 = 1,
        x_0 = pt_0_grid[[1]],
        y_0 = pt_0_grid[[2]]
      ) %>%
      as_proj() %>%
      sf::st_crs()

    if (!is.null(name)) {
      out_proj$wkt <-
        stringr::str_replace_all(out_proj$wkt,
          pattern = "unknown",
          replacement = name
        )
    }

    out_proj
  }
