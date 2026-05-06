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

# get_colombia_holidays


library(testthat)

holidays_data <- get_colombia_holidays(2026)

test_that("get_colombia_holidays returns valid tibble structure", {
  skip_if(is.null(holidays_data), "Function returned NULL")

  expect_s3_class(holidays_data, "tbl_df")
  expect_s3_class(holidays_data, "data.frame")
  expect_equal(ncol(holidays_data), 3)
  expect_true(nrow(holidays_data) > 0)

  expect_equal(names(holidays_data), c("date", "local_name", "name"))
})

test_that("get_colombia_holidays returns correct column types", {
  skip_if(is.null(holidays_data), "Function returned NULL")

  expect_s3_class(holidays_data$date, "Date")
  expect_type(holidays_data$local_name, "character")
  expect_type(holidays_data$name, "character")
})

test_that("get_colombia_holidays includes major holidays", {
  skip_if(is.null(holidays_data), "Function returned NULL")

  # Validación semántica débil (no frágil)
  major_holidays <- c("New Year's Day", "Christmas Day")
  found_holidays <- sum(major_holidays %in% holidays_data$name)

  expect_true(found_holidays > 0)
  expect_true(nrow(holidays_data) >= 10)
})

test_that("get_colombia_holidays dates are valid and in correct year", {
  skip_if(is.null(holidays_data), "Function returned NULL")

  expect_false(any(is.na(holidays_data$date)))
  expect_true(all(format(holidays_data$date, "%Y") == "2026"))
})

test_that("get_colombia_holidays handles invalid input", {
  expect_null(get_colombia_holidays("2026"))
  expect_null(get_colombia_holidays(c(2026, 2027)))
  expect_null(get_colombia_holidays(NA))
  expect_null(get_colombia_holidays(999))
  expect_null(get_colombia_holidays(3000))
})

test_that("get_colombia_holidays returns no duplicate dates", {
  skip_if(is.null(holidays_data), "Function returned NULL")

  expect_equal(nrow(holidays_data), length(unique(holidays_data$date)))
})
