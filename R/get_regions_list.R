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

#' Get the List of Regions in Colombia
#'
#' This function retrieves a list of regions in Colombia from the public API
#' "https://api-colombia.com/api/v1/Region" and returns a data frame containing
#' selected information about each region, ordered by region name in alphabetical order.
#'
#' @return A data frame with the following columns:
#' \itemize{
#'   \item \code{id}: The unique identifier of the region.
#'   \item \code{name}: The name of the region.
#' }
#'
#' @details
#' This function sends a GET request to the API, processes the JSON response,
#' and converts it into a structured data frame. The data is filtered and formatted
#' to include only relevant columns (\code{id} and \code{name}), and it is ordered
#' by the \code{name} column in alphabetical order (A to Z).
#'
#' If the API returns a status code other than 200, the function issues a message
#' with the status code received and returns \code{NULL}.
#'
#' @examples
#' \dontrun{
#' # Retrieve the list of regions
#' regions <- get_regions_list()
#'
#' # Print the data frame
#' print(regions)
#'
#' # View the data in a spreadsheet-like interface
#' View(regions)
#'
#' # Select regions with specific characteristics (e.g., starting with "Atlántico")
#' atlantic_regions <- regions %>%
#'   filter(grepl("^Atlántico", name))
#' print(atlantic_regions)
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
get_regions_list <- function() {
  url_regions_001 <- "https://api-colombia.com/api/v1/Region"

  info_regions_001 <- httr::GET(url_regions_001)

  if (info_regions_001$status_code != 200) {
    message(paste("Error: Received status code", info_regions_001$status_code))
    return(NULL)
  }

  info_regions_char <- base::rawToChar(info_regions_001$content)
  info_regions_json <- jsonlite::fromJSON(info_regions_char, flatten = TRUE)

  regions_json_selected <- info_regions_json %>%
    dplyr::select(id, name) %>%
    dplyr::arrange(name)

  return(regions_json_selected)
}
