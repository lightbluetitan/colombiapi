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


#' Comparative Vocabulary for Colombia's Indigenous Languages
#'
#' This dataset, indigenous_vocabulary_df, is a data frame containing a comparative
#' vocabulary (a "wordlist") for 69 indigenous languages of Colombia, originally compiled
#' by Huber & Reed (1992). The dataset provides lexical correspondences across multiple
#' languages, supporting linguistic, anthropological, and historical research.
#'
#' The dataset name has been kept as 'indigenous_vocabulary_df' to avoid confusion
#' with other datasets in the R ecosystem. This naming convention helps distinguish
#' this dataset as part of the ColombiAPI package and assists users in identifying
#' its specific characteristics. The suffix 'df' indicates that the dataset is
#' a data frame object. The original content has not been modified in any way.
#'
#' @name indigenous_vocabulary_df
#' @format A data frame with 27,521 observations and 4 variables:
#' \describe{
#'   \item{CONCEPT}{Gloss or concept represented in the wordlist (factor with 366 levels)}
#'   \item{COUNTERPART}{Word corresponding to the concept in the given language (character)}
#'   \item{DOCULECT}{Name of the language or variety (factor with 71 levels)}
#'   \item{TOKENS}{Tokenized form of the counterpart (character)}
#' }
#' @source Data taken from the \pkg{qlcMatrix} package version 0.9.9
#' @usage data(indigenous_vocabulary_df)
#' @export
load("data/indigenous_vocabulary_df.rda")
NULL


#' Admitted Students to the Science Faculty, UNAL (2013-I)
#'
#' This dataset, admitted_students_df, is a data frame containing the admission
#' scores and socio-demographic information of 445 students admitted to the seven
#' careers of the Facultad de Ciencias at the Universidad Nacional de Colombia,
#' Bogotá, for the first semester of 2013. It includes exam component scores, gender,
#' socio-economic background, and other demographic attributes.
#'
#' The dataset name has been kept as 'admitted_students_df' to avoid confusion
#' with other datasets in the R ecosystem. This naming convention helps distinguish
#' this dataset as part of the ColombiAPI package and assists users in identifying
#' its specific characteristics. The suffix 'df' indicates that the dataset is
#' a data frame object. The original content has not been modified in any way.
#'
#' @name admitted_students_df
#' @format A data frame with 445 observations and 15 variables:
#' \describe{
#'   \item{carr}{Career or program admitted to (factor with 7 levels)}
#'   \item{mate}{Mathematics exam score (numeric)}
#'   \item{cien}{Science exam score (numeric)}
#'   \item{soci}{Social sciences exam score (numeric)}
#'   \item{text}{Textual reasoning exam score (numeric)}
#'   \item{imag}{Abstract/imagery reasoning exam score (numeric)}
#'   \item{exam}{Total exam score (numeric)}
#'   \item{gene}{Gender of the student (factor with 2 levels)}
#'   \item{estr}{Socio-economic stratum (factor with 3 levels)}
#'   \item{orig}{Origin or background classification (factor with 3 levels)}
#'   \item{edad}{Age group (factor with 4 levels)}
#'   \item{niLE}{Mother tongue indicator (factor with 2 levels)}
#'   \item{niMa}{Maternal education indicator (factor with 2 levels)}
#'   \item{stra}{Admission stratum or classification (factor with 7 levels)}
#'   \item{age}{Age of the student in years (numeric)}
#' }
#' @source Data taken from the \pkg{FactoClass} package version 1.2.9
#' @usage data(admitted_students_df)
#' @export
load("data/admitted_students_df.rda")
NULL


#' Departments by Levels of Schools in Colombia
#'
#' This dataset, school_levels_df, is a data frame containing a contingency table
#' that classifies schools in Colombia by department and level of performance of
#' their students. The dataset summarizes counts of schools across different
#' performance categories in three main subjects: communication, mathematics,
#' and science.
#'
#' The dataset name has been kept as 'school_levels_df' to avoid confusion
#' with other datasets in the R ecosystem. This naming convention helps distinguish
#' this dataset as part of the ColombiAPI package and assists users in identifying
#' its specific characteristics. The suffix 'df' indicates that the dataset is
#' a data frame object. The original content has not been modified in any way.
#'
#' @name school_levels_df
#' @format A data frame with 29 observations and 12 variables:
#' \describe{
#'   \item{Cinferior}{Number of schools with communication results at the inferior level (numeric)}
#'   \item{Cbajo}{Number of schools with communication results at the low level (numeric)}
#'   \item{Cmedio}{Number of schools with communication results at the medium level (numeric)}
#'   \item{Calto}{Number of schools with communication results at the high level (numeric)}
#'   \item{Minferior}{Number of schools with mathematics results at the inferior level (numeric)}
#'   \item{Mbajo}{Number of schools with mathematics results at the low level (numeric)}
#'   \item{Mmedio}{Number of schools with mathematics results at the medium level (numeric)}
#'   \item{Malto}{Number of schools with mathematics results at the high level (numeric)}
#'   \item{Tinferior}{Number of schools with science results at the inferior level (numeric)}
#'   \item{Tbajo}{Number of schools with science results at the low level (numeric)}
#'   \item{Tmedio}{Number of schools with science results at the medium level (numeric)}
#'   \item{Talto}{Number of schools with science results at the high level (numeric)}
#' }
#' @source Data taken from the \pkg{FactoClass} package version 1.2.9
#' @usage data(school_levels_df)
#' @export
load("data/school_levels_df.rda")
NULL


