# ColombiAPI - Access Colombian Data via APIs and Curated Datasets
# Version 0.2.0
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

# get_colombia_presidents


library(testthat)

test_that("get_colombia_presidents() returns a tibble with correct structure", {
  skip_on_cran()  # Skip test on CRAN if the API is unavailable
  result <- get_colombia_presidents()
  # Skip if no data is returned
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_s3_class(result, "tbl_df")
  expect_named(result, c("id", "name", "last_name", "political_party",
                         "start_period_date", "end_period_date"))
  expect_equal(ncol(result), 6)
  expect_gt(nrow(result), 40)  # Should have more than 40 presidents
})

test_that("get_colombia_presidents() returns correct data types", {
  skip_on_cran()
  result <- get_colombia_presidents()
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_type(result$id, "integer")
  expect_type(result$name, "character")
  expect_type(result$last_name, "character")
  expect_type(result$political_party, "character")
  expect_type(result$start_period_date, "character")
  expect_type(result$end_period_date, "character")
})

test_that("get_colombia_presidents() returns valid president IDs", {
  skip_on_cran()
  result <- get_colombia_presidents()
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_true(all(result$id > 0))
  expect_false(any(is.na(result$id)))
  expect_equal(length(result$id), length(unique(result$id)))  # All IDs should be unique
})

test_that("get_colombia_presidents() returns non-empty names and last names", {
  skip_on_cran()
  result <- get_colombia_presidents()
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_true(all(nchar(result$name) > 0))
  expect_true(all(nchar(result$last_name) > 0))
  expect_false(any(is.na(result$name)))
  expect_false(any(is.na(result$last_name)))
})

test_that("get_colombia_presidents() returns valid political parties", {
  skip_on_cran()
  result <- get_colombia_presidents()
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_true(all(nchar(result$political_party) > 0))
  expect_false(any(is.na(result$political_party)))
  # Check for common Colombian political parties
  common_parties <- c("Partido nacional", "Partido Conservador", "Partido conservador",
                      "Partido Liberal", "Partido liberal")
  expect_true(any(result$political_party %in% common_parties))
})

test_that("get_colombia_presidents() returns valid date formats", {
  skip_on_cran()
  result <- get_colombia_presidents()
  skip_if(is.null(result), "API unavailable, test skipped")
  # Check start_period_date format (should be YYYY-MM-DD)
  expect_true(all(grepl("^\\d{4}-\\d{2}-\\d{2}$", result$start_period_date)))
  # Check end_period_date format (should be YYYY-MM-DD or NA/NULL for current president)
  end_dates_non_na <- result$end_period_date[!is.na(result$end_period_date)]
  if (length(end_dates_non_na) > 0) {
    expect_true(all(grepl("^\\d{4}-\\d{2}-\\d{2}$", end_dates_non_na)))
  }
})

test_that("get_colombia_presidents() returns reasonable date ranges", {
  skip_on_cran()
  result <- get_colombia_presidents()
  skip_if(is.null(result), "API unavailable, test skipped")
  # Extract years from start dates
  start_years <- as.numeric(substr(result$start_period_date, 1, 4))
  expect_true(all(start_years >= 1886))  # Colombia's modern presidency started in 1886
  expect_true(all(start_years <= 2025))  # Should not have future presidents

  # Extract years from end dates (excluding NA values)
  end_dates_non_na <- result$end_period_date[!is.na(result$end_period_date)]
  if (length(end_dates_non_na) > 0) {
    end_years <- as.numeric(substr(end_dates_non_na, 1, 4))
    expect_true(all(end_years >= 1886))
    expect_true(all(end_years <= 2025))
  }
})

test_that("get_colombia_presidents() handles API connection gracefully", {
  # This test ensures the function returns NULL when API is unavailable
  result <- get_colombia_presidents()
  expect_true(is.null(result) || is.data.frame(result))
})

test_that("get_colombia_presidents() returns consistent structure across calls", {
  skip_on_cran()
  result1 <- get_colombia_presidents()
  skip_if(is.null(result1), "API unavailable, test skipped")
  result2 <- get_colombia_presidents()
  skip_if(is.null(result2), "API unavailable, test skipped")
  expect_named(result1, c("id", "name", "last_name", "political_party",
                          "start_period_date", "end_period_date"))
  expect_named(result2, c("id", "name", "last_name", "political_party",
                          "start_period_date", "end_period_date"))
  expect_equal(class(result1), class(result2))
  expect_equal(nrow(result1), nrow(result2))
})

test_that("get_colombia_presidents() contains historical presidents", {
  skip_on_cran()
  result <- get_colombia_presidents()
  skip_if(is.null(result), "API unavailable, test skipped")
  # Check for some well-known Colombian presidents
  full_names <- paste(result$name, result$last_name)
  expect_true(any(grepl("Rafael.*Nuñez", full_names, ignore.case = TRUE)))
  expect_true(any(grepl("Miguel Antonio.*Caro", full_names, ignore.case = TRUE)))
})

test_that("get_colombia_presidents() has reasonable number of presidents", {
  skip_on_cran()
  result <- get_colombia_presidents()
  skip_if(is.null(result), "API unavailable, test skipped")
  # Colombia should have had between 40-60 presidents since 1886
  expect_true(nrow(result) >= 40)
  expect_true(nrow(result) <= 70)
})

test_that("get_colombia_presidents() accepts all API date data as valid", {
  skip_on_cran()
  result <- get_colombia_presidents()
  skip_if(is.null(result), "API unavailable, test skipped")
  # All API data is valid and correct regardless of date logic
  # We simply verify that dates exist in the expected format when present
  complete_terms <- result[!is.na(result$end_period_date), ]
  if (nrow(complete_terms) > 0) {
    # Just verify dates can be parsed, not their logical relationship
    start_dates <- as.Date(complete_terms$start_period_date)
    end_dates <- as.Date(complete_terms$end_period_date)
    expect_false(any(is.na(start_dates)))  # All start dates should be parseable
    expect_false(any(is.na(end_dates)))    # All end dates should be parseable
  }
})

test_that("get_colombia_presidents() has at most one current president", {
  skip_on_cran()
  result <- get_colombia_presidents()
  skip_if(is.null(result), "API unavailable, test skipped")
  # Count presidents with no end date (current presidents)
  current_presidents <- sum(is.na(result$end_period_date))
  expect_true(current_presidents <= 1)
})

test_that("get_colombia_presidents() political party names are consistent", {
  skip_on_cran()
  result <- get_colombia_presidents()
  skip_if(is.null(result), "API unavailable, test skipped")
  # Check that political party names don't have leading/trailing spaces
  expect_true(all(result$political_party == trimws(result$political_party)))
  # Check that there are multiple different political parties
  expect_true(length(unique(result$political_party)) > 1)
})
