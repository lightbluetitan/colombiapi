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

# dead_lianas_df

library(testthat)

# Test dataset structure and class
test_that("dead_lianas_df loads correctly and has the expected structure", {
  expect_s3_class(dead_lianas_df, "data.frame")  # Check if it's a data frame
  expect_equal(nrow(dead_lianas_df), 4247)       # Check number of rows
  expect_equal(ncol(dead_lianas_df), 52)         # Check number of columns
  expect_equal(names(dead_lianas_df)[1], "PlotSite")   # Check first column name
  expect_equal(names(dead_lianas_df)[52], "dead")      # Check last column name
})

# Test column types
test_that("dead_lianas_df has correct column types", {
  expect_true(is.character(dead_lianas_df$PlotSite))
  expect_true(is.numeric(dead_lianas_df$Y.Plot))
  expect_true(is.numeric(dead_lianas_df$X.Plot))
  expect_true(is.integer(dead_lianas_df$PhoroNo))
  expect_true(is.character(dead_lianas_df$EpiFam))
  expect_true(is.character(dead_lianas_df$EpiGen))
  expect_true(is.character(dead_lianas_df$cf.aff))
  expect_true(is.character(dead_lianas_df$Species))
  expect_true(is.character(dead_lianas_df$Author))
  expect_true(is.character(dead_lianas_df$EpiAzi))
  expect_true(is.integer(dead_lianas_df$BraAzi))
  expect_true(is.numeric(dead_lianas_df$EpiDisTru))
  expect_true(is.numeric(dead_lianas_df$EpiSize))
  expect_true(is.numeric(dead_lianas_df$EpiAttHei))
  expect_s3_class(dead_lianas_df$Date0, "Date")
  expect_s3_class(dead_lianas_df$Date1, "Date")
  expect_true(is.character(dead_lianas_df$Location))
  expect_true(is.factor(dead_lianas_df$Mortality))
  expect_true(is.character(dead_lianas_df$MorCat))
  expect_true(is.integer(dead_lianas_df$Elevation))
  expect_true(is.integer(dead_lianas_df$AP_bio12))
  expect_true(is.integer(dead_lianas_df$PDM_bio14))
  expect_true(is.integer(dead_lianas_df$PS_bio15))
  expect_true(is.integer(dead_lianas_df$MDT_bio2))
  expect_true(is.integer(dead_lianas_df$TS_bio4))
  expect_true(is.integer(dead_lianas_df$ATR_bio7))
  expect_true(is.integer(dead_lianas_df$AET))
  expect_true(is.numeric(dead_lianas_df$BasAre))
  expect_true(is.numeric(dead_lianas_df$BasAre5_10))
  expect_true(is.numeric(dead_lianas_df$BasAre10))
  expect_true(is.integer(dead_lianas_df$Ind10))
  expect_true(is.numeric(dead_lianas_df$Ind5))
  expect_true(is.numeric(dead_lianas_df$Ind5_10))
  expect_true(is.integer(dead_lianas_df$Ind10_15))
  expect_true(is.integer(dead_lianas_df$Ind15_20))
  expect_true(is.integer(dead_lianas_df$Ind20_25))
  expect_true(is.integer(dead_lianas_df$Ind25_30))
  expect_true(is.integer(dead_lianas_df$Ind30))
  expect_true(is.numeric(dead_lianas_df$TreeHei))
  expect_true(is.numeric(dead_lianas_df$MedHei))
  expect_true(is.numeric(dead_lianas_df$MaxHei))
  expect_true(is.integer(dead_lianas_df$BranchNumb))
  expect_true(is.numeric(dead_lianas_df$MEAH))
  expect_true(is.numeric(dead_lianas_df$MEAH_sd))
  expect_true(is.integer(dead_lianas_df$MSP))
  expect_true(is.numeric(dead_lianas_df$MSP_sd))
  expect_true(is.numeric(dead_lianas_df$Htree))
  expect_true(is.numeric(dead_lianas_df$Htree_sd))
  expect_true(is.numeric(dead_lianas_df$BranNum))
  expect_true(is.numeric(dead_lianas_df$BranNUm_sd))
  expect_true(is.character(dead_lianas_df$tree.id))
  expect_true(is.factor(dead_lianas_df$dead))
})

# Test for NA values in mandatory columns
mandatory_columns <- c("PlotSite", "Y.Plot", "X.Plot", "PhoroNo", "Species", "Mortality", "tree.id", "dead")
test_that("dead_lianas_df mandatory columns have no NA values", {
  for (col in mandatory_columns) {
    expect_false(any(is.na(dead_lianas_df[[col]])), info = paste("Found NA values in", col))
  }
})

# Test to verify dataset immutability
test_that("dead_lianas_df remains unchanged after tests", {
  original_dataset <- dead_lianas_df

  # Example checks
  sum(is.na(dead_lianas_df$PlotSite))
  sum(is.na(dead_lianas_df$PhoroNo))
  sum(is.na(dead_lianas_df$Species))

  expect_identical(original_dataset, dead_lianas_df)
  expect_equal(nrow(original_dataset), nrow(dead_lianas_df))
  expect_equal(ncol(original_dataset), ncol(dead_lianas_df))
  expect_equal(names(original_dataset), names(dead_lianas_df))
})

# Optional logical checks for numeric columns (non-negative, excluding coordinates)
numeric_columns <- c("EpiDisTru", "EpiSize", "EpiAttHei",
                     "BasAre", "BasAre5_10", "BasAre10", "Ind10", "Ind5", "Ind5_10",
                     "Ind10_15", "Ind15_20", "Ind20_25", "Ind25_30", "Ind30",
                     "TreeHei", "MedHei", "MaxHei", "MEAH", "MEAH_sd", "Htree", "Htree_sd",
                     "BranNum", "BranNUm_sd", "BraAzi", "PhoroNo", "MSP", "MSP_sd", "BranchNumb",
                     "Elevation", "AP_bio12", "PDM_bio14", "PS_bio15", "MDT_bio2", "TS_bio4", "ATR_bio7", "AET")

test_that("dead_lianas_df numeric columns (excluding coordinates) have valid non-negative values", {
  for (col in numeric_columns) {
    expect_true(all(dead_lianas_df[[col]] >= 0, na.rm = TRUE), info = paste("Negative values found in", col))
  }
})
