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

# Cannabis_Licenses_tbl_df dataset

library(testthat)

# Test dataset structure and class
test_that("Cannabis_Licenses_tbl_df loads correctly and has the expected structure", {
  expect_s3_class(Cannabis_Licenses_tbl_df, "tbl_df")  # Check if it's a tibble
  expect_equal(nrow(Cannabis_Licenses_tbl_df), 92)  # Check number of rows
  expect_equal(ncol(Cannabis_Licenses_tbl_df), 10)  # Check number of columns
  expect_equal(names(Cannabis_Licenses_tbl_df)[1], "Mes")  # Check first column name
  expect_equal(names(Cannabis_Licenses_tbl_df)[10], "Año")  # Check last column name
})

# Test data types of columns
test_that("Cannabis_Licenses_tbl_df has correct column types", {
  expect_true(is.character(Cannabis_Licenses_tbl_df$Mes))  # Check if 'Mes' is character
  expect_true(is.numeric(Cannabis_Licenses_tbl_df$`Solicitudes de licencias recibidas`))  # Check if numeric
  expect_true(is.numeric(Cannabis_Licenses_tbl_df$`Solicitudes Negadas`))  # Check if numeric
  expect_true(is.numeric(Cannabis_Licenses_tbl_df$`Solicitudes Archivadas`))  # Check if numeric
  expect_true(is.numeric(Cannabis_Licenses_tbl_df$`Solicitudes Modificadas`))  # Check if numeric
  expect_true(is.numeric(Cannabis_Licenses_tbl_df$`Licencias Otorgadas`))  # Check if numeric
  expect_true(is.numeric(Cannabis_Licenses_tbl_df$`Licencias expedidas de semillas para siembra`))  # Check if numeric
  expect_true(is.numeric(Cannabis_Licenses_tbl_df$`Licencias expedidas de plantas cannabis psicoactivo`))  # Check if numeric
  expect_true(is.numeric(Cannabis_Licenses_tbl_df$`Licencias expedidas de plantas cannabis no psicoactivo`))  # Check if numeric
  expect_true(is.numeric(Cannabis_Licenses_tbl_df$Año))  # Check if 'Año' is numeric
})

# Test for missing values (NA) in the dataset
test_that("Cannabis_Licenses_tbl_df reports NA values in the columns (No missing values expected)", {
  # Check if there are any missing values in each of the columns
  expect_false(any(is.na(Cannabis_Licenses_tbl_df$Mes)), info = "Found NA values in 'Mes'")
  expect_false(any(is.na(Cannabis_Licenses_tbl_df$`Solicitudes de licencias recibidas`)), info = "Found NA values in 'Solicitudes de licencias recibidas'")
  expect_false(any(is.na(Cannabis_Licenses_tbl_df$`Solicitudes Negadas`)), info = "Found NA values in 'Solicitudes Negadas'")
  expect_false(any(is.na(Cannabis_Licenses_tbl_df$`Solicitudes Archivadas`)), info = "Found NA values in 'Solicitudes Archivadas'")
  expect_false(any(is.na(Cannabis_Licenses_tbl_df$`Solicitudes Modificadas`)), info = "Found NA values in 'Solicitudes Modificadas'")
  expect_false(any(is.na(Cannabis_Licenses_tbl_df$`Licencias Otorgadas`)), info = "Found NA values in 'Licencias Otorgadas'")
  expect_false(any(is.na(Cannabis_Licenses_tbl_df$`Licencias expedidas de semillas para siembra`)), info = "Found NA values in 'Licencias expedidas de semillas para siembra'")
  expect_false(any(is.na(Cannabis_Licenses_tbl_df$`Licencias expedidas de plantas cannabis psicoactivo`)), info = "Found NA values in 'Licencias expedidas de plantas cannabis psicoactivo'")
  expect_false(any(is.na(Cannabis_Licenses_tbl_df$`Licencias expedidas de plantas cannabis no psicoactivo`)), info = "Found NA values in 'Licencias expedidas de plantas cannabis no psicoactivo'")
  expect_false(any(is.na(Cannabis_Licenses_tbl_df$Año)), info = "Found NA values in 'Año'")
})

# Test to verify dataset immutability
test_that("Cannabis_Licenses_tbl_df remains unchanged after tests", {
  original_dataset <- Cannabis_Licenses_tbl_df  # Create a copy of the original dataset

  # Run some example tests
  sum(is.na(Cannabis_Licenses_tbl_df$Mes))  # Example test
  sum(is.na(Cannabis_Licenses_tbl_df$`Solicitudes de licencias recibidas`))  # Example test
  sum(is.na(Cannabis_Licenses_tbl_df$`Licencias Otorgadas`))  # Example test

  # Verify the dataset hasn't changed
  expect_identical(original_dataset, Cannabis_Licenses_tbl_df)
  expect_equal(nrow(original_dataset), nrow(Cannabis_Licenses_tbl_df))
  expect_equal(ncol(original_dataset), ncol(Cannabis_Licenses_tbl_df))
  expect_equal(names(original_dataset), names(Cannabis_Licenses_tbl_df))
})
