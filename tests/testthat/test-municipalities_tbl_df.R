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

# municipalities_tbl_df

library(testthat)

# Test dataset structure and class
test_that("municipalities_tbl_df loads correctly and has the expected structure", {
  expect_s3_class(municipalities_tbl_df, "tbl_df")  # Check if it's a tibble
  expect_equal(nrow(municipalities_tbl_df), 1141)  # Check number of rows
  expect_equal(ncol(municipalities_tbl_df), 2)  # Check number of columns
  expect_equal(names(municipalities_tbl_df)[1], "Departamento")  # Check first column name
  expect_equal(names(municipalities_tbl_df)[2], "Municipio")  # Check second column name
})

# Test data types of columns
test_that("municipalities_tbl_df has correct column types", {
  expect_true(is.character(municipalities_tbl_df$Departamento))  # Check if 'Departamento' is character
  expect_true(is.character(municipalities_tbl_df$Municipio))  # Check if 'Municipio' is character
})

# Test for missing values (NA) in the dataset
test_that("municipalities_tbl_df reports NA values (No missing values expected)", {
  expect_false(any(is.na(municipalities_tbl_df$Departamento)), info = "Found NA values in 'Departamento'")
  expect_false(any(is.na(municipalities_tbl_df$Municipio)), info = "Found NA values in 'Municipio'")
})

# Test to verify dataset immutability
test_that("municipalities_tbl_df remains unchanged after tests", {
  original_dataset <- municipalities_tbl_df  # Create a copy of the original dataset

  # Run some example tests
  sum(is.na(municipalities_tbl_df$Departamento))  # Example test
  sum(is.na(municipalities_tbl_df$Municipio))  # Example test

  # Verify the dataset hasn't changed
  expect_identical(original_dataset, municipalities_tbl_df)
  expect_equal(nrow(original_dataset), nrow(municipalities_tbl_df))
  expect_equal(ncol(original_dataset), ncol(municipalities_tbl_df))
  expect_equal(names(original_dataset), names(municipalities_tbl_df))
})

