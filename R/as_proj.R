#' Create CRS definition in Proj system
#'
#' This function creates a new Proj-style CRS definition from list of named
#' elements.
#'
#' @param x A list of named Proj elements
#'
#' @return A length-1 character string with the Proj-style CRS definition
#'
#' @export
#'
#' @examples
#'as_proj(
#'  list(
#'    proj = "omerc",
#'    lat_0 = 37.385,
#'    lonc = -108.51,
#'    alpha = 0,
#'    gamma = 0,
#'    k_0 = 1,
#'    x_0 = 500,
#'    y_0 = 500
#'  )
#')
as_proj <-
  function(x){
    x %>%
      {paste0("+",names(.),"=",., collapse = " ")}

  }

