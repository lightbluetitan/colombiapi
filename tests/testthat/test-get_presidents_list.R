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

# get_presidents_list function

library(testthat)
library(httr)
library(dplyr)

# Define the function to fetch the president data
get_presidents_list <- function() {
  url_presidents_001 <- "https://api-colombia.com/api/v1/President"

  info_presidents_001 <- httr::GET(url_presidents_001)

  if (info_presidents_001$status_code != 200) {
    message(paste("Error: Received status code", info_presidents_001$status_code))
    return(NULL)
  }

  info_presidents_char <- rawToChar(info_presidents_001$content)
  info_presidents_json <- jsonlite::fromJSON(info_presidents_char, flatten = TRUE)

  presidents_json_selected <- info_presidents_json %>%
    dplyr::select(id, name, lastName, startPeriodDate, endPeriodDate, politicalParty) %>%
    dplyr::arrange(dplyr::desc(startPeriodDate))

  return(presidents_json_selected)
}

# Pruebas
test_that("get_presidents_list returns a data frame with expected columns", {
  data <- get_presidents_list()

  expect_s3_class(data, "data.frame")
  expect_true(all(c("id", "name", "lastName", "startPeriodDate", "endPeriodDate", "politicalParty") %in% colnames(data)))
})

test_that("get_presidents_list returns non-null data", {
  data <- get_presidents_list()
  expect_s3_class(data, "data.frame")  # Updated to expect_s3_class instead of expect_is
  expect_true(nrow(data) > 0)  # Ensures there are rows returned
})

test_that("get_presidents_list correctly orders presidents by start period date", {
  data <- get_presidents_list()

  # Check if data is arranged in descending order of startPeriodDate
  expect_true(all(diff(as.Date(data$startPeriodDate)) <= 0, na.rm = TRUE))
})

test_that("get_presidents_list handles missing values in endPeriodDate correctly", {
  data <- get_presidents_list()

  # Check if the missing value in endPeriodDate is handled
  expect_true(any(is.na(data$endPeriodDate)))
})

test_that("get_presidents_list contains expected values for some key fields", {
  data <- get_presidents_list()

  # Check some specific values (ensure they match the expected values)
  expect_equal(data$name[1], "Gustavo Francisco")
  expect_equal(data$lastName[1], "Petro Urrego")
  expect_equal(data$politicalParty[1], "Colombia Humana")
  expect_equal(data$id[1], 52)
})
