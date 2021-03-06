% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rewind.R
\name{lawn_rewind}
\alias{lawn_rewind}
\title{Rewind}
\usage{
lawn_rewind(x, reverse = FALSE, mutate = FALSE, lint = FALSE)
}
\arguments{
\item{x}{A \link{data-FeatureCollection} or \link{data-Feature} with
Polygon, MultiPolygon, LineString, or MultiLineString}

\item{reverse}{(logical) enable reverse winding. Default: \code{FALSE}}

\item{mutate}{(logical) allows GeoJSON input to be mutated (significant
performance increase if true) Default: \code{FALSE}}

\item{lint}{(logical) Lint or not. Uses geojsonhint. Takes up increasing
time as the object to get linted increases in size, so probably use by
default for small objects, but not for large if you know they are good
geojson objects. Default: \code{FALSE}}
}
\value{
A \link{data-FeatureCollection}
}
\description{
Rewind (Multi)LineString or (Multi)Polygon outer ring counterclockwise
and inner rings clockwise (Uses Shoelace Formula)
}
\examples{
x <- '{
"type": "Feature",
"properties": {},
"geometry": {
  "type": "Polygon",
  "coordinates": [
    [[121, -29], [138, -29], [138, -18], [121, -18], [121, -29]]
   ]
  }
}'
lawn_rewind(x, TRUE)
lawn_rewind(x, mutate = TRUE)
lawn_rewind(x, lint = TRUE)
}
