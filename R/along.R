#' Get a point at a distance along a line
#'
#' Takes a [data-LineString] and returns a [data-Point]
#' at a specified distance along the line.
#'
#' @export
#' @param line An input [data-LineString].
#' @param distance Distance along the line.
#' @param units	Units for the `distance` argument. Can be degrees, radians,
#' miles, or kilometers.
#' @template lint
#' @family measurements
#' @return A [data-Point] distance units along the line.
#' @examples
#' pts <- '[
#'    [-21.964416, 64.148203],
#'    [-21.956176, 64.141316],
#'    [-21.93901, 64.135924],
#'    [-21.927337, 64.136673]
#' ]'
#' lawn_along(lawn_linestring(pts), 1, 'miles')
#'
#' line <- '{
#' "type": "Feature",
#' "properties": {},
#' "geometry": {
#'   "type": "LineString",
#'   "coordinates": [
#'     [-77.031669, 38.878605],
#'     [-77.029609, 38.881946],
#'     [-77.020339, 38.884084],
#'     [-77.025661, 38.885821],
#'     [-77.021884, 38.889563],
#'     [-77.019824, 38.892368]
#'     ]
#'  }
#' }'
#' lawn_along(line, distance = 1, units = 'miles')
#' @examples \dontrun{
#' lawn_along(lawn_linestring(pts), 1, 'miles') %>% view
#' res <- lawn_along(lawn_linestring(pts), 1, 'miles')
#' lawn_featurecollection(list(res, lawn_linestring(pts))) %>% view
#' }
lawn_along <- function(line, distance, units, lint = FALSE) {
  line <- convert(line)
  lawnlint(line, lint)
  assert(distance, c('numeric', 'integer'))
  if (lint) {
    is_type(line, type_top = "Feature", type_lower = "LineString")
  }
  ct$eval(sprintf("var alg = turf.along(%s, %s, {units:'%s'});", line, distance, units))
  structure(ct$get("alg"), class = "point")
}
