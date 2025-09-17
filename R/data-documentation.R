# ColombiAPI - Access Colombian Data via APIs and Curated Datasets
# Version 0.2.0
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


#' Bogota Air Stations Coordinates
#'
#' This dataset, Bogota_airstations_df, is a data frame containing the coordinates of air quality measurement stations in Bogota, Colombia.
#'
#' The dataset name has been kept as Bogota_airstations_df to avoid confusion with other datasets in the R ecosystem.
#' This naming convention helps distinguish this dataset as part of the ColombiAPI package and assists users in identifying its specific characteristics.
#' The suffix '_df' indicates that the dataset is a data frame. The original content has not been modified in any way.
#'
#' @name Bogota_airstations_df
#' @format A data frame with 10 observations and 3 variables:
#' \describe{
#'   \item{ESTACION}{Character string representing the name of the station.}
#'   \item{X}{Numeric value representing the X coordinate of the station.}
#'   \item{Y}{Numeric value representing the Y coordinate of the station.}
#' }
#' @source Originally taken from the SpatFD package version 0.0.1
#' @usage data(Bogota_airstations_df)
#' @export
load("data/Bogota_airstations_df.rda")
NULL


#' Bogota Holidays Dates
#'
#' This dataset, Bogota_holidays_Date, is a Date object containing the official holidays of Bogota, Colombia.
#'
#' The dataset name has been kept as Bogota_holidays_Date to avoid confusion with other datasets in the R ecosystem.
#' This naming convention helps distinguish this dataset as part of the ColombiAPI package and assists users in identifying its specific characteristics.
#' The suffix '_Date' indicates that the dataset is an object of the Date class. The original content has not been modified in any way.
#'
#' @name Bogota_holidays_Date
#' @format A Date object with 1787 observations:
#' \describe{
#'   \item{Bogota_holidays_Date}{Date object representing the official holidays in Bogota, Colombia, ranging between "1990-01-01" and "2100-12-08".}
#' }
#' @source Originally taken from the quantdates package version 2.0.4.
#' Holidays were created using the \code{bizdays} package.
#' @usage data(Bogota_holidays_Date)
#' @export
load("data/Bogota_holidays_Date.rda")
NULL


#' Bogota Business Dates
#'
#' This dataset, Bogota_business_Date, is a Date object containing the business dates for Bogota, Colombia.
#'
#' The dataset name has been kept as Bogota_business_Date to avoid confusion with other datasets in the R ecosystem.
#' This naming convention helps distinguish this dataset as part of the ColombiAPI package and assists users in identifying its specific characteristics.
#' The suffix '_Date' indicates that the dataset is an object of the Date class. The original content has not been modified in any way.
#'
#' @name Bogota_business_Date
#' @format A Date object with 27,173 observations:
#' \describe{
#'   \item{Bogota_business_Date}{Date object representing the business dates in Bogota, Colombia, ranging between "1990-01-02" and "2100-12-31".}
#' }
#' @source Originally taken from the quantdates package version 2.0.4.
#' @usage data(Bogota_business_Date)
#' @export
load("data/Bogota_business_Date.rda")
NULL


#' Medellin Rainfall Information
#'
#' This dataset, Medellin_rain_tbl_df, is a tibble containing information about rainfall
#' measurements in Medellin, Colombia, including station identifiers, geographical coordinates,
#' date of observation, and rainfall values.
#'
#' The dataset name has been kept as Medellin_rain_tbl_df to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' ColombiAPI package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble. The original content has not been modified
#' in any way.
#'
#' @name Medellin_rain_tbl_df
#' @format A tibble with 185,705 observations and 8 variables:
#' \describe{
#'   \item{station_id}{Numeric identifier for the rain observation station.}
#'   \item{lat}{Numeric value representing the latitude of the station.}
#'   \item{lon}{Numeric value representing the longitude of the station.}
#'   \item{date}{Date of the rainfall observation.}
#'   \item{year}{Numeric year of the observation.}
#'   \item{month}{Numeric month of the observation.}
#'   \item{day}{Numeric day of the observation.}
#'   \item{rainfall}{Numeric value representing the amount of rainfall in millimeters.}
#' }
#' @source Originally taken from the tidychangepoint package version 0.0.1.
#' @usage data(Medellin_rain_tbl_df)
#' @export
load("data/Medellin_rain_tbl_df.rda")
NULL


