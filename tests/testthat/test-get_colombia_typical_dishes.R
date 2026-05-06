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

# get_colombia_typical_dishes

library(testthat)

dishes_data <- get_colombia_typical_dishes()

test_that("get_colombia_typical_dishes returns valid tibble structure", {
  skip_if(is.null(dishes_data), "Function returned NULL")

  expect_s3_class(dishes_data, "tbl_df")
  expect_s3_class(dishes_data, "data.frame")

  expect_equal(ncol(dishes_data), 3)
  expect_true(nrow(dishes_data) > 0)

  expect_equal(names(dishes_data), c("id", "name", "description"))
})

test_that("get_colombia_typical_dishes returns correct column types", {
  skip_if(is.null(dishes_data), "Function returned NULL")

  expect_type(dishes_data$id, "integer")
  expect_type(dishes_data$name, "character")
  expect_type(dishes_data$description, "character")
})

test_that("get_colombia_typical_dishes id values are valid", {
  skip_if(is.null(dishes_data), "Function returned NULL")

  expect_true(all(!is.na(dishes_data$id)))
  expect_true(all(dishes_data$id > 0))
})

test_that("get_colombia_typical_dishes name column has valid values", {
  skip_if(is.null(dishes_data), "Function returned NULL")

  non_na_names <- dishes_data$name[!is.na(dishes_data$name)]

  if (length(non_na_names) > 0) {
    expect_true(all(nchar(trimws(non_na_names)) > 0))
  }
})

test_that("get_colombia_typical_dishes description column has valid values", {
  skip_if(is.null(dishes_data), "Function returned NULL")

  non_na_desc <- dishes_data$description[!is.na(dishes_data$description)]

  if (length(non_na_desc) > 0) {
    expect_true(all(nchar(trimws(non_na_desc)) > 0))
  }
})

test_that("get_colombia_typical_dishes includes known dishes", {
  skip_if(is.null(dishes_data), "Function returned NULL")

  expected_dishes <- c("Bandeja Paisa", "Ajiaco Santafereño", "Lechona Tolimense")
  found_dishes <- dishes_data$name

  expect_true(any(expected_dishes %in% found_dishes))
})

test_that("get_colombia_typical_dishes returns no duplicate rows", {
  skip_if(is.null(dishes_data), "Function returned NULL")

  expect_equal(nrow(dishes_data), nrow(unique(dishes_data)))
})
