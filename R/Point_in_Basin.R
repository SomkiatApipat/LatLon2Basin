# function
point_in_basin <- function(lat, lon, basin_shapefile) {

  # Create a SpatialPoints object with the given latitude and longitude
  point <- SpatialPoints(matrix(c(lon, lat), ncol = 2),
                         proj4string = CRS("+proj=longlat +datum=WGS84"))

  # Transform the point to the CRS of the basin_shapefile
  point <- spTransform(point, CRSobj = proj4string(basin_shapefile))

  # Perform spatial overlay to check if the point is within any basin
  result <- raster::extract(basin_shapefile, point)

  # Return the name of the basin if the point is within any basin, otherwise NA
  if (length(result) > 0) {
    return(result$MBASIN_T)
  } else {
    return(NA)
  }
}

