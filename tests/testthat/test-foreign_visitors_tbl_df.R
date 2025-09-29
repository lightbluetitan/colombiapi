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

# foreign_visitors_tbl_df



library(testthat)

# Test dataset structure and class
test_that("foreign_visitors_tbl_df loads correctly and has the expected structure", {
  expect_s3_class(foreign_visitors_tbl_df, "tbl_df")  # Check if it's a tibble
  expect_equal(nrow(foreign_visitors_tbl_df), 466915)  # Check number of rows
  expect_equal(ncol(foreign_visitors_tbl_df), 6)  # Check number of columns
  expect_equal(names(foreign_visitors_tbl_df)[1], "Año")  # Check first column name
  expect_equal(names(foreign_visitors_tbl_df)[6], "Cant Extranjeros no Residentes")  # Check last column name
})

# Test data types of columns
test_that("foreign_visitors_tbl_df has correct column types", {
  expect_true(is.numeric(foreign_visitors_tbl_df$Año))
  expect_true(is.character(foreign_visitors_tbl_df$Mes))
  expect_true(is.character(foreign_visitors_tbl_df$Departamento))
  expect_true(is.character(foreign_visitors_tbl_df$Ciudad))
  expect_true(is.character(foreign_visitors_tbl_df$PaisOEEResidencia))
  expect_true(is.numeric(foreign_visitors_tbl_df$`Cant Extranjeros no Residentes`))
})

# Test for missing values (NA) in the dataset
test_that("foreign_visitors_tbl_df reports NA values (No missing values expected)", {
  expect_false(any(is.na(foreign_visitors_tbl_df$Año)), info = "Found NA in 'Año'")
  expect_false(any(is.na(foreign_visitors_tbl_df$Mes)), info = "Found NA in 'Mes'")
  expect_false(any(is.na(foreign_visitors_tbl_df$Departamento)), info = "Found NA in 'Departamento'")
  expect_false(any(is.na(foreign_visitors_tbl_df$Ciudad)), info = "Found NA in 'Ciudad'")
  expect_false(any(is.na(foreign_visitors_tbl_df$PaisOEEResidencia)), info = "Found NA in 'PaisOEEResidencia'")
  expect_false(any(is.na(foreign_visitors_tbl_df$`Cant Extranjeros no Residentes`)), info = "Found NA in 'Cant Extranjeros no Residentes'")
})

# Test numeric columns have valid non-negative values
test_that("foreign_visitors_tbl_df numeric columns have valid non-negative values", {
  numeric_cols <- c("Año", "Cant Extranjeros no Residentes")
  for (col in numeric_cols) {
    expect_true(all(foreign_visitors_tbl_df[[col]] >= 0, na.rm = TRUE), info = paste("Negative values found in", col))
  }
})

# Test to verify dataset immutability
test_that("foreign_visitors_tbl_df remains unchanged after tests", {
  original_dataset <- foreign_visitors_tbl_df  # Copy the original dataset

  # Run example checks
  sum(is.na(foreign_visitors_tbl_df$Año))
  sum(is.na(foreign_visitors_tbl_df$`Cant Extranjeros no Residentes`))

  # Verify the dataset hasn't changed
  expect_identical(original_dataset, foreign_visitors_tbl_df)
  expect_equal(nrow(original_dataset), nrow(foreign_visitors_tbl_df))
  expect_equal(ncol(original_dataset), ncol(foreign_visitors_tbl_df))
  expect_equal(names(original_dataset), names(foreign_visitors_tbl_df))
})



