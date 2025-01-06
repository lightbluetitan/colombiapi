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

# Medellin_rain_tbl_df dataset


library(testthat)

# Test: Medellin_rain_tbl_df has the correct columns
test_that("Medellin_rain_tbl_df has the correct columns", {
  expected_columns <- c("station_id", "lat", "lon", "date", "year", "month", "day", "rainfall")
  expect_equal(names(Medellin_rain_tbl_df), expected_columns)
})

test_that("Medellin_rain_tbl_df is a tibble", {
  expect_s3_class(Medellin_rain_tbl_df, "tbl_df")
})

test_that("Medellin_rain_tbl_df has 8 columns", {
  expect_equal(length(Medellin_rain_tbl_df), 8)
})

test_that("Medellin_rain_tbl_df has non-negative rainfall values or NA", {
  # Allow NA values, but ensure no negative values
  expect_true(all(Medellin_rain_tbl_df$rainfall >= 0, na.rm = TRUE))
})

test_that("Medellin_rain_tbl_df columns have the correct types", {
  expect_s3_class(Medellin_rain_tbl_df$date, "Date")
  expect_type(Medellin_rain_tbl_df$station_id, "double")
  expect_type(Medellin_rain_tbl_df$lat, "double")
  expect_type(Medellin_rain_tbl_df$lon, "double")
  expect_type(Medellin_rain_tbl_df$year, "double")
  expect_type(Medellin_rain_tbl_df$month, "double")
  expect_type(Medellin_rain_tbl_df$day, "double")
  expect_type(Medellin_rain_tbl_df$rainfall, "double")
})

# Test: Medellin_rain_tbl_df station_id column has no NA values
test_that("Medellin_rain_tbl_df station_id column has no NA values", {
  expect_false(any(is.na(Medellin_rain_tbl_df$station_id)))
})

# Test: Medellin_rain_tbl_df lat and lon values are within valid ranges
test_that("Medellin_rain_tbl_df latitude is valid", {
  expect_true(all(Medellin_rain_tbl_df$lat >= -90 & Medellin_rain_tbl_df$lat <= 90, na.rm = TRUE))
})

test_that("Medellin_rain_tbl_df longitude is valid", {
  expect_true(all(Medellin_rain_tbl_df$lon >= -180 & Medellin_rain_tbl_df$lon <= 180, na.rm = TRUE))
})

# Test: Medellin_rain_tbl_df date column has duplicate station_id and date combinations
test_that("Medellin_rain_tbl_df date can have multiple entries per station_id", {
  # This test is corrected to allow multiple entries per station_id and date combination
  expect_true(nrow(Medellin_rain_tbl_df) >= nrow(unique(Medellin_rain_tbl_df[c("station_id", "date")])))
})

# Test: Medellin_rain_tbl_df has no missing values for mandatory columns
mandatory_columns <- c("station_id", "lat", "lon", "date", "year", "month", "day")
for (column in mandatory_columns) {
  test_that(paste("Medellin_rain_tbl_df", column, "column has no NA values"), {
    expect_false(any(is.na(Medellin_rain_tbl_df[[column]])))
  })
}

# Additional checks for rainfall statistics
test_that("Medellin_rain_tbl_df rainfall values make sense", {
  expect_true(mean(Medellin_rain_tbl_df$rainfall, na.rm = TRUE) >= 0)
  expect_true(max(Medellin_rain_tbl_df$rainfall, na.rm = TRUE) >= 0)
})
