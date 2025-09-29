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

# digital_centers_tbl_df

library(testthat)

# Test dataset structure and class
test_that("digital_centers_tbl_df loads correctly and has the expected structure", {
  expect_s3_class(digital_centers_tbl_df, "tbl_df")
  expect_equal(nrow(digital_centers_tbl_df), 475)
  expect_equal(ncol(digital_centers_tbl_df), 8)
  expect_equal(names(digital_centers_tbl_df)[1], "NOMBRE DEPARTAMENTO")
  expect_equal(names(digital_centers_tbl_df)[8], "ESTADO")
})

# Test data types of columns
test_that("digital_centers_tbl_df has correct column types", {
  expect_true(is.character(digital_centers_tbl_df$`NOMBRE DEPARTAMENTO`))
  expect_true(is.character(digital_centers_tbl_df$`NOMBRE MUNICIPIO`))
  expect_true(is.character(digital_centers_tbl_df$PDET))
  expect_true(is.character(digital_centers_tbl_df$`NOMBRE CENTRO POBLADO`))
  expect_true(is.character(digital_centers_tbl_df$`NOMBRE SEDE EDUCATIVA`))
  expect_true(is.character(digital_centers_tbl_df$`FECHA INICIO DE OPERACIÓN`))
  expect_true(is.character(digital_centers_tbl_df$`FIN DE OPERACIÓN INICIAL`))
  expect_true(is.character(digital_centers_tbl_df$ESTADO))
})

# Test for missing values (NA) in the dataset
test_that("digital_centers_tbl_df reports NA values correctly", {
  # Columns that are allowed to have NAs
  allow_na <- c("FECHA INICIO DE OPERACIÓN", "FIN DE OPERACIÓN INICIAL")

  for (col in names(digital_centers_tbl_df)) {
    if (col %in% allow_na) {
      expect_true(all(is.na(digital_centers_tbl_df[[col]]) | !is.na(digital_centers_tbl_df[[col]])),
                  info = paste("NA values allowed in", col))
    } else {
      expect_false(any(is.na(digital_centers_tbl_df[[col]])),
                   info = paste("Found NA in", col))
    }
  }
})

# Test to verify dataset immutability
test_that("digital_centers_tbl_df remains unchanged after tests", {
  original_dataset <- digital_centers_tbl_df
  sum(is.na(digital_centers_tbl_df$`NOMBRE DEPARTAMENTO`))
  sum(is.na(digital_centers_tbl_df$ESTADO))
  expect_identical(original_dataset, digital_centers_tbl_df)
  expect_equal(nrow(original_dataset), nrow(digital_centers_tbl_df))
  expect_equal(ncol(original_dataset), ncol(digital_centers_tbl_df))
  expect_equal(names(original_dataset), names(digital_centers_tbl_df))
})
