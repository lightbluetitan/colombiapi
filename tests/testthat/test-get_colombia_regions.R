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

# get_colombia_regions

library(testthat)

regions_data <- get_colombia_regions()

test_that("get_colombia_regions returns valid tibble structure", {
  skip_if(is.null(regions_data), "Function returned NULL")

  expect_s3_class(regions_data, "tbl_df")
  expect_s3_class(regions_data, "data.frame")

  expect_equal(ncol(regions_data), 3)
  expect_true(nrow(regions_data) > 0)

  expect_equal(names(regions_data), c("id", "name", "description"))
})

test_that("get_colombia_regions returns correct column types", {
  skip_if(is.null(regions_data), "Function returned NULL")

  expect_type(regions_data$id, "integer")
  expect_type(regions_data$name, "character")
  expect_type(regions_data$description, "character")
})

test_that("get_colombia_regions id values are valid", {
  skip_if(is.null(regions_data), "Function returned NULL")

  expect_true(all(!is.na(regions_data$id)))
  expect_true(all(regions_data$id > 0))
})

test_that("get_colombia_regions name column has valid values", {
  skip_if(is.null(regions_data), "Function returned NULL")

  non_na_names <- regions_data$name[!is.na(regions_data$name)]

  if (length(non_na_names) > 0) {
    expect_true(all(nchar(trimws(non_na_names)) > 0))
  }
})

test_that("get_colombia_regions description column has valid values", {
  skip_if(is.null(regions_data), "Function returned NULL")

  non_na_desc <- regions_data$description[!is.na(regions_data$description)]

  if (length(non_na_desc) > 0) {
    expect_true(all(nchar(trimws(non_na_desc)) > 0))
  }
})

test_that("get_colombia_regions includes known regions", {
  skip_if(is.null(regions_data), "Function returned NULL")

  expected_regions <- c("Caribe", "Andina", "Amazonía")
  found_regions <- regions_data$name

  expect_true(any(expected_regions %in% found_regions))
})

test_that("get_colombia_regions returns no duplicate rows", {
  skip_if(is.null(regions_data), "Function returned NULL")

  expect_equal(nrow(regions_data), nrow(unique(regions_data)))
})


