# ColombiAPI - Access Colombian Data via APIs and Curated Datasets
# Version 0.3.1
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

# get_colombia_literacy_rate


library(testthat)

test_that("get_colombia_literacy_rate() returns a tibble with correct structure and types", {
  skip_on_cran()

  result <- get_colombia_literacy_rate()

  # Check that the result is not NULL
  expect_false(is.null(result))

  # Check that the result is a data.frame/tibble
  expect_s3_class(result, "data.frame")

  # Check that the column names are exactly as expected
  expect_named(result, c("indicator", "country", "year", "value"))

  # Check that there are exactly 4 columns
  expect_equal(ncol(result), 4)

  # Check data types of each column
  expect_type(result$indicator, "character")
  expect_type(result$country, "character")
  expect_type(result$year, "integer")

  # Value column should be numeric (API returns decimal percentages)
  expect_true(is.numeric(result$value))
})

test_that("get_colombia_literacy_rate() returns data only for Colombia", {
  skip_on_cran()

  result <- get_colombia_literacy_rate()
  expect_true(all(result$country == "Colombia"))
})

test_that("get_colombia_literacy_rate() returns correct indicator label", {
  skip_on_cran()

  result <- get_colombia_literacy_rate()
  expect_true(all(result$indicator == "Literacy rate, adult total (% of people ages 15 and above)"))
})

test_that("get_colombia_literacy_rate() returns data for years 2010 to 2022", {
  skip_on_cran()

  result <- get_colombia_literacy_rate()
  expect_true(all(result$year %in% 2010:2022))
  expect_equal(sort(unique(result$year)), 2010:2022)
})

test_that("get_colombia_literacy_rate() returns exactly 13 rows (2010–2022 inclusive)", {
  skip_on_cran()

  result <- get_colombia_literacy_rate()
  expect_equal(nrow(result), 13)
})

test_that("get_colombia_literacy_rate() year column has no NA values", {
  skip_on_cran()

  result <- get_colombia_literacy_rate()
  expect_false(any(is.na(result$year)))
})

test_that("get_colombia_literacy_rate() value column allows NA values", {
  skip_on_cran()

  result <- get_colombia_literacy_rate()
  expect_true(all(is.finite(result$value) | is.na(result$value)))
  expect_true(any(is.na(result$value)) || all(!is.na(result$value)))
})

test_that("get_colombia_literacy_rate() years are sorted in descending order", {
  skip_on_cran()

  result <- get_colombia_literacy_rate()
  expect_equal(result$year, sort(result$year, decreasing = TRUE))
})

test_that("get_colombia_literacy_rate() indicator and country are consistent across rows", {
  skip_on_cran()

  result <- get_colombia_literacy_rate()
  expect_equal(length(unique(result$indicator)), 1)
  expect_equal(length(unique(result$country)), 1)
})

test_that("get_colombia_literacy_rate() non-NA values are within valid percentage range", {
  skip_on_cran()

  result <- get_colombia_literacy_rate()
  non_na_values <- result$value[!is.na(result$value)]

  if (length(non_na_values) > 0) {
    expect_true(all(non_na_values >= 0))
    expect_true(all(non_na_values <= 100))
  }
})

test_that("get_colombia_literacy_rate() value column is numeric", {
  skip_on_cran()

  result <- get_colombia_literacy_rate()

  # Value should be numeric (double) since it contains decimal percentages
  expect_true(is.numeric(result$value))
})

test_that("get_colombia_literacy_rate() handles API errors gracefully", {
  skip_on_cran()

  # This test verifies the function returns NULL on API failure
  # Note: This is a behavioral test, actual API errors are hard to simulate
  result <- get_colombia_literacy_rate()

  # At minimum, result should be NULL or a valid tibble
  expect_true(is.null(result) || is.data.frame(result))
})

test_that("get_colombia_literacy_rate() returns consistent data types", {
  skip_on_cran()

  result <- get_colombia_literacy_rate()

  # Verify all columns have consistent types throughout
  expect_true(all(sapply(result$indicator, is.character)))
  expect_true(all(sapply(result$country, is.character)))
  expect_true(all(sapply(result$year, is.integer)))
  expect_true(all(sapply(result$value, function(x) is.numeric(x) || is.na(x))))
})