#' Bogota Malls Information
#'
#' This dataset, Bogota_malls_tbl_df, is a tibble containing detailed information about shopping malls
#' located in Bogota, Colombia. It includes the mall names, physical addresses, web URLs, geographical coordinates,
#' and the locality to which each mall belongs.
#'
#' The dataset name has been kept as Bogota_malls_tbl_df to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' ColombiAPI package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble. The original content has not been modified
#' in any way.
#'
#' @name Bogota_malls_tbl_df
#' @format A tibble with 42 observations and 6 variables:
#' \describe{
#'   \item{NAME}{Character string representing the name of the shopping mall.}
#'   \item{ADDRESS}{Character string representing the physical address of the mall.}
#'   \item{URL}{Character string representing the web URL of the mall.}
#'   \item{LATITUD}{Numeric value representing the latitude of the mall.}
#'   \item{LONGITUD}{Numeric value representing the longitude of the mall.}
#'   \item{LOCALIDAD}{Character string representing the locality the mall belongs to.}
#' }
#' @source Originally taken from Kaggle, url: https://www.kaggle.com/datasets/erik172/bogota-shopping-malls.
#' @usage data(Bogota_malls_tbl_df)
#' @export
load("data/Bogota_malls_tbl_df.rda")
NULL



#' Tulua Public Schools Information
#'
#' This dataset, Tulua_Public_Schools_tbl_df, is a tibble containing detailed information about public schools
#' located in the municipality of Tulua, Valle del Cauca, Colombia. It includes the name, location, contact information,
#' and the geographical coordinates of each institution, as well as specific details about each school and its facilities.
#'
#' The dataset name has been kept as Tulua_Public_Schools_tbl_df to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' ColombiAPI package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble. The original content has not been modified
#' in any way.
#'
#' @name Tulua_Public_Schools_tbl_df
#' @format A tibble with 105 observations and 8 variables:
#' \describe{
#'   \item{COD_DANE_INS}{Numeric code representing the educational institution's DANE code.}
#'   \item{INSTITUCION}{Character string representing the name of the public school.}
#'   \item{SEDE}{Character string representing the name of the specific school location or branch.}
#'   \item{COD_DANE_SEDE}{Numeric code representing the DANE code of the specific school branch.}
#'   \item{TELEFONO}{Character string representing the phone number of the school.}
#'   \item{CORREOS}{Character string representing the email addresses of the school.}
#'   \item{DIRECCIÓN}{Character string representing the physical address of the school.}
#'   \item{CORDE_GEO}{Character string representing the geographical coordinates of the school.}
#' }
#' @source Originally taken from GOV.CO, url: https://www.datos.gov.co/Educaci-n/Listado-de-colegios-p-blicos-del-municipio-de-Tulu/scz9-f8ud/about_data
#' @usage data(Tulua_Public_Schools_tbl_df)
#' @export
load("data/Tulua_Public_Schools_tbl_df.rda")
NULL


#' Cannabis Licenses Information
#'
#' This dataset, Cannabis_Licenses_tbl_df, is a tibble containing detailed information about cannabis-related licenses
#' issued by the Ministry of Justice and Law in Colombia. It includes data on the number of received, denied, archived, modified,
#' and granted licenses for cannabis cultivation, as well as the licenses issued for both psychoactive and non-psychoactive cannabis plants.
#'
#' The dataset name has been kept as Cannabis_Licenses_tbl_df to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' ColombiAPI package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble. The original content has not been modified
#' in any way.
#'
#' @name Cannabis_Licenses_tbl_df
#' @format A tibble with 92 observations and 10 variables:
#' \describe{
#'   \item{Mes}{Character string representing the month in which the data was recorded.}
#'   \item{Solicitudes de licencias recibidas}{Numeric value representing the number of license requests received.}
#'   \item{Solicitudes Negadas}{Numeric value representing the number of denied license requests.}
#'   \item{Solicitudes Archivadas}{Numeric value representing the number of archived license requests.}
#'   \item{Solicitudes Modificadas}{Numeric value representing the number of modified license requests.}
#'   \item{Licencias Otorgadas}{Numeric value representing the number of licenses granted.}
#'   \item{Licencias expedidas de semillas para siembra}{Numeric value representing the number of seed cultivation licenses issued.}
#'   \item{Licencias expedidas de plantas cannabis psicoactivo}{Numeric value representing the number of psychoactive cannabis plant cultivation licenses issued.}
#'   \item{Licencias expedidas de plantas cannabis no psicoactivo}{Numeric value representing the number of non-psychoactive cannabis plant cultivation licenses issued.}
#'   \item{Año}{Numeric value representing the year in which the data was recorded.}
#' }
#' @source Originally taken from Kaggle, url: https://www.kaggle.com/datasets/josetroyatoscano/licencias-cannabis-colombia-full-dataset-feb-2024
#' @usage data(Cannabis_Licenses_tbl_df)
#' @export
load("data/Cannabis_Licenses_tbl_df.rda")
NULL


