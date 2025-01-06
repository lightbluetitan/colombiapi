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

#' Get the List of Departments in Colombia
#'
#' This function retrieves a list of departments in Colombia from the public API
#' "https://api-colombia.com/api/v1/Department" and returns a data frame containing
#' selected information about each department, ordered by department name in alphabetical order.
#'
#' @return A data frame with the following columns:
#' \itemize{
#'   \item \code{id}: The unique identifier of the department.
#'   \item \code{name}: The name of the department.
#'   \item \code{surface}: The surface area of the department in square kilometers.
#'   \item \code{population}: The population of the department.
#' }
#'
#' @details
#' This function sends a GET request to the API, processes the JSON response,
#' and converts it into a structured data frame. The data is filtered and formatted
#' to include only relevant columns (\code{id}, \code{name}, \code{surface}, \code{population}),
#' and it is ordered by the \code{name} column in alphabetical order (A to Z).
#'
#' If the API returns a status code other than 200, the function issues a message
#' with the status code received and returns \code{NULL}.
#'
#' @examples
#' \dontrun{
#' # Retrieve the list of departments
#' departments <- get_departments_list()
#'
#' # Print the data frame
#' print(departments)
#'
#' # View the data in a spreadsheet-like interface
#' View(departments)
#'
#' # Select departments with a specific population range
#' large_departments <- departments %>%
#'   filter(population > 1000000)
#' print(large_departments)
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
get_departments_list <- function() {
  url_departments_001 <- "https://api-colombia.com/api/v1/Department"

  info_departments_001 <- httr::GET(url_departments_001)

  if (info_departments_001$status_code != 200) {
    message(paste("Error: Received status code", info_departments_001$status_code))
    return(NULL)
  }

  info_departments_char <- base::rawToChar(info_departments_001$content)
  info_departments_json <- jsonlite::fromJSON(info_departments_char, flatten = TRUE)

  departments_json_selected <- info_departments_json %>%
    dplyr::select(id, name, surface, population) %>%
    dplyr::arrange(name)

  return(departments_json_selected)
}
