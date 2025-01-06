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

# Bogota_business_Date dataset

library(testthat)

# Test dataset structure and class
test_that("Bogota_business_Date loads correctly and has the expected structure", {
  expect_s3_class(Bogota_business_Date, "Date")  # Check if it's a Date object
  expect_equal(length(Bogota_business_Date), 27173)  # Check the number of elements
})

# Test for missing values (NA) in the dataset
test_that("Bogota_business_Date reports NA values (No missing values expected)", {
  # Check if there are any missing values
  expect_false(any(is.na(Bogota_business_Date)), info = "Found NA values in the Date object")
})

# Test to verify dataset immutability
test_that("Bogota_business_Date remains unchanged after tests", {
  original_dataset <- Bogota_business_Date  # Create a copy of the original dataset

  # Run some example tests
  sum(is.na(Bogota_business_Date))  # Example test

  # Verify the dataset hasn't changed
  expect_identical(original_dataset, Bogota_business_Date)
  expect_equal(length(original_dataset), length(Bogota_business_Date))
})
