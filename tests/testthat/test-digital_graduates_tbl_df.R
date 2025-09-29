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

# digital_graduates_tbl_df


library(testthat)

# Test dataset structure and class
test_that("digital_graduates_tbl_df loads correctly and has the expected structure", {
  expect_s3_class(digital_graduates_tbl_df, "tbl_df")  # Check if it's a tibble
  expect_equal(nrow(digital_graduates_tbl_df), 230)  # Check number of rows
  expect_equal(ncol(digital_graduates_tbl_df), 7)  # Check number of columns
  expect_equal(names(digital_graduates_tbl_df)[1], "AÑO")  # Check first column name
  expect_equal(names(digital_graduates_tbl_df)[7], "ESTRATO")  # Check last column name
})

# Test data types of columns
test_that("digital_graduates_tbl_df has correct column types", {
  expect_true(is.numeric(digital_graduates_tbl_df$AÑO))
  expect_true(is.numeric(digital_graduates_tbl_df$EDAD))
  expect_true(is.character(digital_graduates_tbl_df$GENERO))
  expect_true(is.character(digital_graduates_tbl_df$`CURSOS INSCRITOS`))
  expect_true(is.character(digital_graduates_tbl_df$ZONA))
  expect_true(is.character(digital_graduates_tbl_df$ETNIA))
  expect_true(is.numeric(digital_graduates_tbl_df$ESTRATO))
})

# Test for missing values (NA) in the dataset
test_that("digital_graduates_tbl_df reports NA values (No missing values expected)", {
  expect_false(any(is.na(digital_graduates_tbl_df$AÑO)), info = "Found NA in 'AÑO'")
  expect_false(any(is.na(digital_graduates_tbl_df$EDAD)), info = "Found NA in 'EDAD'")
  expect_false(any(is.na(digital_graduates_tbl_df$GENERO)), info = "Found NA in 'GENERO'")
  expect_false(any(is.na(digital_graduates_tbl_df$`CURSOS INSCRITOS`)), info = "Found NA in 'CURSOS INSCRITOS'")
  expect_false(any(is.na(digital_graduates_tbl_df$ZONA)), info = "Found NA in 'ZONA'")
  expect_false(any(is.na(digital_graduates_tbl_df$ETNIA)), info = "Found NA in 'ETNIA'")
  expect_false(any(is.na(digital_graduates_tbl_df$ESTRATO)), info = "Found NA in 'ESTRATO'")
})

# Test numeric columns have valid non-negative values
test_that("digital_graduates_tbl_df numeric columns have valid non-negative values", {
  numeric_cols <- c("AÑO", "EDAD", "ESTRATO")
  for (col in numeric_cols) {
    expect_true(all(digital_graduates_tbl_df[[col]] >= 0, na.rm = TRUE), info = paste("Negative values found in", col))
  }
})

# Test to verify dataset immutability
test_that("digital_graduates_tbl_df remains unchanged after tests", {
  original_dataset <- digital_graduates_tbl_df  # Copy the original dataset

  # Run example checks
  sum(is.na(digital_graduates_tbl_df$AÑO))
  sum(is.na(digital_graduates_tbl_df$EDAD))
  sum(is.na(digital_graduates_tbl_df$ESTRATO))

  # Verify the dataset hasn't changed
  expect_identical(original_dataset, digital_graduates_tbl_df)
  expect_equal(nrow(original_dataset), nrow(digital_graduates_tbl_df))
  expect_equal(ncol(original_dataset), ncol(digital_graduates_tbl_df))
  expect_equal(names(original_dataset), names(digital_graduates_tbl_df))
})



