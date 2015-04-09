#' Calculate the area of a polygon or group of polygons
#'
#' @export
#'
#' @param input A feature or feature collection of polygons.
#'
#' @details Calculates the total area of a polygon or group of polygons. Returns
#'          the values in square meters.
#' @examples
#' area(lawn_data$poly)
#' area(lawn_data$multipoly)
area <- function(input) {
  input <- convert(input)
  ct$eval(sprintf("var poly = %s;",input))
  ct$eval("var area = turf.area(poly);")
  ct$get("area")
}