#' Thai River basin name
#'
#' Finding the main River basin name using Latitude and longitude
#'
#' @param lat numeric, latitude
#' @param lon numeric, longitude
#'
#' @return Main River basin name
#' @export
#'
#' @examples LatLon2Basin(13.7506,100.7943)
#' @examples LatLon2Basin(14.074251, 100.608416)
#' @examples LatLon2Basin(18.7883, 98.9853)
#'
#' @import raster
#' @import sp
#' @import leaflet
#' @import htmltools

LatLon2Basin <- function(lat,lon) {

  # Check if CRS is defined for basinmap, if not, set it to WGS84
  if(is.null(proj4string(basinmap))) {
    proj4string(basinmap) <- CRS("+proj=longlat +datum=WGS84")
  }

  basin_name <- point_in_basin(lat, lon, basinmap)

  return(basin_name)
}
