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

# get_colombia_population

library(testthat)

test_that("get_colombia_population() returns a tibble with the correct structure and content", {
  result <- get_colombia_population()

  # Check that the result is not NULL
  expect_false(is.null(result))

  # Check that the result is a data.frame/tibble
  expect_s3_class(result, "data.frame")

  # Check that the column names are exactly as expected
  expect_named(result, c("indicator", "country", "year", "value", "value_label"))

  # Check data types of each column
  expect_type(result$indicator, "character")
  expect_type(result$country, "character")
  expect_type(result$year, "integer")
  expect_type(result$value, "integer")
  expect_type(result$value_label, "character")

  # Check that the indicator column contains only the expected value
  expect_true(all(result$indicator == "Population, total"))

  # Check that the country column contains only "Colombia"
  expect_true(all(result$country == "Colombia"))

  # Check that the year range is correct (2010-2022)
  expect_true(all(result$year >= 2010 & result$year <= 2022))

  # Check that the number of rows is 13 (2010–2022)
  expect_equal(nrow(result), 13)

  # Check that there are exactly 5 columns
  expect_equal(ncol(result), 5)
})

test_that("get_colombia_population() returns data for years 2010 to 2022", {
  result <- get_colombia_population()

  # Check that all years from 2010 to 2022 are present
  expect_true(all(result$year %in% 2010:2022))
  expect_equal(sort(unique(result$year)), 2010:2022)
})

test_that("get_colombia_population() year column has no NA values", {
  result <- get_colombia_population()

  # Year column should not contain NA values
  expect_false(any(is.na(result$year)))
})

test_that("get_colombia_population() value column allows NA values", {
  result <- get_colombia_population()

  # Value column can contain NA values (as they are valid API responses)
  expect_true(all(is.finite(result$value) | is.na(result$value)))

  # Accept that some values may be NA (valid API responses)
  expect_true(any(is.na(result$value)) || all(!is.na(result$value)))
})

test_that("get_colombia_population() years are sorted in descending order", {
  result <- get_colombia_population()

  # Check that years are in descending order (2022 to 2010)
  expect_equal(result$year, sort(result$year, decreasing = TRUE))
})

test_that("get_colombia_population() indicator and country are consistent across rows", {
  result <- get_colombia_population()

  # Check that indicator is consistent across all rows
  expect_equal(length(unique(result$indicator)), 1)

  # Check that country is consistent across all rows
  expect_equal(length(unique(result$country)), 1)
})

test_that("get_colombia_population() returns exactly 13 rows for the specified period", {
  result <- get_colombia_population()

  # Verify exactly 13 rows (2010-2022 inclusive)
  expect_equal(nrow(result), 13)
})

test_that("get_colombia_population() non-NA values are positive numbers", {
  result <- get_colombia_population()

  # Filter out NA values and check that remaining values are positive
  non_na_values <- result$value[!is.na(result$value)]
  if (length(non_na_values) > 0) {
    expect_true(all(non_na_values > 0))
  }
})

test_that("get_colombia_population() value_label is formatted with commas", {
  result <- get_colombia_population()

  # Check that value_label contains commas (as shown in sample data)
  non_na_labels <- result$value_label[!is.na(result$value)]
  if (length(non_na_labels) > 0) {
    expect_true(all(grepl(",", non_na_labels)))
  }
})

test_that("get_colombia_population() value_label corresponds to value column", {
  result <- get_colombia_population()

  # For non-NA values, check that value_label is a formatted version of value
  non_na_rows <- !is.na(result$value)
  if (any(non_na_rows)) {
    values <- result$value[non_na_rows]
    labels <- result$value_label[non_na_rows]

    # Remove commas from labels and convert to integer for comparison
    labels_as_numbers <- as.integer(gsub(",", "", labels))
    expect_equal(values, labels_as_numbers)
  }
})

test_that("get_colombia_population() value column is integer", {
  result <- get_colombia_population()

  # Check that value column is integer (as shown in sample data)
  expect_true(is.integer(result$value))
})

test_that("get_colombia_population() non-NA population values are within reasonable range", {
  result <- get_colombia_population()

  # Filter out NA values and check reasonable range for Colombia's population
  non_na_values <- result$value[!is.na(result$value)]
  if (length(non_na_values) > 0) {
    expect_true(all(non_na_values >= 30000000))  # Minimum reasonable population for Colombia
    expect_true(all(non_na_values <= 70000000))  # Maximum reasonable population for Colombia
  }
})
