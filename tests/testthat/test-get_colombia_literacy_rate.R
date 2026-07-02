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

# get_colombia_literacy_rate


library(testthat)

literacy_data <- get_colombia_literacy_rate()

test_that("get_colombia_literacy_rate returns valid tibble structure", {
  skip_if(is.null(literacy_data), "Function returned NULL")

  expect_s3_class(literacy_data, "tbl_df")
  expect_s3_class(literacy_data, "data.frame")

  expect_equal(ncol(literacy_data), 4)
  expect_equal(nrow(literacy_data), 13)

  expect_equal(names(literacy_data),
               c("indicator", "country", "year", "value"))
})

test_that("get_colombia_literacy_rate returns correct column types", {
  skip_if(is.null(literacy_data), "Function returned NULL")

  expect_type(literacy_data$indicator, "character")
  expect_type(literacy_data$country, "character")
  expect_type(literacy_data$year, "integer")
  expect_true(is.numeric(literacy_data$value))
})

test_that("get_colombia_literacy_rate returns correct indicator and country", {
  skip_if(is.null(literacy_data), "Function returned NULL")

  expect_true(all(!is.na(literacy_data$indicator)))
  expect_true(all(!is.na(literacy_data$country)))

  expect_true(all(
    literacy_data$indicator ==
      "Literacy rate, adult total (% of people ages 15 and above)"
  ))

  expect_true(all(literacy_data$country == "Colombia"))
})

test_that("get_colombia_literacy_rate year column is complete and valid", {
  skip_if(is.null(literacy_data), "Function returned NULL")

  expect_equal(sort(literacy_data$year), 2010:2022)
  expect_equal(length(unique(literacy_data$year)), 13)
})

test_that("get_colombia_literacy_rate value column handles NA and valid range", {
  skip_if(is.null(literacy_data), "Function returned NULL")

  # Puede haber NA (API real)
  expect_true(any(is.na(literacy_data$value)))

  non_na_values <- literacy_data$value[!is.na(literacy_data$value)]

  if (length(non_na_values) > 0) {
    expect_true(all(is.finite(non_na_values)))

    # Validación de dominio (porcentaje)
    expect_true(all(non_na_values >= 0))
    expect_true(all(non_na_values <= 100))
  }
})

test_that("get_colombia_literacy_rate returns no duplicate rows", {
  skip_if(is.null(literacy_data), "Function returned NULL")

  expect_equal(nrow(literacy_data), nrow(unique(literacy_data)))
})
