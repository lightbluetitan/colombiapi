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

# get_colombia_departments


library(testthat)

departments_data <- get_colombia_departments()

test_that("get_colombia_departments returns valid tibble structure", {
  skip_if(is.null(departments_data), "Function returned NULL")
  expect_s3_class(departments_data, "tbl_df")
  expect_s3_class(departments_data, "data.frame")
  expect_equal(ncol(departments_data), 8)
  expect_equal(nrow(departments_data), 33)
  expect_equal(names(departments_data), c("id", "name", "capital", "surface",
                                          "population", "municipalities",
                                          "phone_prefix", "region_id"))
})

test_that("get_colombia_departments returns correct column types", {
  skip_if(is.null(departments_data), "Function returned NULL")
  expect_type(departments_data$id, "integer")
  expect_type(departments_data$name, "character")
  expect_type(departments_data$capital, "character")
  expect_type(departments_data$surface, "integer")
  expect_type(departments_data$population, "integer")
  expect_type(departments_data$municipalities, "integer")
  expect_type(departments_data$phone_prefix, "character")
  expect_type(departments_data$region_id, "integer")
})

test_that("get_colombia_departments returns correct country data", {
  skip_if(is.null(departments_data), "Function returned NULL")
  expect_true(all(!is.na(departments_data$name)))
  expect_true(all(!is.na(departments_data$capital)))
  expect_true(any(grepl("Bogotá", departments_data$name, ignore.case = TRUE)))
  expect_true(any(grepl("Barranquilla", departments_data$capital, ignore.case = TRUE)))
})

test_that("get_colombia_departments numeric columns have valid values", {
  skip_if(is.null(departments_data), "Function returned NULL")
  non_na_surface <- departments_data$surface[!is.na(departments_data$surface)]
  if (length(non_na_surface) > 0) {
    expect_true(all(non_na_surface > 0))
    expect_true(all(is.finite(non_na_surface)))
  }
  non_na_population <- departments_data$population[!is.na(departments_data$population)]
  if (length(non_na_population) > 0) {
    expect_true(all(non_na_population > 0))
    expect_true(all(is.finite(non_na_population)))
  }
  non_na_municipalities <- departments_data$municipalities[!is.na(departments_data$municipalities)]
  if (length(non_na_municipalities) > 0) {
    expect_true(all(non_na_municipalities > 0))
    expect_true(all(is.finite(non_na_municipalities)))
  }
})

test_that("get_colombia_departments id and region_id are valid", {
  skip_if(is.null(departments_data), "Function returned NULL")
  expect_true(all(departments_data$id > 0))
  expect_true(all(!is.na(departments_data$id)))
  non_na_region <- departments_data$region_id[!is.na(departments_data$region_id)]
  if (length(non_na_region) > 0) {
    expect_true(all(non_na_region > 0))
  }
})

test_that("get_colombia_departments returns no duplicate rows", {
  skip_if(is.null(departments_data), "Function returned NULL")
  expect_equal(nrow(departments_data), nrow(unique(departments_data)))
})
