# ColombiAPI - Access Colombia's Public Data via API Colombia
# Version 0.1.0
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

#' Get Information About Colombia
#'
#' This function makes an API call https://api-colombia.com/api/v1/Country/Colombia
#' to retrieve information about Colombia, such as its name, surface area, population, time zone, currency, and region.
#' It processes the API response and returns the data in a structured data.frame.
#'
#' @return A `data.frame` with the following columns:
#'   \itemize{
#'     \item \code{name}: Name of the country.
#'     \item \code{surface}: The surface area of the country in square kilometers.
#'     \item \code{population}: The population of the country.
#'     \item \code{timeZone}: The time zone of the country.
#'     \item \code{currency}: The currency used in the country.
#'     \item \code{currencySymbol}: The currency symbol.
#'     \item \code{region}: The region of the country in the world.
#'   }
#'
#' @details The function sends a GET request to the API at
#'   \url{https://api-colombia.com/api/v1/Country/Colombia}. If the API returns
#'   a successful response (status code 200), the data is parsed and returned.
#'   If the response is unsuccessful or the structure is not as expected,
#'   the function will return \code{NULL}.
#'
#' @note
#' Ensure you have an active internet connection to access the API. If the API structure changes
#' or the API becomes unavailable, the function may need modifications.
#'
#' This function relies on the following packages: \code{httr} and \code{jsonlite}.
#' These packages are used for making HTTP requests and processing JSON responses, respectively.
#'
#' @examples
#' \dontrun{
#'   # Call the function to get Colombia information
#'   colombia_info <- get_Colombia_info()
#'
#'   # Print the result
#'   print(colombia_info)
#' }
#'
#' @importFrom httr GET status_code content
#' @importFrom jsonlite fromJSON
#'
#' @export
get_Colombia_info <- function() {
  response <- httr::GET("https://api-colombia.com/api/v1/Country/Colombia")

  # If the response is not successful (status code not 200), return NULL
  if (httr::status_code(response) != 200) {
    return(NULL)
  }

  # Process the response as JSON
  content <- httr::content(response, as = "parsed")

  # Check if the content structure is as expected
  if (is.null(content$name) || is.null(content$population) || is.null(content$currency)) {
    return(NULL)
  }

  # Build the data frame with the expected data
  data <- data.frame(
    name = content$name,
    surface = content$surface,
    population = content$population,
    timeZone = content$timeZone,
    currency = content$currency,
    currencySymbol = content$currencySymbol,
    region = content$region
  )

  return(data)
}
