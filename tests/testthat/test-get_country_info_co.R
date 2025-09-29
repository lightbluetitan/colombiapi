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

# get_country_info_co

library(testthat)

test_that("get_country_info_co() returns a tibble with correct structure", {
  skip_on_cran()  # Skip test on CRAN if the API is unavailable
  result <- get_country_info_co()
  # Skip if no data is returned
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_s3_class(result, "tbl_df")
  expect_named(result, c("name_common", "name_official", "region", "subregion",
                         "capital", "area", "population", "languages"))
  expect_equal(nrow(result), 1)
  expect_equal(ncol(result), 8)
})

test_that("get_country_info_co() returns correct data types", {
  skip_on_cran()
  result <- get_country_info_co()
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_type(result$name_common, "character")
  expect_type(result$name_official, "character")
  expect_type(result$region, "character")
  expect_type(result$subregion, "character")
  expect_type(result$capital, "character")
  expect_type(result$area, "double")
  expect_type(result$population, "integer")
  expect_type(result$languages, "character")
})

test_that("get_country_info_co() returns expected values for Colombia", {
  skip_on_cran()
  result <- get_country_info_co()
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_equal(result$name_common, "Colombia")
  expect_equal(result$name_official, "Republic of Colombia")
  expect_equal(result$region, "Americas")
  expect_equal(result$subregion, "South America")
  expect_equal(result$capital, "Bogotá")
  expect_true(result$area > 1000000)
  expect_true(result$population > 40000000)
  expect_true(grepl("Spanish", result$languages))
})

test_that("get_country_info_co() handles no NA values in required fields", {
  skip_on_cran()
  result <- get_country_info_co()
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_false(any(is.na(result$name_common)))
  expect_false(any(is.na(result$name_official)))
  expect_false(any(is.na(result$region)))
  expect_false(any(is.na(result$subregion)))
})

test_that("get_country_info_co() returns valid numeric values", {
  skip_on_cran()
  result <- get_country_info_co()
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_true(is.finite(result$area) || is.na(result$area))
  expect_true(is.finite(result$population) || is.na(result$population))
  expect_true(result$area > 0 || is.na(result$area))
  expect_true(result$population > 0 || is.na(result$population))
})

test_that("get_country_info_co() returns character fields as non-empty strings", {
  skip_on_cran()
  result <- get_country_info_co()
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_true(nchar(result$name_common) > 0)
  expect_true(nchar(result$name_official) > 0)
  expect_true(nchar(result$region) > 0)
  expect_true(nchar(result$subregion) > 0)
  expect_true(nchar(result$capital) > 0)
  expect_true(nchar(result$languages) > 0)
})

test_that("get_country_info_co() handles API connection gracefully", {
  # This test ensures the function returns NULL when API is unavailable
  # We can't force an API failure in testing, but we verify the structure
  # allows for NULL returns as designed
  result <- get_country_info_co()
  expect_true(is.null(result) || is.data.frame(result))
})

test_that("get_country_info_co() returns consistent structure across calls", {
  skip_on_cran()
  result1 <- get_country_info_co()
  skip_if(is.null(result1), "API unavailable, test skipped")
  result2 <- get_country_info_co()
  skip_if(is.null(result2), "API unavailable, test skipped")
  expect_named(result1, c("name_common", "name_official", "region", "subregion",
                          "capital", "area", "population", "languages"))
  expect_named(result2, c("name_common", "name_official", "region", "subregion",
                          "capital", "area", "population", "languages"))
  expect_equal(class(result1), class(result2))
})

test_that("get_country_info_co() area and population are within expected ranges", {
  skip_on_cran()
  result <- get_country_info_co()
  skip_if(is.null(result), "API unavailable, test skipped")
  # Colombia's area should be around 1,141,748 km²
  expect_true(result$area >= 1000000 && result$area <= 1500000)
  # Colombia's population should be around 50+ million
  expect_true(result$population >= 40000000 && result$population <= 60000000)
})

test_that("get_country_info_co() returns exactly one row", {
  skip_on_cran()
  result <- get_country_info_co()
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_equal(nrow(result), 1)
  expect_equal(length(result$name_common), 1)
  expect_equal(length(result$name_official), 1)
})
