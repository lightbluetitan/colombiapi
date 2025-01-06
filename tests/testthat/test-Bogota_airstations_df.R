# ColombiAPI - Access Colombia's Public Data via API Colombia
# Version 0.1.0
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

# Bogota_airstations_df dataset

library(testthat)

# Test dataset structure and class
test_that("Bogota_airstations_df loads correctly and has the expected structure", {
  expect_s3_class(Bogota_airstations_df, "data.frame")  # Check if it's a data frame
  expect_equal(nrow(Bogota_airstations_df), 10)  # Check number of rows
  expect_equal(ncol(Bogota_airstations_df), 3)  # Check number of columns
  expect_equal(names(Bogota_airstations_df)[1], "ESTACION")  # Check first column name
  expect_equal(names(Bogota_airstations_df)[3], "Y")  # Check last column name
})

# Test data types of columns
test_that("Bogota_airstations_df has correct column types", {
  expect_true(is.character(Bogota_airstations_df$ESTACION))  # Check if 'ESTACION' is character
  expect_true(is.numeric(Bogota_airstations_df$X))  # Check if 'X' is numeric
  expect_true(is.numeric(Bogota_airstations_df$Y))  # Check if 'Y' is numeric
})

# Test for missing values (NA) in the dataset
test_that("Bogota_airstations_df reports NA values in the columns (No missing values expected)", {
  # Check if there are any missing values in each of the columns
  expect_false(any(is.na(Bogota_airstations_df$ESTACION)), info = "Found NA values in 'ESTACION'")
  expect_false(any(is.na(Bogota_airstations_df$X)), info = "Found NA values in 'X'")
  expect_false(any(is.na(Bogota_airstations_df$Y)), info = "Found NA values in 'Y'")
})

# Test to verify dataset immutability
test_that("Bogota_airstations_df remains unchanged after tests", {
  original_dataset <- Bogota_airstations_df  # Create a copy of the original dataset

  # Run some example tests
  sum(is.na(Bogota_airstations_df$ESTACION))  # Example test
  sum(is.na(Bogota_airstations_df$X))  # Example test
  sum(is.na(Bogota_airstations_df$Y))  # Example test

  # Verify the dataset hasn't changed
  expect_identical(original_dataset, Bogota_airstations_df)
  expect_equal(nrow(original_dataset), nrow(Bogota_airstations_df))
  expect_equal(ncol(original_dataset), ncol(Bogota_airstations_df))
  expect_equal(names(original_dataset), names(Bogota_airstations_df))
})