#' Mortality of lianas (vines) in tropical forests
#'
#' This dataset, 'dead_lianas_df', is a data frame containing information on the mortality
#' of vascular epiphytes (lianas) in tropical forests of the Colombian Andes. The study
#' is part of the project "Diversity and dynamics of vascular epiphytes in Colombian Andes"
#' supported by COLCIENCIAS (contract 2115-2013). The data corresponds to the first large-scale
#' assessment of vascular epiphyte mortality in the neotropics.
#'
#' The dataset name has been kept as 'dead_lianas_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' ColombiAPI package and assists users in identifying its specific characteristics.
#' The suffix 'df' indicates that the dataset is a data frame object. The original content has not
#' been modified in any way.
#'
#' @name dead_lianas_df
#' @format A data frame with 4,247 observations and 52 variables:
#' \describe{
#'   \item{PlotSite}{Plot site identifier (character)}
#'   \item{Y.Plot}{Y coordinate of the plot (numeric)}
#'   \item{X.Plot}{X coordinate of the plot (numeric)}
#'   \item{PhoroNo}{Phorophyte number (integer)}
#'   \item{EpiFam}{Epiphyte family (character)}
#'   \item{EpiGen}{Epiphyte genus (character)}
#'   \item{cf.aff}{Taxonomic uncertainty or affiliation (character)}
#'   \item{Species}{Epiphyte species name (character)}
#'   \item{Author}{Species author (character)}
#'   \item{EpiAzi}{Epiphyte azimuth (character)}
#'   \item{BraAzi}{Branch azimuth (integer)}
#'   \item{EpiDisTru}{Epiphyte distance from trunk (numeric)}
#'   \item{EpiSize}{Epiphyte size (numeric)}
#'   \item{EpiAttHei}{Epiphyte attachment height (numeric)}
#'   \item{Date0}{Initial survey date (Date)}
#'   \item{Date1}{Follow-up survey date (Date)}
#'   \item{Location}{Location name (character)}
#'   \item{Mortality}{Mortality status (factor with 2 levels)}
#'   \item{MorCat}{Mortality category (character)}
#'   \item{Elevation}{Elevation in meters (integer)}
#'   \item{AP_bio12}{Annual precipitation (integer)}
#'   \item{PDM_bio14}{Precipitation of driest month (integer)}
#'   \item{PS_bio15}{Precipitation seasonality (integer)}
#'   \item{MDT_bio2}{Mean diurnal temperature range (integer)}
#'   \item{TS_bio4}{Temperature seasonality (integer)}
#'   \item{ATR_bio7}{Annual temperature range (integer)}
#'   \item{AET}{Actual evapotranspiration (integer)}
#'   \item{BasAre}{Basal area (numeric)}
#'   \item{BasAre5_10}{Basal area of trees 5–10 cm DBH (numeric)}
#'   \item{BasAre10}{Basal area of trees ≥10 cm DBH (numeric)}
#'   \item{Ind10}{Number of individuals ≥10 cm DBH (integer)}
#'   \item{Ind5}{Number of individuals ≥5 cm DBH (numeric)}
#'   \item{Ind5_10}{Number of individuals 5–10 cm DBH (numeric)}
#'   \item{Ind10_15}{Number of individuals 10–15 cm DBH (integer)}
#'   \item{Ind15_20}{Number of individuals 15–20 cm DBH (integer)}
#'   \item{Ind20_25}{Number of individuals 20–25 cm DBH (integer)}
#'   \item{Ind25_30}{Number of individuals 25–30 cm DBH (integer)}
#'   \item{Ind30}{Number of individuals ≥30 cm DBH (integer)}
#'   \item{TreeHei}{Tree height (numeric)}
#'   \item{MedHei}{Median tree height (numeric)}
#'   \item{MaxHei}{Maximum tree height (numeric)}
#'   \item{BranchNumb}{Number of branches (integer)}
#'   \item{MEAH}{Mean epiphyte attachment height (numeric)}
#'   \item{MEAH_sd}{Standard deviation of mean epiphyte attachment height (numeric)}
#'   \item{MSP}{Mean species per phorophyte (integer)}
#'   \item{MSP_sd}{Standard deviation of mean species per phorophyte (integer)}
#'   \item{Htree}{Mean tree height (numeric)}
#'   \item{Htree_sd}{Standard deviation of mean tree height (numeric)}
#'   \item{BranNum}{Mean branch number (numeric)}
#'   \item{BranNUm_sd}{Standard deviation of branch number (numeric)}
#'   \item{tree.id}{Tree identifier (character)}
#'   \item{dead}{Tree mortality status (factor with 2 levels)}
#' }
#' @source Data taken from the \pkg{biometrics} package version 1.0.2
#' @usage data(dead_lianas_df)
#' @export
load("data/dead_lianas_df.rda")
NULL



