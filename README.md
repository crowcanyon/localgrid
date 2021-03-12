
<!-- README.md is generated from README.Rmd. Please edit that file -->

# localgrid

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![Codecov test
coverage](https://codecov.io/gh/crowcanyon/localgrid/branch/master/graph/badge.svg)](https://codecov.io/gh/crowcanyon/localgrid?branch=master)
[![R-CMD-check](https://github.com/crowcanyon/localgrid/workflows/R-CMD-check/badge.svg)](https://github.com/crowcanyon/localgrid/actions)
<!-- badges: end -->

The goal of `localgrid` is to make it easy to define coordinate
reference systems in the Oblique Mercator projection for new or existing
arbitrary floating grids.

## Installation

You can install `localgrid` from Github with:

``` r
# install.packages("remotes")
remotes::install_github("crowcanyon/localgrid")
```

## Example

``` r
library(localgrid)
#> Loading required package: magrittr

# Define a floating CRS for a new grid
define_new_grid(
  pt_0_geo = c(-108.51, 37.385),
  pt_0_grid = c(500, 500),
  name = "Great New Grid"
)
#> Coordinate Reference System:
#>   User input: +proj=omerc +lat_0=37.385 +lonc=-108.51 +alpha=0 +gamma=0 +k_0=1 +x_0=500 +y_0=500 
#>   wkt:
#> PROJCRS["Great New Grid",
#>     BASEGEOGCRS["Great New Grid",
#>         DATUM["World Geodetic System 1984",
#>             ELLIPSOID["WGS 84",6378137,298.257223563,
#>                 LENGTHUNIT["metre",1]],
#>             ID["EPSG",6326]],
#>         PRIMEM["Greenwich",0,
#>             ANGLEUNIT["degree",0.0174532925199433],
#>             ID["EPSG",8901]]],
#>     CONVERSION["Great New Grid",
#>         METHOD["Hotine Oblique Mercator (variant B)",
#>             ID["EPSG",9815]],
#>         PARAMETER["Latitude of projection centre",37.385,
#>             ANGLEUNIT["degree",0.0174532925199433],
#>             ID["EPSG",8811]],
#>         PARAMETER["Longitude of projection centre",-108.51,
#>             ANGLEUNIT["degree",0.0174532925199433],
#>             ID["EPSG",8812]],
#>         PARAMETER["Azimuth of initial line",0,
#>             ANGLEUNIT["degree",0.0174532925199433],
#>             ID["EPSG",8813]],
#>         PARAMETER["Angle from Rectified to Skew Grid",0,
#>             ANGLEUNIT["degree",0.0174532925199433],
#>             ID["EPSG",8814]],
#>         PARAMETER["Scale factor on initial line",1,
#>             SCALEUNIT["unity",1],
#>             ID["EPSG",8815]],
#>         PARAMETER["Easting at projection centre",500,
#>             LENGTHUNIT["metre",1],
#>             ID["EPSG",8816]],
#>         PARAMETER["Northing at projection centre",500,
#>             LENGTHUNIT["metre",1],
#>             ID["EPSG",8817]]],
#>     CS[Cartesian,2],
#>         AXIS["(E)",east,
#>             ORDER[1],
#>             LENGTHUNIT["metre",1,
#>                 ID["EPSG",9001]]],
#>         AXIS["(N)",north,
#>             ORDER[2],
#>             LENGTHUNIT["metre",1,
#>                 ID["EPSG",9001]]]]

# Or, define a floating CRS for a legacy grid
define_legacy_grid(
  pt_0_geo = c(-108.51, 37.385),
  pt_0_grid = c(500, 500),
  pt_1_geo = c(-108.511, 37.384),
  pt_1_grid = c(360, 380),
  name = "Screwy Legacy Grid"
)
#> Coordinate Reference System:
#>   User input: +proj=omerc +lat_0=37.385 +lonc=-108.51 +alpha=-10.8099400559583 +gamma=0 +k_0=1.29863131831123 +x_0=500 +y_0=500 
#>   wkt:
#> PROJCRS["Screwy Legacy Grid",
#>     BASEGEOGCRS["Screwy Legacy Grid",
#>         DATUM["World Geodetic System 1984",
#>             ELLIPSOID["WGS 84",6378137,298.257223563,
#>                 LENGTHUNIT["metre",1]],
#>             ID["EPSG",6326]],
#>         PRIMEM["Greenwich",0,
#>             ANGLEUNIT["degree",0.0174532925199433],
#>             ID["EPSG",8901]]],
#>     CONVERSION["Screwy Legacy Grid",
#>         METHOD["Hotine Oblique Mercator (variant B)",
#>             ID["EPSG",9815]],
#>         PARAMETER["Latitude of projection centre",37.385,
#>             ANGLEUNIT["degree",0.0174532925199433],
#>             ID["EPSG",8811]],
#>         PARAMETER["Longitude of projection centre",-108.51,
#>             ANGLEUNIT["degree",0.0174532925199433],
#>             ID["EPSG",8812]],
#>         PARAMETER["Azimuth of initial line",-10.8099400559583,
#>             ANGLEUNIT["degree",0.0174532925199433],
#>             ID["EPSG",8813]],
#>         PARAMETER["Angle from Rectified to Skew Grid",0,
#>             ANGLEUNIT["degree",0.0174532925199433],
#>             ID["EPSG",8814]],
#>         PARAMETER["Scale factor on initial line",1.29863131831123,
#>             SCALEUNIT["unity",1],
#>             ID["EPSG",8815]],
#>         PARAMETER["Easting at projection centre",500,
#>             LENGTHUNIT["metre",1],
#>             ID["EPSG",8816]],
#>         PARAMETER["Northing at projection centre",500,
#>             LENGTHUNIT["metre",1],
#>             ID["EPSG",8817]]],
#>     CS[Cartesian,2],
#>         AXIS["(E)",east,
#>             ORDER[1],
#>             LENGTHUNIT["metre",1,
#>                 ID["EPSG",9001]]],
#>         AXIS["(N)",north,
#>             ORDER[2],
#>             LENGTHUNIT["metre",1,
#>                 ID["EPSG",9001]]]]

# You can also use projected geographic points
define_legacy_grid(
  pt_0_geo = c(720446.8, 4140492.5),
  pt_0_grid = c(500, 500),
  pt_1_geo = c(720361.2, 4140379.2),
  pt_1_grid = c(360, 380),
  geo_crs = 6341,
  name = "Great New Grid"
)
#> Coordinate Reference System:
#>   User input: +proj=omerc +lat_0=37.384999622921 +lonc=-108.509999731967 +alpha=-10.8146235871119 +gamma=0 +k_0=1.29877699316682 +x_0=500 +y_0=500 
#>   wkt:
#> PROJCRS["Great New Grid",
#>     BASEGEOGCRS["Great New Grid",
#>         DATUM["World Geodetic System 1984",
#>             ELLIPSOID["WGS 84",6378137,298.257223563,
#>                 LENGTHUNIT["metre",1]],
#>             ID["EPSG",6326]],
#>         PRIMEM["Greenwich",0,
#>             ANGLEUNIT["degree",0.0174532925199433],
#>             ID["EPSG",8901]]],
#>     CONVERSION["Great New Grid",
#>         METHOD["Hotine Oblique Mercator (variant B)",
#>             ID["EPSG",9815]],
#>         PARAMETER["Latitude of projection centre",37.384999622921,
#>             ANGLEUNIT["degree",0.0174532925199433],
#>             ID["EPSG",8811]],
#>         PARAMETER["Longitude of projection centre",-108.509999731967,
#>             ANGLEUNIT["degree",0.0174532925199433],
#>             ID["EPSG",8812]],
#>         PARAMETER["Azimuth of initial line",-10.8146235871119,
#>             ANGLEUNIT["degree",0.0174532925199433],
#>             ID["EPSG",8813]],
#>         PARAMETER["Angle from Rectified to Skew Grid",0,
#>             ANGLEUNIT["degree",0.0174532925199433],
#>             ID["EPSG",8814]],
#>         PARAMETER["Scale factor on initial line",1.29877699316682,
#>             SCALEUNIT["unity",1],
#>             ID["EPSG",8815]],
#>         PARAMETER["Easting at projection centre",500,
#>             LENGTHUNIT["metre",1],
#>             ID["EPSG",8816]],
#>         PARAMETER["Northing at projection centre",500,
#>             LENGTHUNIT["metre",1],
#>             ID["EPSG",8817]]],
#>     CS[Cartesian,2],
#>         AXIS["(E)",east,
#>             ORDER[1],
#>             LENGTHUNIT["metre",1,
#>                 ID["EPSG",9001]]],
#>         AXIS["(N)",north,
#>             ORDER[2],
#>             LENGTHUNIT["metre",1,
#>                 ID["EPSG",9001]]]]
```

## Code of Conduct

Please note that the localgrid project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
