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

# school_levels_df

library(testthat)

# Test dataset structure and class
test_that("school_levels_df loads correctly and has the expected structure", {
  expect_s3_class(school_levels_df, "data.frame")  # Check if it's a data frame
  expect_equal(nrow(school_levels_df), 29)         # Check number of rows
  expect_equal(ncol(school_levels_df), 12)         # Check number of columns
  expect_equal(names(school_levels_df)[1], "Cinferior") # Check first column name
  expect_equal(names(school_levels_df)[12], "Talto")    # Check last column name
})

# Test data types of columns
test_that("school_levels_df has correct column types", {
  numeric_columns <- names(school_levels_df)
  for (col in numeric_columns) {
    expect_true(is.numeric(school_levels_df[[col]]), info = paste(col, "should be numeric"))
  }
})

# Test for missing values (NA) in the dataset
test_that("school_levels_df has no NA values", {
  for (col in names(school_levels_df)) {
    expect_false(any(is.na(school_levels_df[[col]])), info = paste("Found NA values in", col))
  }
})

# Test to verify dataset immutability
test_that("school_levels_df remains unchanged after tests", {
  original_dataset <- school_levels_df  # Create a copy of the original dataset

  # Example checks
  sum(is.na(school_levels_df$Cinferior))
  sum(is.na(school_levels_df$Cbajo))
  sum(is.na(school_levels_df$Talto))

  # Verify the dataset hasn't changed
  expect_identical(original_dataset, school_levels_df)
  expect_equal(nrow(original_dataset), nrow(school_levels_df))
  expect_equal(ncol(original_dataset), ncol(school_levels_df))
  expect_equal(names(original_dataset), names(school_levels_df))
})

# Optional logical checks for numeric columns (e.g., values should be non-negative)
test_that("school_levels_df numeric columns have valid non-negative values", {
  for (col in names(school_levels_df)) {
    expect_true(all(school_levels_df[[col]] >= 0, na.rm = TRUE), info = paste("Negative values found in", col))
  }
})
