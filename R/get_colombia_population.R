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

#' Get Colombia's Total Population from World Bank
#'
#' @description
#' Retrieves Colombia's total population for the years 2010 to 2022
#' using the World Bank Open Data API. The indicator used is \code{SP.POP.TOTL}.
#'
#' @return A tibble with the following columns:
#' \itemize{
#'   \item \code{indicator}: Indicator name (e.g., "Population, total")
#'   \item \code{country}: Country name ("Colombia")
#'   \item \code{year}: Year of the data (integer)
#'   \item \code{value}: Population as a numeric value
#'   \item \code{value_label}: Formatted population with commas (e.g., "51,000,000")
#' }
#'
#' @details
#' The function sends a GET request to the World Bank API.
#' If the API request fails or returns an error status code, the function returns \code{NULL} with an informative message.
#'
#' @note Requires internet connection. The data is retrieved in real time from the World Bank API.
#'
#' @source World Bank Open Data API: \url{https://data.worldbank.org/indicator/SP.POP.TOTL}
#'
#' @examples
#' if (interactive()) {
#'   get_colombia_population()
#' }
#'
#' @seealso \code{\link[httr]{GET}}, \code{\link[jsonlite]{fromJSON}}, \code{\link[dplyr]{as_tibble}}, \code{\link[scales]{comma}}
#'
#' @importFrom httr GET content
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble mutate
#' @importFrom scales comma
#'
#' @export
get_colombia_population <- function() {
  url <- "https://api.worldbank.org/v2/country/COL/indicator/SP.POP.TOTL?format=json&date=2010:2022&per_page=100"
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
  )) |>
    dplyr::mutate(
      value_label = scales::comma(value, accuracy = 1)
    )
  return(df)
}
