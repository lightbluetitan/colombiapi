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

# Archivo: utils.R


utils::globalVariables(c(
  # Variables of the get_airports_list function
  "id", "name", "iataCode", "oaciCode", "type", "longitude", "latitude",

  # Variables of the get_Colombia_info function
  "name", "surface", "population", "timeZone", "currency", "currencySymbolr", "region",


  # Variables of the get_departments_list function
  "id", "name", "surface", "population",

  # Variables of the get_presidents_list function
  "id", "name", "lastName", "startPeriodDate","endPeriodDate","politicalParty",

  # Variables of the get_regions_list function
  "id", "name"


))

utils::globalVariables(c("data"))
