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

# Cartagena_wifi_tbl_df


library(testthat)

# Test dataset structure and class
test_that("Cartagena_wifi_tbl_df loads correctly and has the expected structure", {
  expect_s3_class(Cartagena_wifi_tbl_df, "tbl_df")  # Check if it's a tibble
  expect_equal(nrow(Cartagena_wifi_tbl_df), 468)  # Check number of rows
  expect_equal(ncol(Cartagena_wifi_tbl_df), 8)  # Check number of columns
  expect_equal(names(Cartagena_wifi_tbl_df)[1], "AÑO")  # Check first column name
  expect_equal(names(Cartagena_wifi_tbl_df)[8], "PC")  # Check last column name
})

# Test data types of columns
test_that("Cartagena_wifi_tbl_df has correct column types", {
  expect_true(is.numeric(Cartagena_wifi_tbl_df$AÑO))
  expect_true(is.character(Cartagena_wifi_tbl_df$MES))
  expect_true(is.character(Cartagena_wifi_tbl_df$`CORREGIMIENTO/BARRIO`))
  expect_true(is.character(Cartagena_wifi_tbl_df$`ZONA WIFI`))
  expect_true(is.numeric(Cartagena_wifi_tbl_df$OTRO))
  expect_true(is.numeric(Cartagena_wifi_tbl_df$SMARTPHONE))
  expect_true(is.numeric(Cartagena_wifi_tbl_df$TABLET))
  expect_true(is.numeric(Cartagena_wifi_tbl_df$PC))
})

# Test for missing values (NA) in the dataset
test_that("Cartagena_wifi_tbl_df reports NA values (No missing values expected)", {
  expect_false(any(is.na(Cartagena_wifi_tbl_df$AÑO)), info = "Found NA in 'AÑO'")
  expect_false(any(is.na(Cartagena_wifi_tbl_df$MES)), info = "Found NA in 'MES'")
  expect_false(any(is.na(Cartagena_wifi_tbl_df$`CORREGIMIENTO/BARRIO`)), info = "Found NA in 'CORREGIMIENTO/BARRIO'")
  expect_false(any(is.na(Cartagena_wifi_tbl_df$`ZONA WIFI`)), info = "Found NA in 'ZONA WIFI'")
  expect_false(any(is.na(Cartagena_wifi_tbl_df$OTRO)), info = "Found NA in 'OTRO'")
  expect_false(any(is.na(Cartagena_wifi_tbl_df$SMARTPHONE)), info = "Found NA in 'SMARTPHONE'")
  expect_false(any(is.na(Cartagena_wifi_tbl_df$TABLET)), info = "Found NA in 'TABLET'")
  expect_false(any(is.na(Cartagena_wifi_tbl_df$PC)), info = "Found NA in 'PC'")
})

# Test numeric columns have non-negative values
test_that("Cartagena_wifi_tbl_df numeric columns have non-negative values", {
  numeric_cols <- c("AÑO", "OTRO", "SMARTPHONE", "TABLET", "PC")
  for (col in numeric_cols) {
    expect_true(all(Cartagena_wifi_tbl_df[[col]] >= 0, na.rm = TRUE), info = paste("Negative values found in", col))
  }
})

# Test to verify dataset immutability
test_that("Cartagena_wifi_tbl_df remains unchanged after tests", {
  original_dataset <- Cartagena_wifi_tbl_df  # Copy the original dataset

  # Run example checks
  sum(is.na(Cartagena_wifi_tbl_df$AÑO))
  sum(is.na(Cartagena_wifi_tbl_df$MES))
  sum(is.na(Cartagena_wifi_tbl_df$PC))

  # Verify the dataset hasn't changed
  expect_identical(original_dataset, Cartagena_wifi_tbl_df)
  expect_equal(nrow(original_dataset), nrow(Cartagena_wifi_tbl_df))
  expect_equal(ncol(original_dataset), ncol(Cartagena_wifi_tbl_df))
  expect_equal(names(original_dataset), names(Cartagena_wifi_tbl_df))
})



