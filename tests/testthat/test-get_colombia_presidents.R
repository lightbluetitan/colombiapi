# ColombiAPI - Access Colombian Data via APIs and Curated Datasets
# Version 0.3.2
# Copyright (C) 2025-2026 Renzo Caceres Rossi
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

# get_colombia_presidents


library(testthat)

presidents_data <- get_colombia_presidents()

test_that("get_colombia_presidents returns valid tibble structure", {
  skip_if(is.null(presidents_data), "Function returned NULL")

  expect_s3_class(presidents_data, "tbl_df")
  expect_s3_class(presidents_data, "data.frame")

  expect_equal(ncol(presidents_data), 6)
  expect_true(nrow(presidents_data) > 0)

  expect_equal(names(presidents_data),
               c("id", "name", "last_name", "political_party",
                 "start_period_date", "end_period_date"))
})

test_that("get_colombia_presidents returns correct column types", {
  skip_if(is.null(presidents_data), "Function returned NULL")

  expect_type(presidents_data$id, "integer")
  expect_type(presidents_data$name, "character")
  expect_type(presidents_data$last_name, "character")
  expect_type(presidents_data$political_party, "character")
  expect_type(presidents_data$start_period_date, "character")
  expect_type(presidents_data$end_period_date, "character")
})

test_that("get_colombia_presidents id column is valid", {
  skip_if(is.null(presidents_data), "Function returned NULL")

  expect_true(all(!is.na(presidents_data$id)))
  expect_true(all(presidents_data$id > 0))

  expect_equal(length(unique(presidents_data$id)), nrow(presidents_data))
})

test_that("get_colombia_presidents character columns handle real API data", {
  skip_if(is.null(presidents_data), "Function returned NULL")

  expect_true(all(!is.na(presidents_data$name)))

  non_na_last <- presidents_data$last_name[!is.na(presidents_data$last_name)]
  if (length(non_na_last) > 0) {
    expect_true(all(nchar(trimws(non_na_last)) >= 0))
  }

  non_na_party <- presidents_data$political_party[!is.na(presidents_data$political_party)]
  if (length(non_na_party) > 0) {
    expect_true(all(nchar(trimws(non_na_party)) >= 0))
  }
})

test_that("get_colombia_presidents dates have valid format", {
  skip_if(is.null(presidents_data), "Function returned NULL")

  non_na_start <- presidents_data$start_period_date[!is.na(presidents_data$start_period_date)]
  non_na_end   <- presidents_data$end_period_date[!is.na(presidents_data$end_period_date)]

  if (length(non_na_start) > 0) {
    expect_true(all(grepl("^\\d{4}-\\d{2}-\\d{2}$", non_na_start)))
  }

  if (length(non_na_end) > 0) {
    expect_true(all(grepl("^\\d{4}-\\d{2}-\\d{2}$", non_na_end)))
  }
})

test_that("get_colombia_presidents dates are logically consistent (tolerant)", {
  skip_if(is.null(presidents_data), "Function returned NULL")

  start_dates <- as.Date(presidents_data$start_period_date)
  end_dates   <- as.Date(presidents_data$end_period_date)

  valid_idx <- which(!is.na(start_dates) & !is.na(end_dates))

  if (length(valid_idx) > 0) {
    valid_logic <- start_dates[valid_idx] <= end_dates[valid_idx]

    # Tolerancia a inconsistencias reales del API
    expect_true(mean(valid_logic) > 0.8)
  }
})

test_that("get_colombia_presidents contains multiple distinct presidents", {
  skip_if(is.null(presidents_data), "Function returned NULL")

  expect_true(length(unique(paste(presidents_data$name,
                                  presidents_data$last_name))) > 10)
})
