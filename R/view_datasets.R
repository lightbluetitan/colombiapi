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

#' List of Datasets in the ColombiAPI Package
#'
#' This function lists all the datasets available in the ColombiAPI package.
#' It returns a character vector with the names of the datasets included in the package.
#'
#' @return A character vector containing the names of the datasets available in the ColombiAPI package.
#'
#' @examples
#' # List the datasets available in the ColombiAPI package
#' view_datasets()
#'
#' @export
view_datasets <- function() {
  # Extract all the datasets in the ColombiAPI package
  datasets <- data(package = "ColombiAPI")$results[, "Item"]

  # Shows a message for the user
  cat("Datasets available in the ColombiAPI package:\n")

  # List all the datasets in the ColombiAPI package
  return(datasets)
}
