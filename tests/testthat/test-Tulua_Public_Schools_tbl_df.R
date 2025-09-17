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

# Tulua_Public_Schools_tbl_df dataset


library(testthat)

# Test dataset structure and class
test_that("Tulua_Public_Schools_tbl_df loads correctly and has the expected structure", {
  expect_s3_class(Tulua_Public_Schools_tbl_df, "tbl_df")  # Check if it's a tibble
  expect_equal(nrow(Tulua_Public_Schools_tbl_df), 105)  # Check number of rows
  expect_equal(ncol(Tulua_Public_Schools_tbl_df), 8)  # Check number of columns
  expect_equal(names(Tulua_Public_Schools_tbl_df)[1], "COD_DANE_INS")  # Check first column name
  expect_equal(names(Tulua_Public_Schools_tbl_df)[8], "CORDE_GEO")  # Check last column name
})

# Test data types of columns
test_that("Tulua_Public_Schools_tbl_df has correct column types", {
  expect_true(is.numeric(Tulua_Public_Schools_tbl_df$COD_DANE_INS))  # Check if 'COD_DANE_INS' is numeric
  expect_true(is.character(Tulua_Public_Schools_tbl_df$INSTITUCION))  # Check if 'INSTITUCION' is character
  expect_true(is.character(Tulua_Public_Schools_tbl_df$SEDE))  # Check if 'SEDE' is character
  expect_true(is.numeric(Tulua_Public_Schools_tbl_df$COD_DANE_SEDE))  # Check if 'COD_DANE_SEDE' is numeric
  expect_true(is.character(Tulua_Public_Schools_tbl_df$TELEFONO))  # Check if 'TELEFONO' is character
  expect_true(is.character(Tulua_Public_Schools_tbl_df$CORREOS))  # Check if 'CORREOS' is character
  expect_true(is.character(Tulua_Public_Schools_tbl_df$DIRECCIÓN))  # Check if 'DIRECCIÓN' is character
  expect_true(is.character(Tulua_Public_Schools_tbl_df$CORDE_GEO))  # Check if 'CORDE_GEO' is character
})

# Test for missing values (NA) in the dataset
test_that("Tulua_Public_Schools_tbl_df reports NA values in the columns (No missing values expected)", {
  # Check if there are any missing values in each of the columns
  expect_false(any(is.na(Tulua_Public_Schools_tbl_df$COD_DANE_INS)), info = "Found NA values in 'COD_DANE_INS'")
  expect_false(any(is.na(Tulua_Public_Schools_tbl_df$INSTITUCION)), info = "Found NA values in 'INSTITUCION'")
  expect_false(any(is.na(Tulua_Public_Schools_tbl_df$SEDE)), info = "Found NA values in 'SEDE'")
  expect_false(any(is.na(Tulua_Public_Schools_tbl_df$COD_DANE_SEDE)), info = "Found NA values in 'COD_DANE_SEDE'")
  expect_false(any(is.na(Tulua_Public_Schools_tbl_df$TELEFONO)), info = "Found NA values in 'TELEFONO'")
  expect_false(any(is.na(Tulua_Public_Schools_tbl_df$CORREOS)), info = "Found NA values in 'CORREOS'")
  expect_false(any(is.na(Tulua_Public_Schools_tbl_df$DIRECCIÓN)), info = "Found NA values in 'DIRECCIÓN'")
  expect_false(any(is.na(Tulua_Public_Schools_tbl_df$CORDE_GEO)), info = "Found NA values in 'CORDE_GEO'")
})

# Test to verify dataset immutability
test_that("Tulua_Public_Schools_tbl_df remains unchanged after tests", {
  original_dataset <- Tulua_Public_Schools_tbl_df  # Create a copy of the original dataset

  # Run some example tests
  sum(is.na(Tulua_Public_Schools_tbl_df$COD_DANE_INS))  # Example test
  sum(is.na(Tulua_Public_Schools_tbl_df$TELEFONO))  # Example test

  # Verify the dataset hasn't changed
  expect_identical(original_dataset, Tulua_Public_Schools_tbl_df)
  expect_equal(nrow(original_dataset), nrow(Tulua_Public_Schools_tbl_df))
  expect_equal(ncol(original_dataset), ncol(Tulua_Public_Schools_tbl_df))
  expect_equal(names(original_dataset), names(Tulua_Public_Schools_tbl_df))
})



