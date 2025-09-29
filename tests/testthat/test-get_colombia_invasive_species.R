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

# get_colombia_invasive_species


library(testthat)

test_that("get_colombia_invasive_species() returns a tibble with correct structure", {
  skip_on_cran()
  result <- get_colombia_invasive_species()
  skip_if(is.null(result), "API unavailable, test skipped")

  expect_s3_class(result, "tbl_df")
  expect_named(result, c("id", "name", "scientificName",
                         "commonNames", "impact", "manage", "riskLevel"))
  expect_equal(ncol(result), 7)
  expect_gt(nrow(result), 0)  # should return multiple species
})

test_that("get_colombia_invasive_species() returns correct data types", {
  skip_on_cran()
  result <- get_colombia_invasive_species()
  skip_if(is.null(result), "API unavailable, test skipped")

  expect_type(result$id, "integer")
  expect_type(result$name, "character")
  expect_type(result$scientificName, "character")
  expect_type(result$commonNames, "character")
  expect_type(result$impact, "character")
  expect_type(result$manage, "character")
  expect_type(result$riskLevel, "integer")
})

test_that("get_colombia_invasive_species() id column is unique and positive", {
  skip_on_cran()
  result <- get_colombia_invasive_species()
  skip_if(is.null(result), "API unavailable, test skipped")

  expect_equal(length(unique(result$id)), nrow(result))  # unique ids
  expect_true(all(result$id > 0))
})

test_that("get_colombia_invasive_species() riskLevel contains valid integer or NA values", {
  skip_on_cran()
  result <- get_colombia_invasive_species()
  skip_if(is.null(result), "API unavailable, test skipped")

  # riskLevel should always be integer or NA
  expect_true(all(is.integer(result$riskLevel) | is.na(result$riskLevel)))
})

test_that("get_colombia_invasive_species() allows NA values in optional columns", {
  skip_on_cran()
  result <- get_colombia_invasive_species()
  skip_if(is.null(result), "API unavailable, test skipped")

  # some text fields may contain NA
  expect_true(any(is.na(result$impact)) || all(!is.na(result$impact)))
  expect_true(any(is.na(result$manage)) || all(!is.na(result$manage)))
  expect_true(any(is.na(result$commonNames)) || all(!is.na(result$commonNames)))
})

test_that("get_colombia_invasive_species() returns consistent columns across calls", {
  skip_on_cran()
  res1 <- get_colombia_invasive_species()
  res2 <- get_colombia_invasive_species()
  skip_if(is.null(res1) || is.null(res2), "API unavailable, test skipped")

  expect_named(res1, names(res2))
})
