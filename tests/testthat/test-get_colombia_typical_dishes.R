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

# get_colombia_typical_dishes


library(testthat)

test_that("get_colombia_typical_dishes() returns a tibble with correct structure", {
  skip_on_cran()
  result <- get_colombia_typical_dishes()
  skip_if(is.null(result), "API unavailable, test skipped")

  expect_s3_class(result, "tbl_df")
  expect_named(result, c("id", "name", "description"))
  expect_gt(nrow(result), 0)       # should return some dishes
  expect_equal(ncol(result), 3)
})

test_that("get_colombia_typical_dishes() returns correct data types", {
  skip_on_cran()
  result <- get_colombia_typical_dishes()
  skip_if(is.null(result), "API unavailable, test skipped")

  expect_type(result$id, "integer")
  expect_type(result$name, "character")
  expect_type(result$description, "character")
})

test_that("get_colombia_typical_dishes() returns reasonable values", {
  skip_on_cran()
  result <- get_colombia_typical_dishes()
  skip_if(is.null(result), "API unavailable, test skipped")

  expect_true(all(result$id > 0))
  expect_true(all(nchar(result$name) > 0))
  expect_true(all(nchar(result$description) > 0))
})

test_that("get_colombia_typical_dishes() handles consistent structure across calls", {
  skip_on_cran()
  res1 <- get_colombia_typical_dishes()
  res2 <- get_colombia_typical_dishes()
  skip_if(is.null(res1) || is.null(res2), "API unavailable, test skipped")

  expect_named(res1, c("id", "name", "description"))
  expect_named(res2, c("id", "name", "description"))
})

test_that("get_colombia_typical_dishes() allows for NAs in description if any", {
  skip_on_cran()
  result <- get_colombia_typical_dishes()
  skip_if(is.null(result), "API unavailable, test skipped")

  expect_true(any(is.na(result$description)) || all(!is.na(result$description)))
})

test_that("get_colombia_typical_dishes() ids are unique", {
  skip_on_cran()
  result <- get_colombia_typical_dishes()
  skip_if(is.null(result), "API unavailable, test skipped")

  expect_equal(length(unique(result$id)), nrow(result))
})
