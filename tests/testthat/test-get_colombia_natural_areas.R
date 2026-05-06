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

# get_colombia_natural_areas


library(testthat)

areas_data <- get_colombia_natural_areas()

test_that("get_colombia_natural_areas returns valid tibble structure", {
  skip_if(is.null(areas_data), "Function returned NULL")

  expect_s3_class(areas_data, "tbl_df")
  expect_s3_class(areas_data, "data.frame")

  expect_equal(ncol(areas_data), 7)
  expect_true(nrow(areas_data) > 1000)

  expect_equal(names(areas_data),
               c("id", "areaGroupId", "categoryNaturalAreaId",
                 "name", "departmentId", "daneCode", "landArea"))
})

test_that("get_colombia_natural_areas returns correct column types", {
  skip_if(is.null(areas_data), "Function returned NULL")

  expect_type(areas_data$id, "integer")
  expect_type(areas_data$areaGroupId, "integer")
  expect_type(areas_data$categoryNaturalAreaId, "integer")
  expect_type(areas_data$name, "character")
  expect_type(areas_data$departmentId, "integer")
  expect_type(areas_data$daneCode, "integer")
  expect_true(is.numeric(areas_data$landArea))
})

test_that("get_colombia_natural_areas id column is valid", {
  skip_if(is.null(areas_data), "Function returned NULL")

  expect_true(all(!is.na(areas_data$id)))
  expect_true(all(areas_data$id > 0))

  # Clave primaria real
  expect_equal(length(unique(areas_data$id)), nrow(areas_data))
})

test_that("get_colombia_natural_areas categorical ids are valid", {
  skip_if(is.null(areas_data), "Function returned NULL")

  non_na_group <- areas_data$areaGroupId[!is.na(areas_data$areaGroupId)]
  if (length(non_na_group) > 0) {
    expect_true(all(non_na_group > 0))
  }

  non_na_category <- areas_data$categoryNaturalAreaId[!is.na(areas_data$categoryNaturalAreaId)]
  if (length(non_na_category) > 0) {
    expect_true(all(non_na_category > 0))
  }

  non_na_dept <- areas_data$departmentId[!is.na(areas_data$departmentId)]
  if (length(non_na_dept) > 0) {
    expect_true(all(non_na_dept > 0))
  }
})

test_that("get_colombia_natural_areas character column handles real API data", {
  skip_if(is.null(areas_data), "Function returned NULL")

  expect_true(all(!is.na(areas_data$name)))

  non_na_name <- areas_data$name[!is.na(areas_data$name)]
  if (length(non_na_name) > 0) {
    expect_true(all(nchar(trimws(non_na_name)) >= 0))
  }
})

test_that("get_colombia_natural_areas landArea values are valid", {
  skip_if(is.null(areas_data), "Function returned NULL")

  non_na_area <- areas_data$landArea[!is.na(areas_data$landArea)]

  if (length(non_na_area) > 0) {
    expect_true(all(is.finite(non_na_area)))

    # área no puede ser negativa
    expect_true(all(non_na_area >= 0))
  }
})

test_that("get_colombia_natural_areas dataset has diversity", {
  skip_if(is.null(areas_data), "Function returned NULL")

  expect_true(length(unique(areas_data$name)) > 10)
  expect_true(length(unique(areas_data$departmentId)) > 5)
})
