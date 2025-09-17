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


#' Get Radios of Colombia
#'
#' @description
#' Retrieves information about radio stations in Colombia from the API Colombia.
#' This function fetches only the following fields: id, name, frequency, and band.
#'
#' @return A tibble with multiple rows and the selected columns, or NULL if the API is unavailable.
#'
#' @examples
#' \donttest{
#' radios <- get_colombia_radios()
#' print(radios)
#' }
#'
#' @importFrom httr GET http_error content
#' @importFrom jsonlite fromJSON
#' @importFrom tibble tibble
#'
#' @export
get_colombia_radios <- function() {
  url <- "https://api-colombia.com/api/v1/Radio"

  # Try to fetch data and handle connection errors
  response <- tryCatch(
    httr::GET(url),
    error = function(e) {
      message("Could not connect to API Colombia: ", e$message)
      return(NULL)
    }
  )
  if (is.null(response)) return(NULL)

  # Check HTTP status
  if (httr::http_error(response)) {
    message("API request failed with status code: ", httr::status_code(response))
    return(NULL)
  }

  # Parse JSON
  data_raw <- httr::content(response, as = "text", encoding = "UTF-8")
  data_list <- tryCatch(
    jsonlite::fromJSON(data_raw),
    error = function(e) {
      message("Error parsing JSON: ", e$message)
      return(NULL)
    }
  )

  if (is.null(data_list) || length(data_list) == 0) {
    message("No data found for radios in Colombia.")
    return(NULL)
  }

  # Select only the requested fields
  tibble::tibble(
    id        = data_list$id,
    name      = data_list$name,
    frequency = data_list$frequency,
    band      = data_list$band
  )
}
