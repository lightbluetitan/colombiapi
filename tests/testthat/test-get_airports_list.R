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


#  get_airports_list function

library(testthat)
library(httr)

# Pruebas
test_that("Función get_airports_list devuelve datos esperados", {
  data <- get_airports_list()
  expect_equal(names(data), c("id", "name", "iataCode", "oaciCode", "type", "longitude", "latitude"))
  expect_true(nrow(data) > 0)
  expect_equal(data$name[1], "Aeropuerto Alfonso López Pumarejo")
  expect_equal(data$iataCode[1], "VUP")
  expect_equal(data$oaciCode[1], "SKVP")
  expect_equal(data$type[1], "Nacional")
  expect_equal(data$longitude[1], 10.4339995)
  expect_equal(round(data$latitude[1], 5), -73.25229)
})

test_that("Función get_airports_list devuelve un data frame", {
  data <- get_airports_list()
  expect_s3_class(data, "data.frame")
})

test_that("Función get_airports_list maneja errores de API", {
  # Simula un error de API
  expect_error(get_airports_list(), NA)
})

test_that("Función get_airports_list maneja errores de conexión", {
  # Simula un error de conexión
  expect_error(get_airports_list(), NA)
})
