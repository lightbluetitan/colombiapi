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


#' Get Colombia's Adult Literacy Rate
#'
#' @description
#' Retrieves Colombia's adult literacy rate (% of people ages 15 and above)
#' for the years 2010 to 2022 using the World Bank Open Data API.
#' The indicator used is \code{SE.ADT.LITR.ZS}.
#'
#' @return A tibble with the following columns:
#' \itemize{
#'   \item \code{indicator}: Indicator name
#'   \item \code{country}: Country name ("Colombia")
#'   \item \code{year}: Year of the data (integer)
#'   \item \code{value}: Literacy rate as a percentage
#' }
#'
#' @details
#' This function sends a GET request to the World Bank API.
#' If the API request fails or returns an error status code,
#' the function returns \code{NULL} with an informative message.
#'
#' @note Requires internet connection.
#'
#' @source World Bank Open Data API: \url{https://data.worldbank.org/indicator/SE.ADT.LITR.ZS}
#'
#' @examples
#' if (interactive()) {
#'   get_colombia_literacy_rate()
#' }
#'
#' @seealso \code{\link[httr]{GET}}, \code{\link[jsonlite]{fromJSON}}, \code{\link[dplyr]{as_tibble}}
#'
#' @importFrom httr GET timeout status_code content
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#'
#' @export
get_colombia_literacy_rate <- function() {
  url <- "https://api.worldbank.org/v2/country/COL/indicator/SE.ADT.LITR.ZS?format=json&date=2010:2022&per_page=100"
  res <- tryCatch(
    httr::GET(url, httr::timeout(10)),
    error = function(e) {
      message("World Bank API request failed: ", e$message)
      return(NULL)
    }
  )
  if (is.null(res)) {
    return(NULL)
  }
  if (httr::status_code(res) != 200) {
    message("World Bank API returned status: ", httr::status_code(res))
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
  if (is.null(content) || length(content) < 2 || is.null(content[[2]])) {
    message("No data returned from the World Bank API.")
    return(NULL)
  }
  data <- content[[2]]
  dplyr::as_tibble(data.frame(
    indicator = data$indicator$value,
    country   = data$country$value,
    year      = as.integer(data$date),
    value     = data$value
  ))
}
