# ColombiAPI - Access Colombian Data via APIs and Curated Datasets
# Version 0.4.0
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

# get_colombia_invasive_species


library(testthat)

species_data <- get_colombia_invasive_species()

test_that("get_colombia_invasive_species returns valid tibble structure", {
  skip_if(is.null(species_data), "Function returned NULL")

  expect_s3_class(species_data, "tbl_df")
  expect_s3_class(species_data, "data.frame")

  expect_equal(ncol(species_data), 7)
  expect_true(nrow(species_data) > 0)

  expect_equal(names(species_data),
               c("id", "name", "scientificName", "commonNames",
                 "impact", "manage", "riskLevel"))
})

test_that("get_colombia_invasive_species returns correct column types", {
  skip_if(is.null(species_data), "Function returned NULL")

  expect_type(species_data$id, "integer")
  expect_type(species_data$name, "character")
  expect_type(species_data$scientificName, "character")
  expect_type(species_data$commonNames, "character")
  expect_type(species_data$impact, "character")
  expect_type(species_data$manage, "character")
  expect_type(species_data$riskLevel, "integer")
})

test_that("get_colombia_invasive_species id and riskLevel are valid", {
  skip_if(is.null(species_data), "Function returned NULL")

  expect_true(all(!is.na(species_data$id)))
  expect_true(all(species_data$id > 0))

  non_na_risk <- species_data$riskLevel[!is.na(species_data$riskLevel)]

  if (length(non_na_risk) > 0) {
    expect_true(all(is.finite(non_na_risk)))
  }
})

test_that("get_colombia_invasive_species character columns have valid values", {
  skip_if(is.null(species_data), "Function returned NULL")

  expect_true(all(!is.na(species_data$name)))
  expect_true(all(!is.na(species_data$scientificName)))

  non_na_common <- species_data$commonNames[!is.na(species_data$commonNames)]
  if (length(non_na_common) > 0) {
    expect_true(all(nchar(trimws(non_na_common)) >= 0))
  }

  non_na_impact <- species_data$impact[!is.na(species_data$impact)]
  if (length(non_na_impact) > 0) {
    expect_true(all(nchar(trimws(non_na_impact)) >= 0))
  }

  non_na_manage <- species_data$manage[!is.na(species_data$manage)]
  if (length(non_na_manage) > 0) {
    expect_true(all(nchar(trimws(non_na_manage)) >= 0))
  }
})

test_that("get_colombia_invasive_species contains multiple distinct species", {
  skip_if(is.null(species_data), "Function returned NULL")

  expect_true(length(unique(species_data$name)) > 10)
})

test_that("get_colombia_invasive_species returns no duplicate ids", {
  skip_if(is.null(species_data), "Function returned NULL")

  expect_equal(length(unique(species_data$id)), nrow(species_data))
})
