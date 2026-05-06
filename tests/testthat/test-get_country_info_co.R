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

# get_country_info_co

library(testthat)

country_info_co <- get_country_info_co()

test_that("get_country_info_co returns valid tibble structure", {
  skip_if(is.null(country_info_co), "Function returned NULL")
  expect_s3_class(country_info_co, "tbl_df")
  expect_s3_class(country_info_co, "data.frame")
  expect_equal(nrow(country_info_co), 1)
  expect_equal(ncol(country_info_co), 8)
  expect_equal(names(country_info_co),
               c("name_common", "name_official", "region", "subregion",
                 "capital", "area", "population", "languages"))
})

test_that("get_country_info_co returns correct column types", {
  skip_if(is.null(country_info_co), "Function returned NULL")
  expect_type(country_info_co$name_common, "character")
  expect_type(country_info_co$name_official, "character")
  expect_type(country_info_co$region, "character")
  expect_type(country_info_co$subregion, "character")
  expect_type(country_info_co$capital, "character")
  expect_type(country_info_co$languages, "character")
  expect_type(country_info_co$area, "double")
  expect_true(is.numeric(country_info_co$population))
})

test_that("get_country_info_co returns expected values for Colombia", {
  skip_if(is.null(country_info_co), "Function returned NULL")
  expect_equal(country_info_co$name_common, "Colombia")
  expect_equal(country_info_co$name_official, "Republic of Colombia")
  expect_equal(country_info_co$region, "Americas")
  expect_equal(country_info_co$subregion, "South America")
  expect_equal(country_info_co$capital, "Bogotá")
  expect_equal(country_info_co$area, 1141748)
  expect_true(country_info_co$population > 40000000)
  expect_true(nchar(country_info_co$languages) > 0)
})

test_that("get_country_info_co has no missing critical values", {
  skip_if(is.null(country_info_co), "Function returned NULL")
  expect_false(is.na(country_info_co$name_common))
  expect_false(is.na(country_info_co$name_official))
  expect_false(is.na(country_info_co$region))
  expect_false(is.na(country_info_co$capital))
})
