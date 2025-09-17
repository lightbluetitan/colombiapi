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

#' Get All Cities of Colombia
#'
#' @description
#' Retrieves basic information about all cities in Colombia from the API Colombia.
#' This function fetches only the city ID and name to provide a clean and concise dataset.
#'
#' @return A tibble with two columns: \code{id} and \code{name}, or NULL if the API is unavailable.
#'
#' @examples
#' \donttest{
#' cities <- get_colombia_cities()
#' print(cities)
#' }
#'
#' @importFrom httr GET http_error content
#' @importFrom jsonlite fromJSON
#' @importFrom tibble tibble
#'
#' @export
get_colombia_cities <- function() {
  url <- "https://api-colombia.com/api/v1/City"

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
    message("No city data found for Colombia.")
    return(NULL)
  }

  # Select only id and name
  tibble::tibble(
    id   = data_list$id,
    name = data_list$name
  )
}
