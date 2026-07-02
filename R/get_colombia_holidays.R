# ColombiAPI - Access Colombian Data via APIs and Curated Datasets
# Version 0.4.0
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

#' Get Official Public Holidays in Colombia for a Given Year
#'
#' @description
#' Retrieves the list of official public holidays in Colombia for a specific year
#' using the Nager.Date public holidays API.
#' This function returns a tibble containing the date of the holiday, the name
#' in the local language (Spanish), and the English name.
#' It is useful for academic, planning, and data analysis purposes.
#' The information is retrieved directly from the Nager.Date API and reflects
#' the current status of holidays for the requested year.
#' The field names returned are consistent with the API structure.
#'
#' @param year An integer indicating the year (e.g., 2024 or 2025).
#'
#' @return A tibble with the following columns:
#' \itemize{
#'   \item \code{date}: Date of the holiday (class \code{Date})
#'   \item \code{local_name}: Holiday name in the local language (Spanish)
#'   \item \code{name}: Holiday name in English
#' }
#'
#' @details
#' This function sends a GET request to the Nager.Date API.
#' If the API request fails or returns an error status code,
#' the function returns \code{NULL} with an informative message.
#'
#' @note Requires internet connection.
#'
#' @source Data obtained from the Nager.Date API: \url{https://date.nager.at/}
#'
#' @examples
#' if (interactive()) {
#'   get_colombia_holidays(2024)
#' }
#'
#' @seealso \code{\link[httr]{GET}}, \code{\link[jsonlite]{fromJSON}}, \code{\link[tibble]{tibble}}
#'
#' @importFrom httr GET timeout status_code content
#' @importFrom jsonlite fromJSON
#' @importFrom tibble tibble
#'
#' @export
get_colombia_holidays <- function(year) {
  if (!is.numeric(year) || length(year) != 1) {
    message("`year` must be a single numeric value.")
    return(NULL)
  }
  url <- sprintf(
    "https://date.nager.at/api/v3/PublicHolidays/%s/CO",
    as.integer(year)
  )
  res <- tryCatch(
    httr::GET(url, httr::timeout(10)),
    error = function(e) {
      message("Nager.Date API request failed: ", e$message)
      return(NULL)
    }
  )
  if (is.null(res)) {
    return(NULL)
  }
  if (httr::status_code(res) != 200) {
    message("Nager.Date API returned status: ", httr::status_code(res))
    return(NULL)
  }
  txt <- tryCatch(
    httr::content(res, as = "text", encoding = "UTF-8"),
    error = function(e) return(NULL)
  )
  if (is.null(txt)) {
    return(NULL)
  }
  data <- tryCatch(
    jsonlite::fromJSON(txt),
    error = function(e) return(NULL)
  )
  if (is.null(data) || nrow(data) == 0) {
    message("No holiday data available for the specified year.")
    return(NULL)
  }
  tibble::tibble(
    date       = as.Date(data$date),
    local_name = data$localName,
    name       = data$name
  )
}
