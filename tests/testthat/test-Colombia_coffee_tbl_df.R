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

# Colombia_coffee_tbl_df dataset


library(testthat)

# Test that the dataset exists and is a tibble
test_that("Colombia_coffee_tbl_df exists and is a tibble", {
  expect_true(exists("Colombia_coffee_tbl_df"))
  expect_s3_class(Colombia_coffee_tbl_df, "tbl_df")
})

# Test that the dataset has the expected number of columns
test_that("Colombia_coffee_tbl_df has the expected number of columns", {
  expect_equal(ncol(Colombia_coffee_tbl_df), 35)
})

# Test for the existence of specific trade value columns
test_that("Colombia_coffee_tbl_df has trade value columns", {
  trade_value_columns <- c(
    "Trade Value (US$)",
    "CIF Trade Value (US$)",
    "FOB Trade Value (US$)"
  )
  missing_columns <- trade_value_columns[!trade_value_columns %in% names(Colombia_coffee_tbl_df)]

  # Check that all trade value columns exist
  expect_true(length(missing_columns) == 0, info = paste("Missing columns:", paste(missing_columns, collapse = ", ")))
})

# Adapted test for column types
test_that("Colombia_coffee_tbl_df column types match expected functionality", {
  # CIF and FOB Trade Value columns can be logical or double, both are valid
  if (is.logical(Colombia_coffee_tbl_df$`CIF Trade Value (US$)`)) {
    expect_type(Colombia_coffee_tbl_df$`CIF Trade Value (US$)`, "logical")
  } else {
    expect_type(Colombia_coffee_tbl_df$`CIF Trade Value (US$)`, "double")
  }

  if (is.logical(Colombia_coffee_tbl_df$`FOB Trade Value (US$)`)) {
    expect_type(Colombia_coffee_tbl_df$`FOB Trade Value (US$)`, "logical")
  } else {
    expect_type(Colombia_coffee_tbl_df$`FOB Trade Value (US$)`, "double")
  }
})

# Test dataset dimensions (number of rows)
test_that("Colombia_coffee_tbl_df has the expected number of rows", {
  expect_true(nrow(Colombia_coffee_tbl_df) > 0)
})

# Test example values from the dataset for consistency
test_that("Colombia_coffee_tbl_df example values are consistent", {
  expect_equal(Colombia_coffee_tbl_df$Year[1], 2016)
  expect_equal(Colombia_coffee_tbl_df$`Trade Flow`[1], "Import")
})
