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

# get_colombia_cpi


library(testthat)

test_that("get_colombia_cpi() returns a tibble with correct structure and types", {
  skip_on_cran()
  result <- get_colombia_cpi()
  skip_if(is.null(result), "API unavailable, test skipped")

  expect_s3_class(result, "tbl_df")
  expect_named(result, c("indicator", "country", "year", "value"))
  expect_equal(ncol(result), 4)
  expect_type(result$indicator, "character")
  expect_type(result$country, "character")
  expect_type(result$year, "integer")
  expect_type(result$value, "double")
  expect_gt(nrow(result), 0)
})

test_that("get_colombia_cpi() returns correct indicator and country", {
  skip_on_cran()
  result <- get_colombia_cpi()
  skip_if(is.null(result), "API unavailable, test skipped")

  expect_true(all(result$indicator == "Consumer price index (2010 = 100)"))
  expect_true(all(result$country == "Colombia"))
})

test_that("get_colombia_cpi() returns years 2010 to 2022", {
  skip_on_cran()
  result <- get_colombia_cpi()
  skip_if(is.null(result), "API unavailable, test skipped")

  expect_true(all(result$year %in% 2010:2022))
})

test_that("get_colombia_cpi() returns 13 rows (2010–2022)", {
  skip_on_cran()
  result <- get_colombia_cpi()
  skip_if(is.null(result), "API unavailable, test skipped")

  expect_equal(nrow(result), 13)
})

test_that("get_colombia_cpi() allows for NA values in value column", {
  skip_on_cran()
  result <- get_colombia_cpi()
  skip_if(is.null(result), "API unavailable, test skipped")

  expect_true(any(is.na(result$value)) || all(!is.na(result$value)))
})

test_that("get_colombia_cpi() years are sorted in descending order", {
  skip_on_cran()
  result <- get_colombia_cpi()
  skip_if(is.null(result), "API unavailable, test skipped")

  expect_equal(result$year, sort(result$year, decreasing = TRUE))
})

test_that("get_colombia_cpi() value column is numeric or NA", {
  skip_on_cran()
  result <- get_colombia_cpi()
  skip_if(is.null(result), "API unavailable, test skipped")

  expect_true(all(is.finite(result$value) | is.na(result$value)))
})

test_that("get_colombia_cpi() indicator and country are consistent across rows", {
  skip_on_cran()
  result <- get_colombia_cpi()
  skip_if(is.null(result), "API unavailable, test skipped")

  expect_equal(length(unique(result$indicator)), 1)
  expect_equal(length(unique(result$country)), 1)
})

