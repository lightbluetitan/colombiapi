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

# get_colombia_cpi


library(testthat)

cpi_data <- get_colombia_cpi()

test_that("get_colombia_cpi returns valid tibble structure", {
  skip_if(is.null(cpi_data), "Function returned NULL")
  expect_s3_class(cpi_data, "tbl_df")
  expect_s3_class(cpi_data, "data.frame")
  expect_equal(ncol(cpi_data), 4)
  expect_equal(nrow(cpi_data), 13)
  expect_equal(names(cpi_data), c("indicator", "country", "year", "value"))
})

test_that("get_colombia_cpi returns correct column types", {
  skip_if(is.null(cpi_data), "Function returned NULL")
  expect_type(cpi_data$indicator, "character")
  expect_type(cpi_data$country, "character")
  expect_type(cpi_data$year, "integer")
  expect_true(is.numeric(cpi_data$value))
})

test_that("get_colombia_cpi returns correct indicator and country", {
  skip_if(is.null(cpi_data), "Function returned NULL")
  expect_true(all(cpi_data$indicator == "Consumer price index (2010 = 100)"))
  expect_true(all(cpi_data$country == "Colombia"))
})

test_that("get_colombia_cpi year column is complete and valid", {
  skip_if(is.null(cpi_data), "Function returned NULL")
  expect_equal(sort(cpi_data$year), 2010:2022)
  expect_equal(length(unique(cpi_data$year)), 13)
})

test_that("get_colombia_cpi value column has valid values", {
  skip_if(is.null(cpi_data), "Function returned NULL")
  non_na_values <- cpi_data$value[!is.na(cpi_data$value)]
  if (length(non_na_values) > 0) {
    expect_true(all(non_na_values > 0))
    expect_true(all(is.finite(non_na_values)))
  }
})

test_that("get_colombia_cpi returns no duplicate rows", {
  skip_if(is.null(cpi_data), "Function returned NULL")
  expect_equal(nrow(cpi_data), nrow(unique(cpi_data)))
})