#' Municipalities of Colombia (Spanish speaking)
#'
#' This dataset, municipalities_tbl_df, is a tibble containing the list of municipalities
#' of Colombia and their corresponding departments, ordered alphabetically.
#'
#' The dataset name has been kept as 'municipalities_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' ColombiAPI package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble object. The original content has not
#' been modified in any way.
#'
#' @name municipalities_tbl_df
#' @format A tibble with 1,141 observations and 2 variables:
#' \describe{
#'   \item{Departamento}{Name of the department (character)}
#'   \item{Municipio}{Name of the municipality (character)}
#' }
#' @source Data obtained from Kaggle: \url{https://www.kaggle.com/datasets/cavp95/municipios-colombia}
#' @usage data(municipalities_tbl_df)
#' @export
load("data/municipalities_tbl_df.rda")
NULL


#' WiFi Connectivity Zones in Bucaramanga (Spanish speaking)
#'
#' This dataset, Bucaramanga_wifi_tbl_df, is a tibble containing information about
#' community WiFi connection zones in the municipality of Bucaramanga. It includes
#' details such as the zone name, address, neighborhood, commune, urban or rural
#' classification, department, municipality, and geographic coordinates.
#' This dataset was taken from GOV.CO Datos Abiertos, last update on September 20, 2025.
#'
#' The dataset name has been kept as 'Bucaramanga_wifi_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' ColombiAPI package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble object. The original content has not
#' been modified in any way.
#'
#' @name Bucaramanga_wifi_tbl_df
#' @format A tibble with 82 observations and 9 variables:
#' \describe{
#'   \item{NOMBRE ZONA WIFI}{Name of the WiFi zone (character)}
#'   \item{DIRECCION}{Address of the WiFi zone (character)}
#'   \item{BARRIO}{Neighborhood of the WiFi zone (character)}
#'   \item{COMUNA}{Commune of the WiFi zone (character)}
#'   \item{ZONA (URBANA/RURAL)}{Urban or rural classification (character)}
#'   \item{DEPARTAMENTO}{Department where the zone is located (character)}
#'   \item{MUNICIPIO}{Municipality where the zone is located (character)}
#'   \item{LATITUD}{Latitude coordinate of the WiFi zone (character)}
#'   \item{LONGITUD}{Longitude coordinate of the WiFi zone (character)}
#' }
#' @source Data obtained from GOV.CO Datos Abiertos: \url{https://www.datos.gov.co/Ciencia-Tecnolog-a-e-Innovaci-n/SERVICIO-DE-CONECTIVIDAD-ZONAS-WIFI/9n9m-2dqq/about_data}
#' @usage data(Bucaramanga_wifi_tbl_df)
#' @export
load("data/Bucaramanga_wifi_tbl_df.rda")
NULL



