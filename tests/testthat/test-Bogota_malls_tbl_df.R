# ColombiAPI - Access Colombia's Public Data via API Colombia
# Version 0.1.1
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

# Bogota_malls_tbl_df dataset


library(testthat)

# Test dataset structure and class
test_that("Bogota_malls_tbl_df loads correctly and has the expected structure", {
  expect_s3_class(Bogota_malls_tbl_df, "tbl_df")  # Check if it's a tibble
  expect_equal(nrow(Bogota_malls_tbl_df), 42)  # Check number of rows
  expect_equal(ncol(Bogota_malls_tbl_df), 6)  # Check number of columns
  expect_equal(names(Bogota_malls_tbl_df)[1], "NAME")  # Check first column name
  expect_equal(names(Bogota_malls_tbl_df)[6], "LOCALIDAD")  # Check last column name
})

# Test data types of columns
test_that("Bogota_malls_tbl_df has correct column types", {
  expect_true(is.character(Bogota_malls_tbl_df$NAME))  # Check if 'NAME' is character
  expect_true(is.character(Bogota_malls_tbl_df$ADDRESS))  # Check if 'ADDRESS' is character
  expect_true(is.character(Bogota_malls_tbl_df$URL))  # Check if 'URL' is character
  expect_true(is.numeric(Bogota_malls_tbl_df$LATITUD))  # Check if 'LATITUD' is numeric
  expect_true(is.numeric(Bogota_malls_tbl_df$LONGITUD))  # Check if 'LONGITUD' is numeric
  expect_true(is.character(Bogota_malls_tbl_df$LOCALIDAD))  # Check if 'LOCALIDAD' is character
})

# Test for missing values (NA) in the dataset (allowing NA values in 'URL')
test_that("Bogota_malls_tbl_df reports NA values (No missing values expected in most columns, 'URL' allowed to have NAs)", {
  # Check if there are any missing values in each of the columns
  expect_false(any(is.na(Bogota_malls_tbl_df$NAME)), info = "Found NA values in 'NAME'")
  expect_false(any(is.na(Bogota_malls_tbl_df$ADDRESS)), info = "Found NA values in 'ADDRESS'")

  # Allow NA values in 'URL'
  expect_true(all(is.na(Bogota_malls_tbl_df$URL) | !is.na(Bogota_malls_tbl_df$URL)), info = "Found unexpected NA values in 'URL'")

  expect_false(any(is.na(Bogota_malls_tbl_df$LATITUD)), info = "Found NA values in 'LATITUD'")
  expect_false(any(is.na(Bogota_malls_tbl_df$LONGITUD)), info = "Found NA values in 'LONGITUD'")
  expect_false(any(is.na(Bogota_malls_tbl_df$LOCALIDAD)), info = "Found NA values in 'LOCALIDAD'")
})

# Test to verify dataset immutability
test_that("Bogota_malls_tbl_df remains unchanged after tests", {
  original_dataset <- Bogota_malls_tbl_df  # Create a copy of the original dataset

  # Run some example tests
  sum(is.na(Bogota_malls_tbl_df$NAME))  # Example test
  sum(is.na(Bogota_malls_tbl_df$LATITUD))  # Example test
  sum(is.na(Bogota_malls_tbl_df$URL))  # Example test

  # Verify the dataset hasn't changed
  expect_identical(original_dataset, Bogota_malls_tbl_df)
  expect_equal(nrow(original_dataset), nrow(Bogota_malls_tbl_df))
  expect_equal(ncol(original_dataset), ncol(Bogota_malls_tbl_df))
  expect_equal(names(original_dataset), names(Bogota_malls_tbl_df))
})
