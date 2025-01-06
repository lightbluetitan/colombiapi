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


# get_Colombia_info function


library(testthat)
library(httr)

# Define la URL de la API
api_url <- "https://api-colombia.com/api/v1/Country/Colombia"

# Función para realizar la llamada a la API
get_api_data <- function() {
  response <- GET(api_url)
  content(response, "parsed")
}

# Pruebas
test_that("Función get_Colombia_info devuelve datos esperados", {
  data <- get_Colombia_info()
  expect_equal(names(data), c("name", "surface", "population", "timeZone", "currency", "currencySymbol", "region"))
  expect_equal(nrow(data), 1)
  expect_equal(data$name, "Colombia")
  expect_equal(data$surface, 1141748)
  expect_equal(data$population, 52235050)
  expect_equal(data$timeZone, "UTC-5")
  expect_equal(data$currency, "Colombian Peso")
  expect_equal(data$currencySymbol, "$")
  expect_equal(data$region, "Americas")
})

test_that("Función get_Colombia_info devuelve un data frame", {
  data <- get_Colombia_info()
  expect_s3_class(data, "data.frame")
})
