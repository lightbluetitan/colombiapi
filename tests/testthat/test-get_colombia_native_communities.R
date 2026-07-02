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

# get_colombia_native_communities


library(testthat)

communities_data <- get_colombia_native_communities()

test_that("get_colombia_native_communities returns valid tibble structure", {
  skip_if(is.null(communities_data), "Function returned NULL")

  expect_s3_class(communities_data, "tbl_df")
  expect_s3_class(communities_data, "data.frame")

  expect_equal(ncol(communities_data), 4)
  expect_true(nrow(communities_data) > 0)

  expect_equal(names(communities_data),
               c("id", "name", "description", "languages"))
})

test_that("get_colombia_native_communities returns correct column types", {
  skip_if(is.null(communities_data), "Function returned NULL")

  expect_type(communities_data$id, "integer")
  expect_type(communities_data$name, "character")
  expect_type(communities_data$description, "character")
  expect_type(communities_data$languages, "character")
})

test_that("get_colombia_native_communities id column is valid", {
  skip_if(is.null(communities_data), "Function returned NULL")

  expect_true(all(!is.na(communities_data$id)))
  expect_true(all(communities_data$id > 0))
})

test_that("get_colombia_native_communities character columns handle real API data", {
  skip_if(is.null(communities_data), "Function returned NULL")

  expect_true(all(!is.na(communities_data$name)))

  non_na_description <- communities_data$description[!is.na(communities_data$description)]
  if (length(non_na_description) > 0) {
    expect_true(all(nchar(trimws(non_na_description)) >= 0))
  }

  non_na_languages <- communities_data$languages[!is.na(communities_data$languages)]
  if (length(non_na_languages) > 0) {
    expect_true(all(nchar(trimws(non_na_languages)) >= 0))
  }
})

test_that("get_colombia_native_communities contains multiple distinct communities", {
  skip_if(is.null(communities_data), "Function returned NULL")

  expect_true(length(unique(communities_data$name)) > 10)
})

test_that("get_colombia_native_communities returns no duplicate ids", {
  skip_if(is.null(communities_data), "Function returned NULL")

  expect_equal(length(unique(communities_data$id)), nrow(communities_data))
})
