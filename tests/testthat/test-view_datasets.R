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

# view_datasets() function

library(testthat)

test_that("view_datasets returns a non-empty list of datasets", {
  # Run the function and capture the result
  result <- view_datasets()

  # Check that the result is a character vector (as expected for dataset names)
  expect_type(result, "character")

  # Check that the vector is not empty (there are datasets available)
  expect_true(length(result) > 0)

  # Check that at least one of the expected datasets is present in the result
  expected_datasets <- c(
    "Bogota_airstations_df",
    "Bogota_business_Date",
    "Bogota_holidays_Date",
    "Bogota_malls_tbl_df",
    "Cannabis_Licenses_tbl_df",
    "Colombia_coffee_tbl_df",
    "Medellin_rain_tbl_df",
    "Tulua_Public_Schools_tbl_df"
  )

  # Ensure that the datasets returned by the function match the expected ones
  missing_datasets <- setdiff(expected_datasets, result)
  expect_true(length(missing_datasets) == 0, paste("Missing datasets:", paste(missing_datasets, collapse = ", ")))
})

test_that("view_datasets prints the correct message", {
  # Check that the message is printed correctly by using expect_output
  expect_output(view_datasets(), "Datasets available in the ColombiAPI package:")
})
