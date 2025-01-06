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

# get_regions_list function

library(testthat)
library(httr)
library(dplyr)
library(jsonlite)

# Define the function to be tested
get_regions_list <- function() {
  url_regions_001 <- "https://api-colombia.com/api/v1/Region"

  info_regions_001 <- httr::GET(url_regions_001)

  if (info_regions_001$status_code != 200) {
    message(paste("Error: Received status code", info_regions_001$status_code))
    return(NULL)
  }

  info_regions_char <- rawToChar(info_regions_001$content)
  info_regions_json <- jsonlite::fromJSON(info_regions_char, flatten = TRUE)

  regions_json_selected <- info_regions_json %>%
    dplyr::select(id, name) %>%
    dplyr::arrange(name)

  return(regions_json_selected)
}

# Test cases
test_that("Function get_regions_list returns expected data", {
  data <- get_regions_list()

  # Check if the expected columns are present
  expect_true(all(c("id", "name") %in% names(data)))

  # Check the number of rows returned
  expect_equal(nrow(data), 6)  # 6 regions based on the sample data

  # Check that data values match known results (based on the sample output)
  expect_equal(data$id, c(4, 5, 1, 6, 3, 2))
  expect_equal(data$name, c("Amazonía", "Andina", "Caribe", "Insular", "Orinoquía", "Pacífico"))
})

test_that("Function get_regions_list returns a data frame", {
  data <- get_regions_list()
  expect_s3_class(data, "data.frame")
})

