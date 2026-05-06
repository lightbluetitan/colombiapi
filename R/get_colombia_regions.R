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

#' Get Colombia's Regions from API Colombia
#'
#' @description
#' Retrieves comprehensive information about Colombia's six natural regions from the API Colombia service.
#' This function fetches data including region names, descriptions, and identifiers for all Colombian regions:
#' Caribe, Pacífico, Orinoquía, Amazonía, Andina, and Insular.
#'
#' @return A tibble with the following columns:
#' \itemize{
#'   \item \code{id}: Region identifier (integer)
#'   \item \code{name}: Region name (character)
#'   \item \code{description}: Detailed description of the region (character)
#' }
#'
#' @details
#' This function sends a GET request to the API Colombia service.
#' If the API request fails or returns an error status code,
#' the function returns \code{NULL} with an informative message.
#'
#' @note Requires internet connection.
#'
#' @source API Colombia: \url{https://api-colombia.com/api/v1/Region}
#'
#' @examples
#' if (interactive()) {
#'   get_colombia_regions()
#' }
#'
#' @seealso \code{\link[httr]{GET}}, \code{\link[jsonlite]{fromJSON}}, \code{\link[dplyr]{as_tibble}}
#'
#' @importFrom httr GET timeout status_code content
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#'
#' @export
get_colombia_regions <- function() {
  url <- "https://api-colombia.com/api/v1/Region"
  res <- tryCatch(
    httr::GET(url, httr::timeout(10)),
    error = function(e) {
      message("API Colombia request failed: ", e$message)
      return(NULL)
    }
  )
  if (is.null(res)) {
    return(NULL)
  }
  if (httr::status_code(res) != 200) {
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
  content <- tryCatch(
    jsonlite::fromJSON(txt),
    error = function(e) return(NULL)
  )
  if (is.null(content) || length(content) == 0) {
    message("No data returned from the API Colombia service.")
    return(NULL)
  }
  dplyr::as_tibble(data.frame(
    id          = content$id,
    name        = content$name,
    description = content$description,
    stringsAsFactors = FALSE
  ))
}
