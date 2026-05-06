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

# get_colombia_hospital_beds


library(testthat)

beds_data <- get_colombia_hospital_beds()

test_that("get_colombia_hospital_beds returns valid tibble structure", {
  skip_if(is.null(beds_data), "Function returned NULL")

  expect_s3_class(beds_data, "tbl_df")
  expect_s3_class(beds_data, "data.frame")

  expect_equal(ncol(beds_data), 4)
  expect_equal(nrow(beds_data), 13)

  expect_equal(names(beds_data), c("indicator", "country", "year", "value"))
})

test_that("get_colombia_hospital_beds returns correct column types", {
  skip_if(is.null(beds_data), "Function returned NULL")

  expect_type(beds_data$indicator, "character")
  expect_type(beds_data$country, "character")
  expect_type(beds_data$year, "integer")
  expect_true(is.numeric(beds_data$value))
})

test_that("get_colombia_hospital_beds returns correct indicator and country", {
  skip_if(is.null(beds_data), "Function returned NULL")

  expect_true(all(!is.na(beds_data$indicator)))
  expect_true(all(!is.na(beds_data$country)))

  expect_true(all(
    beds_data$indicator == "Hospital beds (per 1,000 people)"
  ))

  expect_true(all(beds_data$country == "Colombia"))
})

test_that("get_colombia_hospital_beds year column is complete and valid", {
  skip_if(is.null(beds_data), "Function returned NULL")

  expect_equal(sort(beds_data$year), 2010:2022)
  expect_equal(length(unique(beds_data$year)), 13)
})

test_that("get_colombia_hospital_beds value column handles NA and valid values", {
  skip_if(is.null(beds_data), "Function returned NULL")

  # Puede haber NA (API real)
  expect_true(any(is.na(beds_data$value)))

  non_na_values <- beds_data$value[!is.na(beds_data$value)]

  if (length(non_na_values) > 0) {
    expect_true(all(non_na_values > 0))
    expect_true(all(is.finite(non_na_values)))
  }
})

test_that("get_colombia_hospital_beds returns no duplicate rows", {
  skip_if(is.null(beds_data), "Function returned NULL")

  expect_equal(nrow(beds_data), nrow(unique(beds_data)))
})
