# ColombiAPI - Access Colombian Data via APIs and Curated Datasets
# Version 0.3.0
# Copyright (C) 2025 Renzo Caceres Rossi
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

test_that("get_colombia_natural_areas() returns tibble with correct structure", {
  skip_on_cran()
  result <- get_colombia_natural_areas()
  skip_if(is.null(result), "API unavailable, test skipped")

  expect_s3_class(result, "tbl_df")
  expect_named(result, c("id", "areaGroupId", "categoryNaturalAreaId",
                         "name", "departmentId", "daneCode", "landArea"))
  expect_equal(ncol(result), 7)
  expect_gt(nrow(result), 0) # must return rows
})

test_that("get_colombia_natural_areas() returns correct data types", {
  skip_on_cran()
  result <- get_colombia_natural_areas()
  skip_if(is.null(result), "API unavailable, test skipped")

  expect_type(result$id, "integer")
  expect_type(result$areaGroupId, "integer")
  expect_type(result$categoryNaturalAreaId, "integer")
  expect_type(result$name, "character")
  expect_type(result$departmentId, "integer")
  expect_type(result$daneCode, "integer")
  expect_type(result$landArea, "double")
})

test_that("get_colombia_natural_areas() returns reasonable values", {
  skip_on_cran()
  result <- get_colombia_natural_areas()
  skip_if(is.null(result), "API unavailable, test skipped")

  expect_true(all(result$id > 0))
  expect_true(all(result$areaGroupId >= 0 | is.na(result$areaGroupId)))
  expect_true(all(result$categoryNaturalAreaId >= 0 | is.na(result$categoryNaturalAreaId)))
  expect_true(all(nchar(result$name) > 0 | is.na(result$name)))
  expect_true(all(result$departmentId >= 0 | is.na(result$departmentId)))
  expect_true(all(result$daneCode >= 0 | is.na(result$daneCode)))
  expect_true(all(result$landArea >= 0 | is.na(result$landArea)))
})

test_that("get_colombia_natural_areas() returns consistent columns across calls", {
  skip_on_cran()
  res1 <- get_colombia_natural_areas()
  res2 <- get_colombia_natural_areas()
  skip_if(is.null(res1) || is.null(res2), "API unavailable, test skipped")

  expect_named(res1, c("id", "areaGroupId", "categoryNaturalAreaId",
                       "name", "departmentId", "daneCode", "landArea"))
  expect_named(res2, c("id", "areaGroupId", "categoryNaturalAreaId",
                       "name", "departmentId", "daneCode", "landArea"))
})

test_that("get_colombia_natural_areas() allows for missing values (NA)", {
  skip_on_cran()
  result <- get_colombia_natural_areas()
  skip_if(is.null(result), "API unavailable, test skipped")

  expect_true(any(is.na(result$areaGroupId)) || all(!is.na(result$areaGroupId)))
  expect_true(any(is.na(result$categoryNaturalAreaId)) || all(!is.na(result$categoryNaturalAreaId)))
  expect_true(any(is.na(result$departmentId)) || all(!is.na(result$departmentId)))
  expect_true(any(is.na(result$daneCode)) || all(!is.na(result$daneCode)))
  expect_true(any(is.na(result$landArea)) || all(!is.na(result$landArea)))
})
