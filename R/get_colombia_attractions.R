# ColombiAPI - Access Colombian Data via APIs and Curated Datasets
# Version 0.4.0
# Copyright (C) 2025-2026 Renzo Caceres Rossi
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

#' Get All Touristic Attractions of Colombia
#'
#' @description
#' Retrieves selected information about touristic attractions in Colombia from the API Colombia.
#' This function fetches the attraction ID, name, description, latitude, longitude, and city ID.
#'
#' @return A tibble with the following columns:
#' \itemize{
#'   \item \code{id}: Attraction identifier (integer)
#'   \item \code{name}: Attraction name (character)
#'   \item \code{description}: Attraction description (character)
#'   \item \code{latitude}: Latitude coordinates (numeric)
#'   \item \code{longitude}: Longitude coordinates (numeric)
#'   \item \code{cityId}: City identifier (integer)
#' }
#' Returns \code{NULL} if the API request fails.
#'
#' @details
#' This function sends a GET request to the API Colombia service.
#' If the API request fails or returns an error status code,
#' the function returns \code{NULL} with an informative message.
#'
#' @note Requires internet connection.
#'
#' @source API Colombia: \url{https://api-colombia.com/api/v1/TouristicAttraction}
#'
#' @examples
#' if (interactive()) {
#'   get_colombia_attractions()
#' }
#'
#' @seealso \code{\link[httr]{GET}}, \code{\link[jsonlite]{fromJSON}}, \code{\link[tibble]{tibble}}
#'
#' @importFrom httr GET timeout http_error status_code content
#' @importFrom jsonlite fromJSON
#' @importFrom tibble tibble
#'
#' @export
get_colombia_attractions <- function() {
  url <- "https://api-colombia.com/api/v1/TouristicAttraction"
  res <- tryCatch(
    httr::GET(url, httr::timeout(10)),
    error = function(e) {
      message("Failed to connect to api-colombia.com: ", e$message)
      return(NULL)
    }
  )
  if (is.null(res)) {
    return(NULL)
  }
  if (httr::http_error(res)) {
    message("API Colombia returned status: ", httr::status_code(res))
    return(NULL)
  }
  txt <- tryCatch(
    httr::content(res, as = "text", encoding = "UTF-8"),
    error = function(e) return(NULL)
  )
  if (is.null(txt)) {
    return(NULL)
  }
  data_list <- tryCatch(
    jsonlite::fromJSON(txt),
    error = function(e) {
      message("Error parsing JSON: ", e$message)
      return(NULL)
    }
  )
  if (is.null(data_list) || length(data_list) == 0) {
    message("No touristic attraction data found for Colombia.")
    return(NULL)
  }
  tibble::tibble(
    id          = data_list$id,
    name        = data_list$name,
    description = data_list$description,
    latitude    = data_list$latitude,
    longitude   = data_list$longitude,
    cityId      = data_list$cityId
  )
}
