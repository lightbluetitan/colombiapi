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

# Archivo: utils.R


utils::globalVariables(c(
  # Variables of the get_country_info_co function
  "name_common", "name_official", "region", "subregion", "capital", "area", "population","languages",

  # Variables of the get_colombia_regions function
  "id", "name", "description",

  # Variables of the get_colombia_presidents function
  "id", "name", "last_name", "political_party","start_period_date","end_period_date",

  # Variables of the get_colombia_departments function
  "id", "name", "capital", "surface","population","municipalities","phone_prefix","region_id",

  # Variables of the get_colombia_airports function
  "id", "name", "iata_code", "oaci_code", "type", "city", "department", "longitude", "latitude",

  # Variables of the get_colombia_cities function
  "id", "name",

  # Variables of the get_colombia_attractions function
  "id", "name", "description", "latitude","longitude","cityId",

  # Variables of the get_colombia_natural_areas function
  "id", "areaGroupId", "categoryNaturalAreaId", "name","departmentId","daneCode","landArea",

  # Variables of the get_colombia_invasive_species function
  "id", "name", "scientificName", "commonNames","impact","manage","riskLevel",

  # Variables of the get_colombia_native_communities function
  "id", "name", "description", "languages",

  # Variables of the get_colombia_radios function
  "id", "name", "frequency", "band",

  # Variables of the get_colombia_typical_dishes function
  "id", "name", "description",

  # Variables of the get_colombia_holidays function
  "date", "local_name", "name",

  # Variables of the get_colombia_child_mortality function
  "indicator", "country", "year", "value",

  # Variables of the get_colombia_cpi function
  "indicator", "country", "year", "value",

  # Variables of the get_colombia_energy_use function
  "indicator", "country", "year", "value",

  # Variables of the get_colombia_gdp function
  "indicator", "country", "year", "value", "value_label",

  # Variables of the get_colombia_hospital_beds function
  "indicator", "country", "year", "value",

  # Variables of the get_colombia_life_expectancy function
  "indicator", "country", "year", "value",

  # Variables of the get_colombia_literacy_rate function
  "indicator", "country", "year", "value",

  # Variables of the get_colombia_population function
  "indicator", "country", "year", "value", "value_label",

  # Variables of the get_colombia_unemployment function
  "indicator", "country", "year", "value"


))

utils::globalVariables(c("data"))
