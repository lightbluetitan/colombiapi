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

# get_colombia_radios



library(testthat)

radios_data <- get_colombia_radios()

test_that("get_colombia_radios returns valid tibble structure", {
  skip_if(is.null(radios_data), "Function returned NULL")

  expect_s3_class(radios_data, "tbl_df")
  expect_s3_class(radios_data, "data.frame")

  expect_equal(ncol(radios_data), 4)
  expect_true(nrow(radios_data) > 0)

  expect_equal(names(radios_data), c("id", "name", "frequency", "band"))
})

test_that("get_colombia_radios returns correct column types", {
  skip_if(is.null(radios_data), "Function returned NULL")

  expect_type(radios_data$id, "integer")
  expect_type(radios_data$name, "character")
  expect_true(is.numeric(radios_data$frequency))
  expect_type(radios_data$band, "character")
})

test_that("get_colombia_radios id values are valid", {
  skip_if(is.null(radios_data), "Function returned NULL")

  expect_true(all(!is.na(radios_data$id)))
  expect_true(all(radios_data$id > 0))
})

test_that("get_colombia_radios band contains valid categories", {
  skip_if(is.null(radios_data), "Function returned NULL")

  expect_true(all(!is.na(radios_data$band)))
  expect_true(all(nchar(radios_data$band) > 0))
})

test_that("get_colombia_radios frequency values are valid", {
  skip_if(is.null(radios_data), "Function returned NULL")

  non_na_freq <- radios_data$frequency[!is.na(radios_data$frequency)]

  if (length(non_na_freq) > 0) {
    expect_true(all(is.finite(non_na_freq)))
    # IMPORTANTE: NO se valida > 0 porque hay radios tipo Stream con frecuencia = 0
  }
})

test_that("get_colombia_radios name column has valid values", {
  skip_if(is.null(radios_data), "Function returned NULL")

  non_na_names <- radios_data$name[!is.na(radios_data$name)]

  if (length(non_na_names) > 0) {
    expect_true(all(nchar(trimws(non_na_names)) > 0))
  }
})

test_that("get_colombia_radios includes expected bands", {
  skip_if(is.null(radios_data), "Function returned NULL")

  expected_bands <- c("FM", "AM", "Stream")
  found_bands <- unique(radios_data$band)

  expect_true(any(found_bands %in% expected_bands))
})

test_that("get_colombia_radios returns no duplicate rows", {
  skip_if(is.null(radios_data), "Function returned NULL")

  expect_equal(nrow(radios_data), nrow(unique(radios_data)))
})

