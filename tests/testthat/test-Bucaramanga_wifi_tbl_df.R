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

# Bucaramanga_wifi_tbl_df


library(testthat)

# Test dataset structure and class
test_that("Bucaramanga_wifi_tbl_df loads correctly and has the expected structure", {
  expect_s3_class(Bucaramanga_wifi_tbl_df, "tbl_df")  # Check if it's a tibble
  expect_equal(nrow(Bucaramanga_wifi_tbl_df), 82)  # Check number of rows
  expect_equal(ncol(Bucaramanga_wifi_tbl_df), 9)  # Check number of columns
  expect_equal(names(Bucaramanga_wifi_tbl_df)[1], "NOMBRE ZONA WIFI")  # Check first column name
  expect_equal(names(Bucaramanga_wifi_tbl_df)[9], "LONGITUD")  # Check last column name
})

# Test data types of columns
test_that("Bucaramanga_wifi_tbl_df has correct column types", {
  expect_true(is.character(Bucaramanga_wifi_tbl_df$`NOMBRE ZONA WIFI`))
  expect_true(is.character(Bucaramanga_wifi_tbl_df$DIRECCION))
  expect_true(is.character(Bucaramanga_wifi_tbl_df$BARRIO))
  expect_true(is.character(Bucaramanga_wifi_tbl_df$COMUNA))
  expect_true(is.character(Bucaramanga_wifi_tbl_df$`ZONA (URBANA/RURAL)`))
  expect_true(is.character(Bucaramanga_wifi_tbl_df$DEPARTAMENTO))
  expect_true(is.character(Bucaramanga_wifi_tbl_df$MUNICIPIO))
  expect_true(is.character(Bucaramanga_wifi_tbl_df$LATITUD))
  expect_true(is.character(Bucaramanga_wifi_tbl_df$LONGITUD))
})

# Test for missing values (NA) in the dataset
test_that("Bucaramanga_wifi_tbl_df reports NA values (No missing values expected)", {
  expect_false(any(is.na(Bucaramanga_wifi_tbl_df$`NOMBRE ZONA WIFI`)), info = "Found NA in 'NOMBRE ZONA WIFI'")
  expect_false(any(is.na(Bucaramanga_wifi_tbl_df$DIRECCION)), info = "Found NA in 'DIRECCION'")
  expect_false(any(is.na(Bucaramanga_wifi_tbl_df$BARRIO)), info = "Found NA in 'BARRIO'")
  expect_false(any(is.na(Bucaramanga_wifi_tbl_df$COMUNA)), info = "Found NA in 'COMUNA'")
  expect_false(any(is.na(Bucaramanga_wifi_tbl_df$`ZONA (URBANA/RURAL)`)), info = "Found NA in 'ZONA (URBANA/RURAL)'")
  expect_false(any(is.na(Bucaramanga_wifi_tbl_df$DEPARTAMENTO)), info = "Found NA in 'DEPARTAMENTO'")
  expect_false(any(is.na(Bucaramanga_wifi_tbl_df$MUNICIPIO)), info = "Found NA in 'MUNICIPIO'")
  expect_false(any(is.na(Bucaramanga_wifi_tbl_df$LATITUD)), info = "Found NA in 'LATITUD'")
  expect_false(any(is.na(Bucaramanga_wifi_tbl_df$LONGITUD)), info = "Found NA in 'LONGITUD'")
})

# Test to verify dataset immutability
test_that("Bucaramanga_wifi_tbl_df remains unchanged after tests", {
  original_dataset <- Bucaramanga_wifi_tbl_df  # Copy the original dataset

  # Run example checks
  sum(is.na(Bucaramanga_wifi_tbl_df$`NOMBRE ZONA WIFI`))
  sum(is.na(Bucaramanga_wifi_tbl_df$LATITUD))
  sum(is.na(Bucaramanga_wifi_tbl_df$LONGITUD))

  # Verify the dataset hasn't changed
  expect_identical(original_dataset, Bucaramanga_wifi_tbl_df)
  expect_equal(nrow(original_dataset), nrow(Bucaramanga_wifi_tbl_df))
  expect_equal(ncol(original_dataset), ncol(Bucaramanga_wifi_tbl_df))
  expect_equal(names(original_dataset), names(Bucaramanga_wifi_tbl_df))
})



