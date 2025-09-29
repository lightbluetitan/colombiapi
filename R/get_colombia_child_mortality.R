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

#' Get Colombia's Under-5 Mortality Rate from World Bank
#'
#' @description
#' Retrieves Colombia's under-5 mortality rate, measured as the number of deaths
#' of children under five years of age per 1,000 live births, for the years 2010 to 2022
#' using the World Bank Open Data API. The indicator used is \code{SH.DYN.MORT}.
#'
#' @return A tibble with the following columns:
#' \itemize{
#'   \item \code{indicator}: Indicator name (e.g., "Mortality rate, under-5 (per 1,000 live births)")
#'   \item \code{country}: Country name ("Colombia")
#'   \item \code{year}: Year of the data (integer)
#'   \item \code{value}: Mortality rate (per 1,000 live births)
#' }
#'
#' @details
#' This function sends a GET request to the World Bank API.
#' If the API request fails or returns an error status code,
#' the function returns \code{NULL} with an informative message.
#'
#' @note Requires internet connection.
#'
#' @source World Bank Open Data API: \url{https://data.worldbank.org/indicator/SH.DYN.MORT}
#'
#' @examples
#' if (interactive()) {
#'   get_colombia_child_mortality()
#' }
#'
#' @seealso \code{\link[httr]{GET}}, \code{\link[jsonlite]{fromJSON}}, \code{\link[dplyr]{as_tibble}}
#'
#' @importFrom httr GET content
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#'
#' @export
get_colombia_child_mortality <- function() {
  url <- "https://api.worldbank.org/v2/country/COL/indicator/SH.DYN.MORT?format=json&date=2010:2022&per_page=100"
  res <- httr::GET(url)
  if (res$status_code != 200) {
    message(paste("Error: status", res$status_code))
    return(NULL)
  }
  content <- jsonlite::fromJSON(httr::content(res, "text", encoding = "UTF-8"))
  if (length(content) < 2 || is.null(content[[2]])) {
    message("No data returned from the World Bank API.")
    return(NULL)
  }
  data <- content[[2]]
  df <- dplyr::as_tibble(data.frame(
    indicator = data$indicator$value,
    country = data$country$value,
    year = as.integer(data$date),
    value = data$value
  ))
  return(df)
}
