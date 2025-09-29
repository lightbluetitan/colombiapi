# ColombiAPI - Access Colombian Data via APIs and Curated Datasets
# Version 0.3.0
# Copyright (C) 2025 Renzo Caceres Rossi
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

#' Get Colombia's Airports from API Colombia
#'
#' @description
#' Retrieves comprehensive information about all Colombian airports from the API Colombia service.
#' This function fetches data including airport names, codes, types, locations, and geographical coordinates
#' for all airports across Colombia's departments.
#'
#' @return A tibble with the following columns:
#' \itemize{
#'   \item \code{id}: Airport identifier (integer)
#'   \item \code{name}: Airport name (character)
#'   \item \code{iata_code}: IATA airport code (character)
#'   \item \code{oaci_code}: ICAO airport code (character)
#'   \item \code{type}: Airport type (character)
#'   \item \code{city}: City where airport is located (character)
#'   \item \code{department}: Department where airport is located (character)
#'   \item \code{latitude}: Latitude coordinates (numeric)
#'   \item \code{longitude}: Longitude coordinates (numeric)
#' }
#'
#' @details
#' This function sends a GET request to the API Colombia service.
#' If the API request fails or returns an error status code,
#' the function returns \code{NULL} with an informative message.
#' Note: The API returns latitude and longitude values swapped, so this function
#' corrects the coordinates by swapping them back to their correct positions.
#'
#' @note Requires internet connection.
#'
#' @source API Colombia: \url{https://api-colombia.com/api/v1/Airport}
#'
#' @examples
#' if (interactive()) {
#'   get_colombia_airports()
#' }
#'
#' @seealso \code{\link[httr]{GET}}, \code{\link[jsonlite]{fromJSON}}, \code{\link[dplyr]{as_tibble}}
#'
#' @importFrom httr GET content
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#'
#' @export
get_colombia_airports <- function() {
  url <- "https://api-colombia.com/api/v1/Airport"

  res <- httr::GET(url)

  if (res$status_code != 200) {
    message(paste("Error: status", res$status_code))
    return(NULL)
  }

  content <- jsonlite::fromJSON(httr::content(res, "text", encoding = "UTF-8"))

  if (length(content) == 0 || is.null(content)) {
    message("No data returned from the API Colombia service.")
    return(NULL)
  }

  df <- dplyr::as_tibble(data.frame(
    id = content$id,
    name = content$name,
    iata_code = content$iataCode,
    oaci_code = content$oaciCode,
    type = content$type,
    city = content$city$name,
    department = content$department$name,
    longitude = content$latitude,
    latitude = content$longitude,
    stringsAsFactors = FALSE
  ))

  return(df)
}
