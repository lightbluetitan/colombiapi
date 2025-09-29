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

# admitted_students_df


library(testthat)

# Test dataset structure and class
test_that("admitted_students_df loads correctly and has the expected structure", {
  expect_s3_class(admitted_students_df, "data.frame")  # Check if it's a data frame
  expect_equal(nrow(admitted_students_df), 445)        # Check number of rows
  expect_equal(ncol(admitted_students_df), 15)        # Check number of columns
  expect_equal(names(admitted_students_df)[1], "carr") # Check first column name
  expect_equal(names(admitted_students_df)[15], "age") # Check last column name
})

# Test data types of columns
test_that("admitted_students_df has correct column types", {
  expect_true(is.factor(admitted_students_df$carr))
  expect_true(is.numeric(admitted_students_df$mate))
  expect_true(is.numeric(admitted_students_df$cien))
  expect_true(is.numeric(admitted_students_df$soci))
  expect_true(is.numeric(admitted_students_df$text))
  expect_true(is.numeric(admitted_students_df$imag))
  expect_true(is.numeric(admitted_students_df$exam))
  expect_true(is.factor(admitted_students_df$gene))
  expect_true(is.factor(admitted_students_df$estr))
  expect_true(is.factor(admitted_students_df$orig))
  expect_true(is.factor(admitted_students_df$edad))
  expect_true(is.factor(admitted_students_df$niLE))
  expect_true(is.factor(admitted_students_df$niMa))
  expect_true(is.factor(admitted_students_df$stra))
  expect_true(is.numeric(admitted_students_df$age))
})

# Test for missing values (NA) in mandatory columns
mandatory_columns <- names(admitted_students_df)
test_that("admitted_students_df mandatory columns have no NA values", {
  for (column in mandatory_columns) {
    expect_false(any(is.na(admitted_students_df[[column]])), info = paste("Found NA values in", column))
  }
})

# Test to verify dataset immutability
test_that("admitted_students_df remains unchanged after tests", {
  original_dataset <- admitted_students_df  # Create a copy of the original dataset

  # Example checks
  sum(is.na(admitted_students_df$mate))
  sum(is.na(admitted_students_df$cien))
  sum(is.na(admitted_students_df$carr))

  # Verify the dataset hasn't changed
  expect_identical(original_dataset, admitted_students_df)
  expect_equal(nrow(original_dataset), nrow(admitted_students_df))
  expect_equal(ncol(original_dataset), ncol(admitted_students_df))
  expect_equal(names(original_dataset), names(admitted_students_df))
})

# Optional logical checks for numeric columns (e.g., scores should be non-negative)
numeric_columns <- c("mate", "cien", "soci", "text", "imag", "exam", "age")
test_that("admitted_students_df numeric columns have valid values", {
  for (col in numeric_columns) {
    expect_true(all(admitted_students_df[[col]] >= 0, na.rm = TRUE), info = paste("Negative values in", col))
  }
})





