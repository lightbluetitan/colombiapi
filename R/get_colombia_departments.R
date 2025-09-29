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

#' Get Colombia's Departments from API Colombia
#'
#' @description
#' Retrieves comprehensive information about all Colombian departments from the API Colombia service.
#' This function fetches data including department names, capitals, geographical information,
#' area, population, and administrative details for all 32 departments plus Bogotá D.C.
#'
#' @return A tibble with the following columns:
#' \itemize{
#'   \item \code{id}: Department identifier (integer)
#'   \item \code{name}: Department name (character)
#'   \item \code{capital}: Capital city name (character)
#'   \item \code{surface}: Department area in km² (integer)
#'   \item \code{population}: Department population (integer)
#'   \item \code{municipalities}: Number of municipalities (integer)
#'   \item \code{phone_prefix}: Phone area code (character)
#'   \item \code{region_id}: Geographic region identifier (integer)
#' }
#'
#' @details
#' This function sends a GET request to the API Colombia service.
#' If the API request fails or returns an error status code,
#' the function returns \code{NULL} with an informative message.
#'
#' @note Requires internet connection.
#'
#' @source API Colombia: \url{https://api-colombia.com/api/v1/Department}
#'
#' @examples
#' if (interactive()) {
#'   get_colombia_departments()
#' }
#'
#' @seealso \code{\link[httr]{GET}}, \code{\link[jsonlite]{fromJSON}}, \code{\link[dplyr]{as_tibble}}
#'
#' @importFrom httr GET content
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#'
#' @export
get_colombia_departments <- function() {
  url <- "https://api-colombia.com/api/v1/Department"

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
    capital = content$cityCapital$name,
    surface = content$surface,
    population = content$population,
    municipalities = content$municipalities,
    phone_prefix = content$phonePrefix,
    region_id = content$regionId,
    stringsAsFactors = FALSE
  ))

  return(df)
}
