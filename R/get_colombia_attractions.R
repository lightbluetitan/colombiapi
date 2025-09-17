# ColombiAPI - Access Colombian Data via APIs and Curated Datasets
# Version 0.2.0
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

#' Get All Touristic Attractions of Colombia
#'
#' @description
#' Retrieves selected information about touristic attractions in Colombia from the API Colombia.
#' This function fetches the attraction ID, name, description, latitude, longitude, and city ID.
#'
#' @return A tibble with multiple rows, each representing a touristic attraction in Colombia, or NULL if the API is unavailable.
#'
#' @examples
#' \donttest{
#' attractions <- get_colombia_attractions()
#' print(attractions)
#' }
#'
#' @importFrom httr GET http_error content
#' @importFrom jsonlite fromJSON
#' @importFrom tibble tibble
#'
#' @export
get_colombia_attractions <- function() {
  url <- "https://api-colombia.com/api/v1/TouristicAttraction"

  # Try to fetch the data and handle connection errors
  response <- tryCatch(
    httr::GET(url),
    error = function(e) {
      message("Failed to connect to api-colombia.com: ", e$message)
      return(NULL)
    }
  )
  if (is.null(response)) return(NULL)  # Return NULL if connection failed

  # Check HTTP status code
  if (httr::http_error(response)) {
    message("API request failed with status code: ", httr::status_code(response))
    return(NULL)
  }

  # Convert response to text and parse JSON
  data_raw <- httr::content(response, as = "text", encoding = "UTF-8")
  data_list <- tryCatch(
    jsonlite::fromJSON(data_raw),
    error = function(e) {
      message("Error parsing JSON: ", e$message)
      return(NULL)
    }
  )

  if (is.null(data_list) || length(data_list) == 0) {
    message("No touristic attraction data found for Colombia.")
    return(NULL)
  }

  # Select only required fields
  tibble::tibble(
    id          = data_list$id,
    name        = data_list$name,
    description = data_list$description,
    latitude    = data_list$latitude,
    longitude   = data_list$longitude,
    cityId      = data_list$cityId
  )
}
