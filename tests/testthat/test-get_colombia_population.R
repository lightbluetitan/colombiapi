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

# get_colombia_population


library(testthat)

population_data <- get_colombia_population()

test_that("get_colombia_population returns valid tibble structure", {
  skip_if(is.null(population_data), "Function returned NULL")

  expect_s3_class(population_data, "tbl_df")
  expect_s3_class(population_data, "data.frame")

  expect_equal(ncol(population_data), 5)
  expect_equal(nrow(population_data), 13)

  expect_equal(names(population_data),
               c("indicator", "country", "year", "value", "value_label"))
})

test_that("get_colombia_population returns correct column types", {
  skip_if(is.null(population_data), "Function returned NULL")

  expect_type(population_data$indicator, "character")
  expect_type(population_data$country, "character")
  expect_type(population_data$year, "integer")

  # population puede venir como integer o numeric
  expect_true(is.numeric(population_data$value))

  expect_type(population_data$value_label, "character")
})

test_that("get_colombia_population returns correct indicator and country", {
  skip_if(is.null(population_data), "Function returned NULL")

  expect_true(all(!is.na(population_data$indicator)))
  expect_true(all(!is.na(population_data$country)))

  expect_true(all(population_data$indicator == "Population, total"))
  expect_true(all(population_data$country == "Colombia"))
})

test_that("get_colombia_population year column is complete and valid", {
  skip_if(is.null(population_data), "Function returned NULL")

  expect_equal(sort(population_data$year), 2010:2022)
  expect_equal(length(unique(population_data$year)), 13)
})

test_that("get_colombia_population value column has valid values", {
  skip_if(is.null(population_data), "Function returned NULL")

  non_na_values <- population_data$value[!is.na(population_data$value)]

  if (length(non_na_values) > 0) {
    expect_true(all(is.finite(non_na_values)))

    # población siempre positiva
    expect_true(all(non_na_values > 0))
  }
})

test_that("get_colombia_population value_label is consistent with value", {
  skip_if(is.null(population_data), "Function returned NULL")

  non_na_idx <- which(!is.na(population_data$value))

  if (length(non_na_idx) > 0) {
    reconstructed <- format(population_data$value[non_na_idx], big.mark = ",", scientific = FALSE)

    expect_true(all(population_data$value_label[non_na_idx] == reconstructed))
  }
})

test_that("get_colombia_population shows consistent growth trend", {
  skip_if(is.null(population_data), "Function returned NULL")

  ordered <- population_data[order(population_data$year), ]
  non_na_values <- ordered$value[!is.na(ordered$value)]

  if (length(non_na_values) > 1) {
    # población no debería decrecer drásticamente
    diffs <- diff(non_na_values)

    expect_true(sum(diffs < 0) <= 1)
  }
})

test_that("get_colombia_population returns no duplicate rows", {
  skip_if(is.null(population_data), "Function returned NULL")

  expect_equal(nrow(population_data), nrow(unique(population_data)))
})


