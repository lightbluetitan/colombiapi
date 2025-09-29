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

# vehicle_count_tbl_df

library(testthat)

# Test dataset structure and class
test_that("vehicle_count_tbl_df loads correctly and has the expected structure", {
  expect_s3_class(vehicle_count_tbl_df, "tbl_df")  # Check if it's a tibble
  expect_equal(nrow(vehicle_count_tbl_df), 262114)  # Check number of rows
  expect_equal(ncol(vehicle_count_tbl_df), 4)  # Check number of columns
  expect_equal(names(vehicle_count_tbl_df)[1], "Fecha")  # Check first column name
  expect_equal(names(vehicle_count_tbl_df)[4], "Cantidad")  # Check last column name
})

# Test data types of columns
test_that("vehicle_count_tbl_df has correct column types", {
  expect_true(is.character(vehicle_count_tbl_df$Fecha))
  expect_true(is.character(vehicle_count_tbl_df$`Nombre Sensor`))
  expect_true(is.character(vehicle_count_tbl_df$`Tipo Vehiculo`))
  expect_true(is.numeric(vehicle_count_tbl_df$Cantidad))
})

# Test for missing values (NA) in the dataset
test_that("vehicle_count_tbl_df reports NA values (No missing values expected)", {
  expect_false(any(is.na(vehicle_count_tbl_df$Fecha)), info = "Found NA in 'Fecha'")
  expect_false(any(is.na(vehicle_count_tbl_df$`Nombre Sensor`)), info = "Found NA in 'Nombre Sensor'")
  expect_false(any(is.na(vehicle_count_tbl_df$`Tipo Vehiculo`)), info = "Found NA in 'Tipo Vehiculo'")
  expect_false(any(is.na(vehicle_count_tbl_df$Cantidad)), info = "Found NA in 'Cantidad'")
})

# Test numeric columns have valid non-negative values
test_that("vehicle_count_tbl_df numeric columns have valid non-negative values", {
  expect_true(all(vehicle_count_tbl_df$Cantidad >= 0, na.rm = TRUE), info = "Negative values found in 'Cantidad'")
})

# Test to verify dataset immutability
test_that("vehicle_count_tbl_df remains unchanged after tests", {
  original_dataset <- vehicle_count_tbl_df  # Copy the original dataset

  # Run example checks
  sum(is.na(vehicle_count_tbl_df$Fecha))
  sum(is.na(vehicle_count_tbl_df$`Nombre Sensor`))
  sum(is.na(vehicle_count_tbl_df$Cantidad))

  # Verify the dataset hasn't changed
  expect_identical(original_dataset, vehicle_count_tbl_df)
  expect_equal(nrow(original_dataset), nrow(vehicle_count_tbl_df))
  expect_equal(ncol(original_dataset), ncol(vehicle_count_tbl_df))
  expect_equal(names(original_dataset), names(vehicle_count_tbl_df))
})




