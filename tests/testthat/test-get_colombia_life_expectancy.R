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

# get_colombia_life_expectancy


library(testthat)

life_data <- get_colombia_life_expectancy()

test_that("get_colombia_life_expectancy returns valid tibble structure", {
  skip_if(is.null(life_data), "Function returned NULL")

  expect_s3_class(life_data, "tbl_df")
  expect_s3_class(life_data, "data.frame")

  expect_equal(ncol(life_data), 4)
  expect_equal(nrow(life_data), 13)

  expect_equal(names(life_data),
               c("indicator", "country", "year", "value"))
})

test_that("get_colombia_life_expectancy returns correct column types", {
  skip_if(is.null(life_data), "Function returned NULL")

  expect_type(life_data$indicator, "character")
  expect_type(life_data$country, "character")
  expect_type(life_data$year, "integer")
  expect_true(is.numeric(life_data$value))
})

test_that("get_colombia_life_expectancy returns correct indicator and country", {
  skip_if(is.null(life_data), "Function returned NULL")

  expect_true(all(!is.na(life_data$indicator)))
  expect_true(all(!is.na(life_data$country)))

  expect_true(all(
    life_data$indicator == "Life expectancy at birth, total (years)"
  ))

  expect_true(all(life_data$country == "Colombia"))
})

test_that("get_colombia_life_expectancy year column is complete and valid", {
  skip_if(is.null(life_data), "Function returned NULL")

  expect_equal(sort(life_data$year), 2010:2022)
  expect_equal(length(unique(life_data$year)), 13)
})

test_that("get_colombia_life_expectancy value column has valid values", {
  skip_if(is.null(life_data), "Function returned NULL")

  non_na_values <- life_data$value[!is.na(life_data$value)]

  if (length(non_na_values) > 0) {
    expect_true(all(is.finite(non_na_values)))

    # Validación contextual (sin ser frágil)
    expect_true(all(non_na_values > 0))
    expect_true(all(non_na_values < 100))
  }
})

test_that("get_colombia_life_expectancy returns no duplicate rows", {
  skip_if(is.null(life_data), "Function returned NULL")

  expect_equal(nrow(life_data), nrow(unique(life_data)))
})






