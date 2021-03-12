as_wgs84 <- function(x, crs) {
  x %>%
    sf::st_point() %>%
    sf::st_sfc(crs = crs) %>%
    sf::st_transform(4326) %>%
    sf::st_coordinates() %>%
    as.numeric()
}