#' Connected Devices in WiFi Zones of Cartagena (Spanish speaking)
#'
#' This dataset, Cartagena_wifi_tbl_df, is a tibble containing information about
#' the number of devices connected in the public WiFi zones of the District of Cartagena.
#' It includes the year, month, corregimiento or neighborhood, WiFi zone, and counts of
#' connected devices by type (Other, Smartphone, Tablet, PC). The dataset was obtained
#' from GOV.CO Datos Abiertos, last update on September 23, 2025.
#'
#' The dataset name has been kept as 'Cartagena_wifi_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' ColombiAPI package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble object. The original content has not
#' been modified in any way.
#'
#' @name Cartagena_wifi_tbl_df
#' @format A tibble with 468 observations and 8 variables:
#' \describe{
#'   \item{AÑO}{Year of the record (numeric)}
#'   \item{MES}{Month of the record (character)}
#'   \item{CORREGIMIENTO/BARRIO}{Name of the corregimiento or neighborhood (character)}
#'   \item{ZONA WIFI}{Name of the WiFi zone (character)}
#'   \item{OTRO}{Number of connected devices categorized as 'Other' (numeric)}
#'   \item{SMARTPHONE}{Number of connected smartphones (numeric)}
#'   \item{TABLET}{Number of connected tablets (numeric)}
#'   \item{PC}{Number of connected PCs (numeric)}
#' }
#' @source Data obtained from GOV.CO Datos Abiertos: \url{https://www.datos.gov.co/Ciencia-Tecnolog-a-e-Innovaci-n/Dispositivos-conectados-en-las-zonas-wifi-del-dist/94zk-4tpe/about_data}
#' @usage data(Cartagena_wifi_tbl_df)
#' @export
load("data/Cartagena_wifi_tbl_df.rda")
NULL



#' "Advancing in Digital" Program Graduates (Spanish speaking)
#'
#' This dataset, digital_graduates_tbl_df, is a tibble containing information about
#' graduates of the first cohort in the various courses of the "Avanzando en lo Digital"
#' program, an initiative aimed at developing digital skills. It includes data such as year,
#' age, gender, courses enrolled, zone, ethnicity, and socioeconomic stratum.
#' The dataset was obtained from GOV.CO Datos Abiertos, last update on October 3, 2024.
#'
#' The dataset name has been kept as 'digital_graduates_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' ColombiAPI package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble object. The original content has not
#' been modified in any way.
#'
#' @name digital_graduates_tbl_df
#' @format A tibble with 230 observations and 7 variables:
#' \describe{
#'   \item{AÑO}{Year of graduation (numeric)}
#'   \item{EDAD}{Age of the graduate (numeric)}
#'   \item{GENERO}{Gender of the graduate (character)}
#'   \item{CURSOS INSCRITOS}{Courses in which the graduate was enrolled (character)}
#'   \item{ZONA}{Geographical zone of the graduate (character)}
#'   \item{ETNIA}{Ethnicity of the graduate (character)}
#'   \item{ESTRATO}{Socioeconomic stratum of the graduate (numeric)}
#' }
#' @source Data obtained from GOV.CO Datos Abiertos: \url{https://www.datos.gov.co/Ciencia-Tecnolog-a-e-Innovaci-n/GRADUADOS-AVANZANDO-EN-LO-DIGITAL-PRIMERA-PROMOCIO/yfz9-fwqr/about_data}
#' @usage data(digital_graduates_tbl_df)
#' @export
load("data/digital_graduates_tbl_df.rda")
NULL


#' Vehicle Count: Cars and Motorcycles (Spanish speaking)
#'
#' This dataset, vehicle_count_tbl_df, is a tibble containing information from a license plate
#' recognition camera system designed to generate trends and metrics for traffic management
#' decision-making. It includes data on the date, sensor name, type of vehicle, and the
#' number of vehicles counted. The dataset was obtained from GOV.CO Datos Abiertos, last
#' update on March 26, 2024.
#'
#' The dataset name has been kept as 'vehicle_count_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' ColombiAPI package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble object. The original content has not
#' been modified in any way.
#'
#' @name vehicle_count_tbl_df
#' @format A tibble with 262,114 observations and 4 variables:
#' \describe{
#'   \item{Fecha}{Date of the record (character)}
#'   \item{Nombre Sensor}{Name of the sensor capturing the data (character)}
#'   \item{Tipo Vehiculo}{Type of vehicle (Cars, Motorcycles, etc.) (character)}
#'   \item{Cantidad}{Number of vehicles counted (numeric)}
#' }
#' @source Data obtained from GOV.CO Datos Abiertos: \url{https://www.datos.gov.co/Ciencia-Tecnolog-a-e-Innovaci-n/Conteo-de-Autos-y-Motos/s53k-ztax/about_data}
#' @usage data(vehicle_count_tbl_df)
#' @export
load("data/vehicle_count_tbl_df.rda")
NULL