#' Colombian Coffee 2016 Export/Import
#'
#' This dataset, Colombia_coffee_tbl_df, is a tibble containing detailed information about Colombian coffee exports and imports in 2016.
#' It includes data on various factors such as trade flow, commodity codes, trade value, weight in kilograms, and information about the
#' countries involved in the trade. The dataset is sourced from Kaggle and provides a comprehensive analysis of the foreign trade of Colombian coffee.
#'
#' The dataset name has been kept as Colombia_coffee_tbl_df to avoid confusion with other datasets in the R ecosystem. This naming convention helps
#' distinguish this dataset as part of the ColombiAPI package and assists users in identifying its specific characteristics. The suffix 'tbl_df' indicates that the dataset is a tibble.
#' The original content has not been modified in any way.
#'
#' @name Colombia_coffee_tbl_df
#' @format A tibble with 106 observations and 35 variables:
#' \describe{
#'   \item{Classification}{Character string representing the classification of the coffee product.}
#'   \item{Year}{Numeric value representing the year of the data entry.}
#'   \item{Period}{Numeric value representing the period of the trade.}
#'   \item{Period Desc.}{Numeric value representing the period description.}
#'   \item{Aggregate Level}{Numeric value representing the aggregate level of the trade data.}
#'   \item{Is Leaf Code}{Numeric value indicating whether the trade involves a leaf product.}
#'   \item{Trade Flow Code}{Numeric value representing the trade flow code.}
#'   \item{Trade Flow}{Character string representing the flow of the trade, either export or import.}
#'   \item{Reporter Code}{Numeric value representing the code of the reporting country.}
#'   \item{Reporter}{Character string representing the reporting country.}
#'   \item{Reporter ISO}{Character string representing the ISO code of the reporting country.}
#'   \item{Partner Code}{Numeric value representing the code of the partner country.}
#'   \item{Partner}{Character string representing the partner country.}
#'   \item{Partner ISO}{Character string representing the ISO code of the partner country.}
#'   \item{2nd Partner Code}{Logical value indicating if there is a second partner country involved in the trade.}
#'   \item{2nd Partner}{Logical value indicating if there is a second partner country.}
#'   \item{2nd Partner ISO}{Logical value indicating if there is a second partner country's ISO code.}
#'   \item{Customs Proc. Code}{Logical value representing the customs procedure code.}
#'   \item{Customs}{Logical value indicating whether customs procedure information is available.}
#'   \item{Mode of Transport Code}{Logical value representing the mode of transport code.}
#'   \item{Mode of Transport}{Logical value indicating the mode of transport used in the trade.}
#'   \item{Commodity Code}{Character string representing the commodity code for coffee.}
#'   \item{Commodity}{Character string representing the commodity (coffee).}
#'   \item{Qty Unit Code}{Numeric value representing the quantity unit code.}
#'   \item{Qty Unit}{Character string representing the unit of quantity for the trade.}
#'   \item{Qty}{Logical value representing the quantity of coffee in the trade.}
#'   \item{Alt Qty Unit Code}{Logical value representing an alternative quantity unit code.}
#'   \item{Alt Qty Unit}{Numeric value representing an alternative quantity unit for the trade.}
#'   \item{Alt Qty}{Logical value representing an alternative quantity for the trade.}
#'   \item{Netweight (kg)}{Numeric value representing the net weight of the coffee in kilograms.}
#'   \item{Gross weight (kg)}{Logical value indicating the gross weight of the coffee in kilograms.}
#'   \item{Trade Value (US)}{Numeric value representing the trade value in US dollars.}
#'   \item{CIF Trade Value (US)}{Logical value representing the CIF trade value in US dollars.}
#'   \item{FOB Trade Value (US)}{Logical value representing the FOB trade value in US dollars.}
#'   \item{Flag}{Numeric value representing a flag for the dataset entry.}
#' }
#' @source Originally taken from Kaggle, url: https://www.kaggle.com/datasets/carlosbeltranv/colombian-coffee-2016
#' @usage data(Colombia_coffee_tbl_df)
#' @export
load("data/Colombia_coffee_tbl_df.rda")
NULL
