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
#' @source Data obtained from the Nager.Date API: \url{https://date.nager.at/}
#'
#' @examples
#' get_colombia_holidays(2024)
#' get_colombia_holidays(2025)
#'
#' @importFrom httr GET status_code content
#' @importFrom jsonlite fromJSON
#' @importFrom tibble tibble
#'
#' @export
get_colombia_holidays <- function(year) {
  url <- sprintf("https://date.nager.at/api/v3/PublicHolidays/%s/CO", year)
  response <- httr::GET(url)
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve data from Nager.Date API. Check the year or try again later.")
  }
  data <- jsonlite::fromJSON(httr::content(response, as = "text", encoding = "UTF-8"))
  tibble::tibble(
    date = as.Date(data$date),
    local_name = data$localName,
    name = data$name
  )
}
