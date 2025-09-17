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

# get_colombia_regions

library(testthat)

test_that("get_colombia_regions() returns a tibble with correct structure", {
  skip_on_cran()  # Skip test on CRAN if the API is unavailable
  result <- get_colombia_regions()
  # Skip if no data is returned
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_s3_class(result, "tbl_df")
  expect_named(result, c("id", "name", "description"))
  expect_equal(ncol(result), 3)
  expect_equal(nrow(result), 6)  # Colombia has 6 natural regions
})

test_that("get_colombia_regions() returns correct data types", {
  skip_on_cran()
  result <- get_colombia_regions()
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_type(result$id, "integer")
  expect_type(result$name, "character")
  expect_type(result$description, "character")
})

test_that("get_colombia_regions() returns expected Colombian regions", {
  skip_on_cran()
  result <- get_colombia_regions()
  skip_if(is.null(result), "API unavailable, test skipped")
  expected_regions <- c("Caribe", "Pacífico", "Orinoquía", "Amazonía", "Andina", "Insular")
  expect_true(all(expected_regions %in% result$name))
  expect_equal(length(unique(result$name)), 6)
})

test_that("get_colombia_regions() returns valid region IDs", {
  skip_on_cran()
  result <- get_colombia_regions()
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_true(all(result$id >= 1 & result$id <= 6))
  expect_equal(length(unique(result$id)), 6)  # All IDs should be unique
  expect_false(any(is.na(result$id)))
})

test_that("get_colombia_regions() returns non-empty descriptions", {
  skip_on_cran()
  result <- get_colombia_regions()
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_true(all(nchar(result$description) > 0))
  expect_false(any(is.na(result$description)))
  expect_true(all(nchar(result$description) > 50))  # Descriptions should be substantial
})

test_that("get_colombia_regions() returns non-empty region names", {
  skip_on_cran()
  result <- get_colombia_regions()
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_true(all(nchar(result$name) > 0))
  expect_false(any(is.na(result$name)))
  expect_true(all(nchar(result$name) >= 5))  # Region names should have reasonable length
})

test_that("get_colombia_regions() handles API connection gracefully", {
  # This test ensures the function returns NULL when API is unavailable
  # We can't force an API failure in testing, but we verify the structure
  # allows for NULL returns as designed
  result <- get_colombia_regions()
  expect_true(is.null(result) || is.data.frame(result))
})

test_that("get_colombia_regions() returns consistent structure across calls", {
  skip_on_cran()
  result1 <- get_colombia_regions()
  skip_if(is.null(result1), "API unavailable, test skipped")
  result2 <- get_colombia_regions()
  skip_if(is.null(result2), "API unavailable, test skipped")
  expect_named(result1, c("id", "name", "description"))
  expect_named(result2, c("id", "name", "description"))
  expect_equal(class(result1), class(result2))
  expect_equal(nrow(result1), nrow(result2))
})

test_that("get_colombia_regions() IDs are sequential and start from 1", {
  skip_on_cran()
  result <- get_colombia_regions()
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_equal(sort(result$id), 1:6)
  expect_true(min(result$id) == 1)
  expect_true(max(result$id) == 6)
})

test_that("get_colombia_regions() contains specific region names", {
  skip_on_cran()
  result <- get_colombia_regions()
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_true("Caribe" %in% result$name)
  expect_true("Pacífico" %in% result$name)
  expect_true("Orinoquía" %in% result$name)
  expect_true("Amazonía" %in% result$name)
  expect_true("Andina" %in% result$name)
  expect_true("Insular" %in% result$name)
})

test_that("get_colombia_regions() descriptions contain region-specific keywords", {
  skip_on_cran()
  result <- get_colombia_regions()
  skip_if(is.null(result), "API unavailable, test skipped")
  caribe_desc <- result$description[result$name == "Caribe"]
  pacifico_desc <- result$description[result$name == "Pacífico"]
  orinoquia_desc <- result$description[result$name == "Orinoquía"]
  amazonia_desc <- result$description[result$name == "Amazonía"]
  andina_desc <- result$description[result$name == "Andina"]
  insular_desc <- result$description[result$name == "Insular"]

  expect_true(grepl("caribe|Caribe", caribe_desc, ignore.case = TRUE))
  expect_true(grepl("pacífico|Pacífico|pacifico|Pacifico", pacifico_desc, ignore.case = TRUE))
  expect_true(grepl("orinoquia|Orinoquia", orinoquia_desc, ignore.case = TRUE))
  expect_true(grepl("amazónica|amazonica|Amazónica|Amazonica", amazonia_desc, ignore.case = TRUE))
  expect_true(grepl("andina|Andina", andina_desc, ignore.case = TRUE))
  expect_true(grepl("insular|Insular", insular_desc, ignore.case = TRUE))
})

test_that("get_colombia_regions() returns exactly 6 unique regions", {
  skip_on_cran()
  result <- get_colombia_regions()
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_equal(nrow(result), 6)
  expect_equal(length(unique(result$id)), 6)
  expect_equal(length(unique(result$name)), 6)
})
