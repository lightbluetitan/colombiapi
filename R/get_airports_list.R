# ColombiAPI - Access Colombia's Public Data via API-Colombia
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

#' Get the List of Airports in Colombia
#'
#' This function retrieves a list of airports in Colombia from the public API
#' "https://api-colombia.com/api/v1/Airport" and returns a data frame containing
#' selected information about each airport, ordered by airport name in alphabetical order.
#'
#' @return A data frame with the following columns:
#' \itemize{
#'   \item \code{id}: The unique identifier of the airport.
#'   \item \code{name}: The name of the airport.
#'   \item \code{iataCode}: The IATA code of the airport (if available).
#'   \item \code{oaciCode}: The OACI code of the airport (if available).
#'   \item \code{type}: The type of airport (e.g., commercial, private).
#'   \item \code{longitude}: The geographical longitude of the airport.
#'   \item \code{latitude}: The geographical latitude of the airport.
#' }
#'
#' @details
#' This function sends a GET request to the API, processes the JSON response,
#' and converts it into a structured data frame. The data is filtered and formatted
#' to include only relevant columns, and it is ordered by the \code{name} column in
#' alphabetical order (A to Z).
#'
#' If the API returns a status code of 400, the function issues a warning message to inform
#' the user of the error. Any other unexpected API response is not explicitly handled and may
#' cause the function to fail.
#'
#' @examples
#' \dontrun{
#' # Retrieve the list of airports
#' airports <- get_airports_list()
#'
#' # Print the data frame
#' print(airports)
#'
#' # View the data in a spreadsheet-like interface
#' View(airports)
#'
#' # Select airports located in a specific city (e.g., Bogotá)
#' bogota_airports <- airports %>%
#'   filter(grepl("Bogotá", name))
#' print(bogota_airports)
#' }
#'
#' @note
#' Ensure you have an active internet connection to access the API. If the API structure changes
#' or the API becomes unavailable, the function may need modifications.
#'
#' This function relies on the following packages: \code{httr}, \code{jsonlite}, \code{dplyr}, and \code{magrittr}.
#' The \code{\%>\%} operator, used for chaining commands, is provided by the \code{magrittr} package.
#'
#' @seealso
#' \code{\link[httr]{GET}},
#' \code{\link[jsonlite]{fromJSON}},
#' \code{\link[dplyr]{select}},
#' \code{\link[dplyr]{arrange}}
#'
#' @importFrom httr GET
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr select arrange
#' @importFrom magrittr %>%
#'
#' @export
get_airports_list <- function() {
  url_airports_001 <- "https://api-colombia.com/api/v1/Airport"

  info_airports_001 <- httr::GET(url_airports_001)

  if (info_airports_001$status_code != 200) {
    message(paste("Error: Received status code", info_airports_001$status_code))
    return(NULL)
  }

  info_airports_char <- base::rawToChar(info_airports_001$content)
  info_airports_json <- jsonlite::fromJSON(info_airports_char, flatten = TRUE)

  airports_json_selected <- info_airports_json %>%
    dplyr::select(id, name, iataCode, oaciCode, type, longitude, latitude) %>%
    dplyr::arrange(name)

  return(airports_json_selected)
}
