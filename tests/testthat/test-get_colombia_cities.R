# ColombiAPI - Access Colombian Data via APIs and Curated Datasets
# Version 0.3.2
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

# get_colombia_cities

library(testthat)

cities_data <- get_colombia_cities()

test_that("get_colombia_cities returns valid tibble structure", {
  skip_if(is.null(cities_data), "Function returned NULL")
  expect_s3_class(cities_data, "tbl_df")
  expect_s3_class(cities_data, "data.frame")
  expect_equal(ncol(cities_data), 2)
  expect_equal(nrow(cities_data), 1123)
  expect_equal(names(cities_data), c("id", "name"))
})

test_that("get_colombia_cities returns correct column types", {
  skip_if(is.null(cities_data), "Function returned NULL")
  expect_type(cities_data$id, "integer")
  expect_type(cities_data$name, "character")
})

test_that("get_colombia_cities returns correct country data", {
  skip_if(is.null(cities_data), "Function returned NULL")
  expect_true(all(!is.na(cities_data$name)))
  expect_true(all(!is.na(cities_data$id)))
  expect_true(any(grepl("Bogotá", cities_data$name, ignore.case = TRUE)))
  expect_true(any(grepl("Medellín", cities_data$name, ignore.case = TRUE)))
})

test_that("get_colombia_cities id column has valid values", {
  skip_if(is.null(cities_data), "Function returned NULL")
  expect_true(all(cities_data$id > 0))
  expect_true(all(is.finite(cities_data$id)))
  expect_equal(length(unique(cities_data$id)), nrow(cities_data))
})

test_that("get_colombia_cities name column has valid values", {
  skip_if(is.null(cities_data), "Function returned NULL")
  expect_true(all(nchar(cities_data$name) > 0))
  expect_true(all(!is.na(cities_data$name)))
})

test_that("get_colombia_cities returns no duplicate rows", {
  skip_if(is.null(cities_data), "Function returned NULL")
  expect_equal(nrow(cities_data), nrow(unique(cities_data)))
})
