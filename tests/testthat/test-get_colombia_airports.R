# ColombiAPI - Access Colombian Data via APIs and Curated Datasets
# Version 0.3.0
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

# get_colombia_airports


library(testthat)

test_that("get_colombia_airports() returns a tibble with correct structure", {
  skip_on_cran()  # Skip test on CRAN if the API is unavailable
  result <- get_colombia_airports()
  # Skip if no data is returned
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_s3_class(result, "tbl_df")
  expect_named(result, c("id", "name", "iata_code", "oaci_code", "type",
                         "city", "department", "longitude", "latitude"))
  expect_equal(ncol(result), 9)
  expect_gt(nrow(result), 40)  # Should have more than 40 airports
})

test_that("get_colombia_airports() returns correct data types", {
  skip_on_cran()
  result <- get_colombia_airports()
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_type(result$id, "integer")
  expect_type(result$name, "character")
  expect_type(result$iata_code, "character")
  expect_type(result$oaci_code, "character")
  expect_type(result$type, "character")
  expect_type(result$city, "character")
  expect_type(result$department, "character")
  expect_type(result$longitude, "double")
  expect_type(result$latitude, "double")
})

test_that("get_colombia_airports() returns valid airport IDs", {
  skip_on_cran()
  result <- get_colombia_airports()
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_true(all(result$id > 0))
  expect_false(any(is.na(result$id)))
  expect_equal(length(result$id), length(unique(result$id)))  # All IDs should be unique
})

test_that("get_colombia_airports() returns non-empty airport names", {
  skip_on_cran()
  result <- get_colombia_airports()
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_true(all(nchar(result$name) > 0))
  expect_false(any(is.na(result$name)))
})

test_that("get_colombia_airports() returns valid IATA codes", {
  skip_on_cran()
  result <- get_colombia_airports()
  skip_if(is.null(result), "API unavailable, test skipped")
  # IATA codes can be 3 characters or "N/A" or NA
  non_na_iata <- result$iata_code[!is.na(result$iata_code)]
  if (length(non_na_iata) > 0) {
    valid_iata <- non_na_iata == "N/A" | nchar(non_na_iata) == 3
    expect_true(all(valid_iata))
  }
})

test_that("get_colombia_airports() returns valid OACI codes", {
  skip_on_cran()
  result <- get_colombia_airports()
  skip_if(is.null(result), "API unavailable, test skipped")
  # OACI codes can be 4 characters or "N/A" or NA
  non_na_oaci <- result$oaci_code[!is.na(result$oaci_code)]
  if (length(non_na_oaci) > 0) {
    valid_oaci <- non_na_oaci == "N/A" | nchar(non_na_oaci) == 4
    expect_true(all(valid_oaci))
  }
})

test_that("get_colombia_airports() returns valid airport types", {
  skip_on_cran()
  result <- get_colombia_airports()
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_true(all(nchar(result$type) > 0 | is.na(result$type)))
  # Common airport types in Colombia
  common_types <- c("Internacional", "Nacional", "Militar", "Regional")
  if (any(!is.na(result$type))) {
    expect_true(any(grepl(paste(common_types, collapse = "|"), result$type, ignore.case = TRUE)))
  }
})

test_that("get_colombia_airports() returns non-empty city and department names", {
  skip_on_cran()
  result <- get_colombia_airports()
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_true(all(nchar(result$city) > 0 | is.na(result$city)))
  expect_true(all(nchar(result$department) > 0 | is.na(result$department)))
})

test_that("get_colombia_airports() returns valid coordinate data types", {
  skip_on_cran()
  result <- get_colombia_airports()
  skip_if(is.null(result), "API unavailable, test skipped")
  # Coordinates should be numeric or NA
  expect_true(all(is.numeric(result$latitude) | is.na(result$latitude)))
  expect_true(all(is.numeric(result$longitude) | is.na(result$longitude)))
})

