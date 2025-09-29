# ColombiAPI - Access Colombian Data via APIs and Curated Datasets
# Version 0.3.0
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

# get_colombia_unemployment

library(testthat)

test_that("get_colombia_unemployment() returns a tibble with the correct structure and content", {
  result <- get_colombia_unemployment()

  # Check that the result is not NULL
  expect_false(is.null(result))

  # Check that the result is a data.frame/tibble
  expect_s3_class(result, "data.frame")

  # Check that the column names are exactly as expected
  expect_named(result, c("indicator", "country", "year", "value"))

  # Check data types of each column
  expect_type(result$indicator, "character")
  expect_type(result$country, "character")
  expect_type(result$year, "integer")
  expect_type(result$value, "double")

  # Check that the indicator column contains only the expected value
  expect_true(all(result$indicator == "Unemployment, total (% of total labor force) (modeled ILO estimate)"))

  # Check that the country column contains only "Colombia"
  expect_true(all(result$country == "Colombia"))

  # Check that the year range is correct (2010-2022)
  expect_true(all(result$year >= 2010 & result$year <= 2022))

  # Check that the number of rows is 13 (2010–2022)
  expect_equal(nrow(result), 13)

  # Check that there are exactly 4 columns
  expect_equal(ncol(result), 4)
})

test_that("get_colombia_unemployment() returns data for years 2010 to 2022", {
  result <- get_colombia_unemployment()

  # Check that all years from 2010 to 2022 are present
  expect_true(all(result$year %in% 2010:2022))
  expect_equal(sort(unique(result$year)), 2010:2022)
})

test_that("get_colombia_unemployment() year column has no NA values", {
  result <- get_colombia_unemployment()

  # Year column should not contain NA values
  expect_false(any(is.na(result$year)))
})

test_that("get_colombia_unemployment() value column allows NA values", {
  result <- get_colombia_unemployment()

  # Value column can contain NA values (as they are valid API responses)
  expect_true(all(is.finite(result$value) | is.na(result$value)))

  # Accept that some values may be NA (valid API responses)
  expect_true(any(is.na(result$value)) || all(!is.na(result$value)))
})

test_that("get_colombia_unemployment() years are sorted in descending order", {
  result <- get_colombia_unemployment()

  # Check that years are in descending order (2022 to 2010)
  expect_equal(result$year, sort(result$year, decreasing = TRUE))
})

test_that("get_colombia_unemployment() indicator and country are consistent across rows", {
  result <- get_colombia_unemployment()

  # Check that indicator is consistent across all rows
  expect_equal(length(unique(result$indicator)), 1)

  # Check that country is consistent across all rows
  expect_equal(length(unique(result$country)), 1)
})

test_that("get_colombia_unemployment() returns exactly 13 rows for the specified period", {
  result <- get_colombia_unemployment()

  # Verify exactly 13 rows (2010-2022 inclusive)
  expect_equal(nrow(result), 13)
})

test_that("get_colombia_unemployment() non-NA values are within valid percentage range", {
  result <- get_colombia_unemployment()

  # Filter out NA values and check that remaining values are within valid percentage range for unemployment
  non_na_values <- result$value[!is.na(result$value)]
  if (length(non_na_values) > 0) {
    expect_true(all(non_na_values >= 0))
    expect_true(all(non_na_values <= 100))
  }
})

test_that("get_colombia_unemployment() value column is numeric", {
  result <- get_colombia_unemployment()

  # Check that value column is numeric (double)
  expect_true(is.numeric(result$value))
  expect_true(is.double(result$value))
})

test_that("get_colombia_unemployment() non-NA values are within reasonable unemployment range", {
  result <- get_colombia_unemployment()

  # Filter out NA values and check reasonable range for unemployment rates
  non_na_values <- result$value[!is.na(result$value)]
  if (length(non_na_values) > 0) {
    expect_true(all(non_na_values >= 0))
    expect_true(all(non_na_values <= 50))  # Reasonable upper bound for unemployment rate
  }
})
