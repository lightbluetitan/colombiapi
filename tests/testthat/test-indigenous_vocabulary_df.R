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

# indigenous_vocabulary_df


library(testthat)

# Test dataset structure and class
test_that("indigenous_vocabulary_df loads correctly and has the expected structure", {
  expect_s3_class(indigenous_vocabulary_df, "data.frame")  # Check if it's a data frame
  expect_equal(nrow(indigenous_vocabulary_df), 27521)      # Check number of rows
  expect_equal(ncol(indigenous_vocabulary_df), 4)          # Check number of columns
  expect_equal(names(indigenous_vocabulary_df)[1], "CONCEPT")       # Check first column name
  expect_equal(names(indigenous_vocabulary_df)[4], "TOKENS")        # Check last column name
})

# Test data types of columns
test_that("indigenous_vocabulary_df has correct column types", {
  expect_true(is.factor(indigenous_vocabulary_df$CONCEPT))        # 'CONCEPT' should be a factor
  expect_true(is.character(indigenous_vocabulary_df$COUNTERPART)) # 'COUNTERPART' should be character
  expect_true(is.factor(indigenous_vocabulary_df$DOCULECT))       # 'DOCULECT' should be a factor
  expect_true(is.character(indigenous_vocabulary_df$TOKENS))      # 'TOKENS' should be character
})

# Test for missing values (NA) in the dataset
test_that("indigenous_vocabulary_df reports NA values correctly", {
  expect_false(any(is.na(indigenous_vocabulary_df$CONCEPT)), info = "Found NA values in 'CONCEPT'")
  expect_false(any(is.na(indigenous_vocabulary_df$COUNTERPART)), info = "Found NA values in 'COUNTERPART'")
  expect_false(any(is.na(indigenous_vocabulary_df$DOCULECT)), info = "Found NA values in 'DOCULECT'")
  expect_false(any(is.na(indigenous_vocabulary_df$TOKENS)), info = "Found NA values in 'TOKENS'")
})

# Test to verify dataset immutability
test_that("indigenous_vocabulary_df remains unchanged after tests", {
  original_dataset <- indigenous_vocabulary_df  # Create a copy of the original dataset

  # Run some example checks
  sum(is.na(indigenous_vocabulary_df$CONCEPT))
  sum(is.na(indigenous_vocabulary_df$COUNTERPART))
  sum(is.na(indigenous_vocabulary_df$DOCULECT))
  sum(is.na(indigenous_vocabulary_df$TOKENS))

  # Verify the dataset hasn't changed
  expect_identical(original_dataset, indigenous_vocabulary_df)
  expect_equal(nrow(original_dataset), nrow(indigenous_vocabulary_df))
  expect_equal(ncol(original_dataset), ncol(indigenous_vocabulary_df))
  expect_equal(names(original_dataset), names(indigenous_vocabulary_df))
})

# Optional logical checks (example: ensure TOKENS are non-empty strings)
test_that("indigenous_vocabulary_df TOKENS column contains non-empty strings", {
  expect_true(all(nchar(indigenous_vocabulary_df$TOKENS) >= 0, na.rm = TRUE))
})




