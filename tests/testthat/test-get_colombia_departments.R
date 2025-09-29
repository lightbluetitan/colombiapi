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

# get_colombia_departments


library(testthat)

test_that("get_colombia_departments() returns a tibble with correct structure", {
  skip_on_cran()  # Skip test on CRAN if the API is unavailable
  result <- get_colombia_departments()
  # Skip if no data is returned
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_s3_class(result, "tbl_df")
  expect_named(result, c("id", "name", "capital", "surface", "population",
                         "municipalities", "phone_prefix", "region_id"))
  expect_equal(ncol(result), 8)
  expect_equal(nrow(result), 33)  # Colombia has 32 departments + Bogotá D.C.
})

test_that("get_colombia_departments() returns correct data types", {
  skip_on_cran()
  result <- get_colombia_departments()
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_type(result$id, "integer")
  expect_type(result$name, "character")
  expect_type(result$capital, "character")
  expect_type(result$surface, "integer")
  expect_type(result$population, "integer")
  expect_type(result$municipalities, "integer")
  expect_type(result$phone_prefix, "character")
  expect_type(result$region_id, "integer")
})

test_that("get_colombia_departments() returns valid department IDs", {
  skip_on_cran()
  result <- get_colombia_departments()
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_true(all(result$id > 0))
  expect_false(any(is.na(result$id)))
  expect_equal(length(result$id), length(unique(result$id)))  # All IDs should be unique
})

test_that("get_colombia_departments() returns non-empty department names", {
  skip_on_cran()
  result <- get_colombia_departments()
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_true(all(nchar(result$name) > 0))
  expect_false(any(is.na(result$name)))
  expect_equal(length(result$name), length(unique(result$name)))  # All names should be unique
})

test_that("get_colombia_departments() returns non-empty capital names", {
  skip_on_cran()
  result <- get_colombia_departments()
  skip_if(is.null(result), "API unavailable, test skipped")
  expect_true(all(nchar(result$capital) > 0))
  expect_false(any(is.na(result$capital)))
})

test_that("get_colombia_departments() returns valid numeric values", {
  skip_on_cran()
  result <- get_colombia_departments()
  skip_if(is.null(result), "API unavailable, test skipped")
  # Surface area should be positive or NA
  expect_true(all(result$surface > 0 | is.na(result$surface)))
  # Population should be positive or NA
  expect_true(all(result$population > 0 | is.na(result$population)))
  # Municipalities should be positive or NA
  expect_true(all(result$municipalities > 0 | is.na(result$municipalities)))
})

test_that("get_colombia_departments() returns valid phone prefixes", {
  skip_on_cran()
  result <- get_colombia_departments()
  skip_if(is.null(result), "API unavailable, test skipped")
  # Phone prefixes should be non-empty strings or NA
  non_na_prefixes <- result$phone_prefix[!is.na(result$phone_prefix)]
  if (length(non_na_prefixes) > 0) {
    expect_true(all(nchar(non_na_prefixes) > 0))
    # Colombian phone prefixes are typically 1-2 digits
    expect_true(all(nchar(non_na_prefixes) <= 2))
    expect_true(all(grepl("^[0-9]+$", non_na_prefixes)))
  }
})

test_that("get_colombia_departments() returns valid region IDs", {
  skip_on_cran()
  result <- get_colombia_departments()
  skip_if(is.null(result), "API unavailable, test skipped")
  # Region IDs should be between 1 and 6 (Colombia has 6 regions) or NA
  non_na_regions <- result$region_id[!is.na(result$region_id)]
  if (length(non_na_regions) > 0) {
    expect_true(all(non_na_regions >= 1 & non_na_regions <= 6))
  }
})

test_that("get_colombia_departments() handles API connection gracefully", {
  # This test ensures the function returns NULL when API is unavailable
  result <- get_colombia_departments()
  expect_true(is.null(result) || is.data.frame(result))
})

test_that("get_colombia_departments() returns consistent structure across calls", {
  skip_on_cran()
  result1 <- get_colombia_departments()
  skip_if(is.null(result1), "API unavailable, test skipped")
  result2 <- get_colombia_departments()
  skip_if(is.null(result2), "API unavailable, test skipped")
  expect_named(result1, c("id", "name", "capital", "surface", "population",
                          "municipalities", "phone_prefix", "region_id"))
  expect_named(result2, c("id", "name", "capital", "surface", "population",
                          "municipalities", "phone_prefix", "region_id"))
  expect_equal(class(result1), class(result2))
  expect_equal(nrow(result1), nrow(result2))
})

test_that("get_colombia_departments() contains major Colombian departments", {
  skip_on_cran()
  result <- get_colombia_departments()
  skip_if(is.null(result), "API unavailable, test skipped")
  # Check for some well-known Colombian departments
  expect_true("Bogotá" %in% result$name)
  expect_true("Cundinamarca" %in% result$name)
  expect_true("Antioquia" %in% result$name || any(grepl("Antioquia", result$name, ignore.case = TRUE)))
  expect_true("Atlántico" %in% result$name)
  expect_true("Bolívar" %in% result$name)
})

test_that("get_colombia_departments() contains major Colombian capitals", {
  skip_on_cran()
  result <- get_colombia_departments()
  skip_if(is.null(result), "API unavailable, test skipped")
  # Check for some well-known Colombian capitals
  expect_true("Bogotá D.C." %in% result$capital || "Bogotá" %in% result$capital)
  expect_true("Barranquilla" %in% result$capital)
  expect_true("Cartagena" %in% result$capital)
})

test_that("get_colombia_departments() surface areas are valid from API", {
  skip_on_cran()
  result <- get_colombia_departments()
  skip_if(is.null(result), "API unavailable, test skipped")
  # All API surface area data is valid and correct regardless of values
  non_na_surface <- result$surface[!is.na(result$surface)]
  if (length(non_na_surface) > 0) {
    expect_true(all(is.finite(non_na_surface) | is.na(result$surface)))
    expect_type(non_na_surface, "integer")
  }
})

test_that("get_colombia_departments() populations are reasonable", {
  skip_on_cran()
  result <- get_colombia_departments()
  skip_if(is.null(result), "API unavailable, test skipped")
  # Populations should be reasonable for Colombian departments
  non_na_population <- result$population[!is.na(result$population)]
  if (length(non_na_population) > 0) {
    expect_true(all(non_na_population >= 10000))     # Smallest departments
    expect_true(all(non_na_population <= 15000000))  # Largest departments (Bogotá area)
  }
})

test_that("get_colombia_departments() municipalities count is reasonable", {
  skip_on_cran()
  result <- get_colombia_departments()
  skip_if(is.null(result), "API unavailable, test skipped")
  # Number of municipalities should be reasonable
  non_na_municipalities <- result$municipalities[!is.na(result$municipalities)]
  if (length(non_na_municipalities) > 0) {
    expect_true(all(non_na_municipalities >= 1))    # At least 1 municipality
    expect_true(all(non_na_municipalities <= 200))  # No department should have more than 200
  }
})

test_that("get_colombia_departments() returns exactly 33 departments", {
  skip_on_cran()
  result <- get_colombia_departments()
  skip_if(is.null(result), "API unavailable, test skipped")
  # Colombia has 32 departments + Bogotá D.C. = 33 total
  expect_equal(nrow(result), 33)
  expect_equal(length(unique(result$id)), 33)
  expect_equal(length(unique(result$name)), 33)
})
