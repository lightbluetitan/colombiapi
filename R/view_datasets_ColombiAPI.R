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

#' View Available Datasets in ColombiAPI
#'
#' This function lists all datasets available in the 'ColombiAPI' package.
#' If the 'ColombiAPI' package is not loaded, it stops and shows an error message.
#' If no datasets are available, it returns a message and an empty vector.
#'
#' @return A character vector with the names of the available datasets.
#'         If no datasets are found, it returns an empty character vector.
#' @examples
#' if (requireNamespace("ColombiAPI", quietly = TRUE)) {
#'   library(ColombiAPI)
#'   view_datasets_ColombiAPI()
#' }
#' @export
view_datasets_ColombiAPI <- function() {
  # Check if the package is loaded
  if (!"ColombiAPI" %in% .packages()) {
    stop("The 'ColombiAPI' package must be loaded to view its datasets.")
  }

  # Extract dataset information
  datasets_info <- data(package = "ColombiAPI")$results

  # Check if there are datasets available
  if (nrow(datasets_info) == 0) {
    message("No datasets are currently available in the 'ColombiAPI' package.")
    return(character(0))
  }

  # Extract dataset names
  datasets <- datasets_info[, "Item"]

  # Display the message with available datasets
  message("Datasets available in the 'ColombiAPI' package:")


  # Return a vector of datasets without printing to the console
  return(datasets)
}
