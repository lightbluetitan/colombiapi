# ColombiAPI - Access Colombian Data via APIs and Curated Datasets
# Version 0.3.2
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


#' Get Invasive Species of Colombia
#'
#' @description
#' Retrieves information about invasive species in Colombia from the API Colombia.
#' This function fetches only selected fields: id, name, scientificName,
#' commonNames, impact, manage, and riskLevel.
#'
#' @return A tibble with the following columns:
#' \itemize{
#'   \item \code{id}: Species identifier (integer)
#'   \item \code{name}: Species common name (character)
#'   \item \code{scientificName}: Scientific name of the species (character)
#'   \item \code{commonNames}: List of common names (list)
#'   \item \code{impact}: Description of ecological impact (character)
#'   \item \code{manage}: Management recommendations (character)
#'   \item \code{riskLevel}: Risk level classification (character)
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
#' @source API Colombia: \url{https://api-colombia.com/api/v1/InvasiveSpecie}
#'
#' @examples
#' if (interactive()) {
#'   get_colombia_invasive_species()
#' }
#'
#' @seealso \code{\link[httr]{GET}}, \code{\link[jsonlite]{fromJSON}}, \code{\link[tibble]{tibble}}
#'
#' @importFrom httr GET timeout http_error status_code content
#' @importFrom jsonlite fromJSON
#' @importFrom tibble tibble
#'
#' @export
get_colombia_invasive_species <- function() {
  url <- "https://api-colombia.com/api/v1/InvasiveSpecie"
  res <- tryCatch(
    httr::GET(url, httr::timeout(10)),
    error = function(e) {
      message("Could not connect to API Colombia: ", e$message)
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
    message("No data found for invasive species in Colombia.")
    return(NULL)
  }
  tibble::tibble(
    id             = data_list$id,
    name           = data_list$name,
    scientificName = data_list$scientificName,
    commonNames    = data_list$commonNames,
    impact         = data_list$impact,
    manage         = data_list$manage,
    riskLevel      = data_list$riskLevel
  )
}
