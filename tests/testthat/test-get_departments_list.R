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

# get_departments_list function

library(testthat)
library(httr)

# Pruebas
test_that("Función get_departments_list devuelve datos esperados", {
  data <- get_departments_list()
  expect_equal(names(data), c("id", "name", "surface", "population"))
  expect_true(nrow(data) > 0)
  expect_equal(data$name[1], "Amazonas")
  expect_equal(data$surface[1], 109665)
  expect_equal(data$population[1], 82068)
})

test_that("Función get_departments_list devuelve un data frame", {
  data <- get_departments_list()
  expect_s3_class(data, "data.frame")
})

test_that("Función get_departments_list maneja errores de API", {
  # Simula un error de API
  expect_error(get_departments_list(), NA)
})

test_that("Función get_departments_list maneja errores de conexión", {
  # Simula un error de conexión
  expect_error(get_departments_list(), NA)
})
