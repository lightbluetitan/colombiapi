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

#' Get Country Information for Colombia
#'
#' @description
#' Retrieves comprehensive country information for Colombia from the REST Countries API.
#' This function fetches data including official and common names, geographical information,
#' capital, area, population, and languages.
#'
#' @return A tibble with one row containing Colombia's country information, or NULL if the API is unavailable.
#'
#' @examples
#' \donttest{
#' co_info <- get_country_info_co()
#' print(co_info)
#' }
#'
#' @importFrom httr GET http_error content
#' @importFrom jsonlite fromJSON
#' @importFrom tibble tibble
#'
#' @export
get_country_info_co <- function() {
  url <- "https://restcountries.com/v3.1/name/colombia?fullText=true"

  # Intentar obtener los datos y capturar errores de conexión
  response <- tryCatch(
    httr::GET(url),
    error = function(e) {
      message("No se pudo conectar a restcountries.com: ", e$message)
      return(NULL)
    }
  )

  if (is.null(response)) return(NULL)  # Si la conexión falla, retornar NULL

  # Verificar código HTTP
  if (httr::http_error(response)) {
    message("API request failed with status code: ", httr::status_code(response))
    return(NULL)
  }

  # Convertir a texto y parsear JSON
  data_raw <- httr::content(response, as = "text", encoding = "UTF-8")
  data_list <- tryCatch(
    jsonlite::fromJSON(data_raw),
    error = function(e) {
      message("Error al parsear JSON: ", e$message)
      return(NULL)
    }
  )

  if (is.null(data_list) || length(data_list) == 0) {
    message("No data found for Colombia.")
    return(NULL)
  }

  # Tomar solo el primer país
  data <- data_list[1, ]

  tibble::tibble(
    name_common   = data$name$common,
    name_official = data$name$official,
    region        = data$region,
    subregion     = data$subregion,
    capital       = paste(data$capital, collapse = ", "),
    area          = data$area,
    population    = data$population,
    languages     = paste(unlist(data$languages), collapse = ", ")
  )
}
