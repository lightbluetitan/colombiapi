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

# get_colombia_gdp

library(testthat)

gdp_data <- get_colombia_gdp()

test_that("get_colombia_gdp returns valid tibble structure", {
  skip_if(is.null(gdp_data), "Function returned NULL")

  expect_s3_class(gdp_data, "tbl_df")
  expect_s3_class(gdp_data, "data.frame")

  expect_equal(ncol(gdp_data), 5)
  expect_equal(nrow(gdp_data), 13)

  expect_equal(names(gdp_data),
               c("indicator", "country", "year", "value", "value_label"))
})

test_that("get_colombia_gdp returns correct column types", {
  skip_if(is.null(gdp_data), "Function returned NULL")

  expect_type(gdp_data$indicator, "character")
  expect_type(gdp_data$country, "character")
  expect_type(gdp_data$year, "integer")
  expect_true(is.numeric(gdp_data$value))
  expect_type(gdp_data$value_label, "character")
})

test_that("get_colombia_gdp returns correct indicator and country", {
  skip_if(is.null(gdp_data), "Function returned NULL")

  expect_true(all(!is.na(gdp_data$indicator)))
  expect_true(all(!is.na(gdp_data$country)))

  expect_true(all(gdp_data$indicator == "GDP (current US$)"))
  expect_true(all(gdp_data$country == "Colombia"))
})

test_that("get_colombia_gdp year column is complete and valid", {
  skip_if(is.null(gdp_data), "Function returned NULL")

  expect_equal(sort(gdp_data$year), 2010:2022)
  expect_equal(length(unique(gdp_data$year)), 13)
})

test_that("get_colombia_gdp value column has valid values", {
  skip_if(is.null(gdp_data), "Function returned NULL")

  non_na_values <- gdp_data$value[!is.na(gdp_data$value)]

  if (length(non_na_values) > 0) {
    expect_true(all(non_na_values > 0))
    expect_true(all(is.finite(non_na_values)))
  }
})

test_that("get_colombia_gdp value_label integrity", {
  skip_if(is.null(gdp_data), "Function returned NULL")

  # misma longitud
  expect_equal(length(gdp_data$value_label), nrow(gdp_data))

  # donde value existe, debe haber label
  idx <- which(!is.na(gdp_data$value))
  if (length(idx) > 0) {
    expect_true(all(!is.na(gdp_data$value_label[idx])))
  }

  # formato básico: solo números y comas
  non_na_labels <- gdp_data$value_label[!is.na(gdp_data$value_label)]
  if (length(non_na_labels) > 0) {
    expect_true(all(grepl("^[0-9,]+$", non_na_labels)))
  }
})

test_that("get_colombia_gdp returns no duplicate rows", {
  skip_if(is.null(gdp_data), "Function returned NULL")

  expect_equal(nrow(gdp_data), nrow(unique(gdp_data)))
})