#' Non-Resident Foreign Visitors to Colombia (Spanish speaking)
#'
#' This dataset, foreign_visitors_tbl_df, is a tibble containing information about
#' non-resident foreigners entering Colombia through various migration points.
#' It includes data on the year, month, destination department, destination city,
#' country of residence of the foreign visitor, and the number of non-resident foreigners.
#' The dataset was obtained from GOV.CO Datos Abiertos, last update on September 25, 2025.
#'
#' The dataset name has been kept as 'foreign_visitors_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' ColombiAPI package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble object. The original content has not
#' been modified in any way.
#'
#' @name foreign_visitors_tbl_df
#' @format A tibble with 466,915 observations and 6 variables:
#' \describe{
#'   \item{Año}{Year of the record (numeric)}
#'   \item{Mes}{Month of the record (character)}
#'   \item{Departamento}{Destination department in Colombia (character)}
#'   \item{Ciudad}{Destination city in Colombia (character)}
#'   \item{PaisOEEResidencia}{Country of residence of the foreign visitor (character)}
#'   \item{Cant Extranjeros no Residentes}{Number of non-resident foreign visitors (numeric)}
#' }
#' @source Data obtained from GOV.CO Datos Abiertos: \url{https://www.datos.gov.co/Comercio-Industria-y-Turismo/Extranjeros-No-Residentes/7wm8-w5ad/about_data}
#' @usage data(foreign_visitors_tbl_df)
#' @export
load("data/foreign_visitors_tbl_df.rda")
NULL


#' Digital Centers in Sucre (Spanish speaking)
#'
#' This dataset, digital_centers_tbl_df, is a tibble containing information about
#' Digital Centers located in the department of Sucre. It includes details such as
#' department name, municipality name, PDET status, name of the populated center,
#' educational center name, start date of operation, end date of initial operation,
#' and current status. The dataset was obtained from GOV.CO Datos Abiertos, last
#' update on April 20, 2024.
#'
#' The dataset name has been kept as 'digital_centers_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' ColombiAPI package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble object. The original content has not
#' been modified in any way.
#'
#' @name digital_centers_tbl_df
#' @format A tibble with 475 observations and 8 variables:
#' \describe{
#'   \item{NOMBRE DEPARTAMENTO}{Name of the department (character)}
#'   \item{NOMBRE MUNICIPIO}{Name of the municipality (character)}
#'   \item{PDET}{PDET status (character)}
#'   \item{NOMBRE CENTRO POBLADO}{Name of the populated center (character)}
#'   \item{NOMBRE SEDE EDUCATIVA}{Name of the educational center (character)}
#'   \item{FECHA INICIO DE OPERACIÓN}{Start date of operation (character)}
#'   \item{FIN DE OPERACIÓN INICIAL}{End date of initial operation (character)}
#'   \item{ESTADO}{Current status of the center (character)}
#' }
#' @source Data obtained from GOV.CO Datos Abiertos: \url{https://www.datos.gov.co/Ciencia-Tecnolog-a-e-Innovaci-n/Centros-Digitales-Sucre-/pwyn-md8n/about_data}
#' @usage data(digital_centers_tbl_df)
#' @export
load("data/digital_centers_tbl_df.rda")
NULL


#' Departmental GDP Projection (Spanish speaking)
#'
#' This dataset, gdp_departments_tbl_df, is a tibble containing the projected
#' Gross Domestic Product (GDP) at constant prices for the departments of Colombia,
#' expressed in 2015 prices. It includes data such as year, economic activity,
#' sector, price type, DIVIPOLA department code, department name, and GDP value
#' in thousands of millions of pesos. The dataset was obtained from GOV.CO Datos
#' Abiertos, last update on November 1, 2024.
#'
#' The dataset name has been kept as 'gdp_departments_tbl_df' to avoid confusion with other datasets
#' in the R ecosystem. This naming convention helps distinguish this dataset as part of the
#' ColombiAPI package and assists users in identifying its specific characteristics.
#' The suffix 'tbl_df' indicates that the dataset is a tibble object. The original content has not
#' been modified in any way.
#'
#' @name gdp_departments_tbl_df
#' @format A tibble with 16,302 observations and 7 variables:
#' \describe{
#'   \item{Año}{Year of the record (numeric)}
#'   \item{Actividad}{Economic activity (character)}
#'   \item{Sector}{Sector of the economy (character)}
#'   \item{Tipo de precios}{Price type (character)}
#'   \item{Código Departamento (DIVIPOLA)}{DIVIPOLA code of the department (numeric)}
#'   \item{Departamento}{Name of the department (character)}
#'   \item{Valor (miles de millones de pesos)}{GDP value in thousands of millions of pesos (numeric)}
#' }
#' @source Data obtained from GOV.CO Datos Abiertos: \url{https://www.datos.gov.co/Econom-a-y-Finanzas/PIB-Departamental-con-proyecci-n/kgyi-qc7j/about_data}
#' @usage data(gdp_departments_tbl_df)
#' @export
load("data/gdp_departments_tbl_df.rda")
NULL



