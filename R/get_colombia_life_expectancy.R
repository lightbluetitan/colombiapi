# ColombiAPI - Access Colombian Data via APIs and Curated Datasets
# Version 0.3.1
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

#' Get Colombia's Life Expectancy at Birth (Total, Years) from World Bank
#'
#' @description
#' Retrieves Colombia's life expectancy at birth (total, years)
#' for the years 2010 to 2022 using the World Bank Open Data API.
#' The indicator used is \code{SP.DYN.LE00.IN}.
#'
#' @return A tibble with the following columns:
#' \itemize{
#'   \item \code{indicator}: Indicator name (e.g., "Life expectancy at birth, total (years)")
#'   \item \code{country}: Country name ("Colombia")
#'   \item \code{year}: Year of the data (integer)
#'   \item \code{value}: Life expectancy at birth in years
#' }
#'
#' @details
#' This function sends a GET request to the World Bank API.
#' If the API request fails or returns an error status code,
#' the function returns an empty tibble with the expected structure,
#' instead of NULL, to ensure CRAN compatibility in offline checks.
#'
#' @note Requires internet connection for real data.
#'
#' @source World Bank Open Data API: \url{https://data.worldbank.org/indicator/SP.DYN.LE00.IN}
#'
#' @examples
#' \donttest{
#'   life_expectancy_data <- get_colombia_life_expectancy()
#'   head(life_expectancy_data)
#' }
#'
#' @seealso \code{\link[httr]{GET}}, \code{\link[jsonlite]{fromJSON}}, \code{\link[dplyr]{as_tibble}}
#'
#' @importFrom httr GET content add_headers
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr as_tibble
#'
#' @export
get_colombia_life_expectancy <- function() {
  url <- "https://api.worldbank.org/v2/country/COL/indicator/SP.DYN.LE00.IN?format=json&date=2010:2022&per_page=100"

  # Fallback tibble to avoid CRAN NULL errors (same structure)
  empty_df <- dplyr::as_tibble(data.frame(
    indicator = character(),
    country = character(),
    year = integer(),
    value = numeric(),
    stringsAsFactors = FALSE
  ))

  # Try GET request safely with User-Agent header
  res <- tryCatch(
    httr::GET(
      url,
      httr::add_headers(`User-Agent` = "ColombiAPI R package (https://github.com/yourusername/ColombiAPI)")
    ),
    error = function(e) {
      if (interactive()) message("Error connecting to World Bank API: ", e$message)
      return(NULL)
    }
  )

  if (is.null(res) || res$status_code != 200) {
    if (interactive()) {
      status_msg <- if (is.null(res)) "connection failed" else paste("status", res$status_code)
      message("Warning: Unable to retrieve data from World Bank API (", status_msg, "). Returning empty tibble.")
    }
    return(empty_df)
  }

  content <- tryCatch(
    jsonlite::fromJSON(httr::content(res, "text", encoding = "UTF-8"), simplifyVector = TRUE),
    error = function(e) {
      if (interactive()) message("Error parsing JSON response: ", e$message)
      return(NULL)
    }
  )

  if (is.null(content) || length(content) < 2 || is.null(content[[2]]) || nrow(content[[2]]) == 0) {
    if (interactive()) message("No data returned from the World Bank API. Returning empty tibble.")
    return(empty_df)
  }

  data <- content[[2]]

  df <- dplyr::as_tibble(data.frame(
    indicator = data$indicator$value,
    country = data$country$value,
    year = as.integer(data$date),
    value = as.numeric(data$value),
    stringsAsFactors = FALSE
  ))

  return(df)
}
