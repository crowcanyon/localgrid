
<!-- README.md is generated from README.Rmd. Please edit that file -->

# localgrid

<!-- badges: start -->
<!-- badges: end -->

The goal of localgrid is to …

## Installation

You can install the released version of localgrid from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("localgrid")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(localgrid)
#> Loading required package: magrittr
## basic example code
```

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

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
