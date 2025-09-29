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

# gdp_departments_tbl_df

library(testthat)

# Test dataset structure and class
test_that("gdp_departments_tbl_df loads correctly and has the expected structure", {
  expect_s3_class(gdp_departments_tbl_df, "tbl_df")
  expect_equal(nrow(gdp_departments_tbl_df), 16302)
  expect_equal(ncol(gdp_departments_tbl_df), 7)
  expect_equal(names(gdp_departments_tbl_df)[1], "Año")
  expect_equal(names(gdp_departments_tbl_df)[7], "Valor (miles de millones de pesos)")
})

# Test data types of columns
test_that("gdp_departments_tbl_df has correct column types", {
  expect_true(is.numeric(gdp_departments_tbl_df$Año))
  expect_true(is.character(gdp_departments_tbl_df$Actividad))
  expect_true(is.character(gdp_departments_tbl_df$Sector))
  expect_true(is.character(gdp_departments_tbl_df$`Tipo de precios`))
  expect_true(is.numeric(gdp_departments_tbl_df$`Código Departamento (DIVIPOLA)`))
  expect_true(is.character(gdp_departments_tbl_df$Departamento))
  expect_true(is.numeric(gdp_departments_tbl_df$`Valor (miles de millones de pesos)`))
})

# Test for missing values (NA) in the dataset
test_that("gdp_departments_tbl_df reports NA values correctly", {
  # Allow NA only in 'Valor (miles de millones de pesos)' (if it can have missing values)
  allow_na <- c("Valor (miles de millones de pesos)")

  for (col in names(gdp_departments_tbl_df)) {
    if (col %in% allow_na) {
      expect_true(all(is.na(gdp_departments_tbl_df[[col]]) | !is.na(gdp_departments_tbl_df[[col]])),
                  info = paste("NA values allowed in", col))
    } else {
      expect_false(any(is.na(gdp_departments_tbl_df[[col]])),
                   info = paste("Found NA in", col))
    }
  }
})

# Test for non-negative GDP values
test_that("gdp_departments_tbl_df has non-negative GDP values", {
  expect_true(all(gdp_departments_tbl_df$`Valor (miles de millones de pesos)` >= 0, na.rm = TRUE))
})

# Test to verify dataset immutability
test_that("gdp_departments_tbl_df remains unchanged after tests", {
  original_dataset <- gdp_departments_tbl_df

  # Example checks
  sum(is.na(gdp_departments_tbl_df$Año))
  sum(is.na(gdp_departments_tbl_df$`Valor (miles de millones de pesos)`))

  expect_identical(original_dataset, gdp_departments_tbl_df)
  expect_equal(nrow(original_dataset), nrow(gdp_departments_tbl_df))
  expect_equal(ncol(original_dataset), ncol(gdp_departments_tbl_df))
  expect_equal(names(original_dataset), names(gdp_departments_tbl_df))
})



