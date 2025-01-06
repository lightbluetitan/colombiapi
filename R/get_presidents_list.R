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

#' Get the List of Presidents of Colombia
#'
#' This function retrieves the list of presidents of Colombia from the public API
#' "https://api-colombia.com/api/v1/President" and returns a data frame containing
#' selected information about each president, ordered by their start period date
#' in descending order (most recent first).
#'
#' @return A data frame with the following columns:
#' \itemize{
#'   \item \code{id}: The unique identifier of the president.
#'   \item \code{name}: The first name of the president.
#'   \item \code{lastName}: The last name of the president.
#'   \item \code{startPeriodDate}: The start date of the presidential period (in ISO 8601 format).
#'   \item \code{endPeriodDate}: The end date of the presidential period (in ISO 8601 format).
#'   \item \code{politicalParty}: The political party of the president.
#' }
#'
#' @details
#' This function sends a GET request to the API, processes the JSON response,
#' and converts it into a structured data frame. The data is filtered and formatted
#' to include only relevant columns, and it is ordered by the \code{startPeriodDate} column
#' in descending order.
#'
#' If the API returns a status code of 400, the function issues a warning message to inform
#' the user of the error. Any other unexpected API response is not explicitly handled and may
#' cause the function to fail.
#'
#' @examples
#' \dontrun{
#' # Retrieve the list of presidents
#' presidents <- get_president_list()
#'
#' # Print the data frame
#' print(presidents)
#'
#' # View the data in a spreadsheet-like interface
#' View(presidents)
#'
#' # Select presidents from a specific political party
#' library(dplyr)
#' liberal_presidents <- presidents %>%
#'   filter(politicalParty == "Liberal")
#' print(liberal_presidents)
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
#' @importFrom dplyr select arrange desc
#' @importFrom magrittr %>%
#'
#' @export
get_presidents_list <- function() {
  url_presidents_001 <- "https://api-colombia.com/api/v1/President"

  info_presidents_001 <- httr::GET(url_presidents_001)


  if (info_presidents_001$status_code != 200) {
    message(paste("Error: Received status code", info_presidents_001$status_code))
    return(NULL)
  }




  info_presidents_char <- base::rawToChar(info_presidents_001$content)
  info_presidents_json <- jsonlite::fromJSON(info_presidents_char, flatten = TRUE)

  presidents_json_selected <- info_presidents_json %>%
    dplyr::select(id, name, lastName, startPeriodDate, endPeriodDate, politicalParty) %>%
    dplyr::arrange(dplyr::desc(startPeriodDate))

  return(presidents_json_selected)
}