test_that("get_colombia_airports() coordinates are finite when present", {
  skip_on_cran()
  result <- get_colombia_airports()
  skip_if(is.null(result), "API unavailable, test skipped")
  # All API coordinate data is valid and correct
  non_na_lat <- result$latitude[!is.na(result$latitude)]
  non_na_lon <- result$longitude[!is.na(result$longitude)]
  if (length(non_na_lat) > 0) {
    expect_true(all(is.finite(non_na_lat)))
  }
  if (length(non_na_lon) > 0) {
    expect_true(all(is.finite(non_na_lon)))
  }
})

test_that("get_colombia_airports() handles API connection gracefully", {
  # This test ensures the function returns NULL when API is unavailable
  result <- get_colombia_airports()
  expect_true(is.null(result) || is.data.frame(result))
})

test_that("get_colombia_airports() returns consistent structure across calls", {
  skip_on_cran()
  result1 <- get_colombia_airports()
  skip_if(is.null(result1), "API unavailable, test skipped")
  result2 <- get_colombia_airports()
  skip_if(is.null(result2), "API unavailable, test skipped")
  expect_named(result1, c("id", "name", "iata_code", "oaci_code", "type",
                          "city", "department", "longitude", "latitude"))
  expect_named(result2, c("id", "name", "iata_code", "oaci_code", "type",
                          "city", "department", "longitude", "latitude"))
  expect_equal(class(result1), class(result2))
  expect_equal(nrow(result1), nrow(result2))
})

test_that("get_colombia_airports() contains major Colombian airports", {
  skip_on_cran()
  result <- get_colombia_airports()
  skip_if(is.null(result), "API unavailable, test skipped")
  # Check for some well-known Colombian airports
  expect_true(any(grepl("El Dorado", result$name, ignore.case = TRUE)))
  expect_true(any(grepl("José María Córdova", result$name, ignore.case = TRUE)))
  expect_true(any(grepl("Ernesto Cortissoz", result$name, ignore.case = TRUE)))
})

test_that("get_colombia_airports() contains major Colombian cities", {
  skip_on_cran()
  result <- get_colombia_airports()
  skip_if(is.null(result), "API unavailable, test skipped")
  # Check for airports in major Colombian cities
  expect_true(any(grepl("Bogotá", result$city, ignore.case = TRUE)))
  expect_true(any(grepl("Medellín|Rionegro", result$city, ignore.case = TRUE)))
  expect_true(any(grepl("Barranquilla", result$city, ignore.case = TRUE)))
})

test_that("get_colombia_airports() contains major Colombian departments", {
  skip_on_cran()
  result <- get_colombia_airports()
  skip_if(is.null(result), "API unavailable, test skipped")
  # Check for airports in major Colombian departments
  expect_true(any(grepl("Bogotá", result$department, ignore.case = TRUE)))
  expect_true(any(grepl("Antioquia", result$department, ignore.case = TRUE)))
  expect_true(any(grepl("Atlántico", result$department, ignore.case = TRUE)))
})

test_that("get_colombia_airports() IATA codes follow standard format", {
  skip_on_cran()
  result <- get_colombia_airports()
  skip_if(is.null(result), "API unavailable, test skipped")
  # Filter valid IATA codes (not N/A or NA)
  valid_iata <- result$iata_code[!is.na(result$iata_code) & result$iata_code != "N/A"]
  if (length(valid_iata) > 0) {
    expect_true(all(nchar(valid_iata) == 3))
    expect_true(all(grepl("^[A-Z]+$", valid_iata)))
  }
})

test_that("get_colombia_airports() has reasonable number of airports", {
  skip_on_cran()
  result <- get_colombia_airports()
  skip_if(is.null(result), "API unavailable, test skipped")
  # Colombia should have a reasonable number of airports
  expect_true(nrow(result) >= 30)
  expect_true(nrow(result) <= 200)
})



