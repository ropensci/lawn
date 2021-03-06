#' Standard deviation of a field among points within polygons
#'
#' Calculates the population standard deviation (i.e. denominator = n,
#' not n-1) of values from [data-Point]'s within a set of
#' [data-Polygon]'s
#'
#' @export
#' @param polygons Polygon(s) ([data-FeatureCollection]<([data-Polygon])>)
#' defining area to aggregate
#' @param points Points ([data-FeatureCollection]<([data-Point])>) with
#' values to aggregate
#' @param in_field Character for the name of the field on `pts` on
#' which you wish to perform the aggregation.
#' @param out_field Character for the name of the field on the output
#' polygon FeatureCollection that will store the resultant value.
#' @template lint
#' @family aggregations
#' @return polygons with appended field representing deviation, as a
#' [data-FeatureCollection]
#'
#' @author Jeff Hollister \email{hollister.jeff@@epa.gov}
#' @examples \dontrun{
#' ex_polys <- lawn_data$polygons_aggregate
#' ex_pts <- lawn_data$points_aggregate
#' lawn_deviation(ex_polys, ex_pts, "population")
#' }
lawn_deviation <- function(polygons, points, in_field, out_field = "deviation",
                           lint = FALSE) {
  # This code has been contributed by Jeff Hollister, US EPA
  # Please read the following disclaimer:
  # \url{https://www.epa.gov/home/github-contribution-disclaimer}

  lawnlint(list(polygons, points), lint)
  if (lint) {
    is_type(polygons, type_top = "FeatureCollection")
    is_type(points, type_top = "FeatureCollection")
  }
  calc_math("standardDeviation", convert(polygons), convert(points),
            in_field, out_field)
}
