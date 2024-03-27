#' Thai River basin name
#'
#' Finding the main River basin name using Latitude and longitude
#'
#' @param LatLon numeric, lat lon in data frame
#'
#' @return Main River basin name
#' @export
#'
#' @examples data(LatLon)
#' @examples LatLon
#' @examples LatLon2BasinTbl(LatLon)
#'
#' @import raster
#' @import sp
#' @import leaflet
#' @import htmltools

LatLon2BasinTbl <- function(LatLon) {

  # check number of data
  ndata <- nrow(LatLon)
  basin_t <- rep("",ndata)
  for (i in 1:ndata) {
    basin_t[i] <- LatLon2Basin(LatLon[i,1],LatLon[i,2])
  }

  return(basin_t)
}
