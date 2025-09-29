# ColombiAPI

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![CRAN downloads](https://cranlogs.r-pkg.org/badges/ColombiAPI)](https://cran.r-project.org/package=ColombiAPI)
[![CRAN total downloads](https://cranlogs.r-pkg.org/badges/grand-total/ColombiAPI)](https://cran.r-project.org/package=ColombiAPI)

The `ColombiAPI` package provides a comprehensive interface to access diverse public data about **Colombia** through multiple APIs and curated datasets. The package integrates four different APIs: **API-Colombia** for Colombian-specific data including geography, culture, tourism, and government information; **World Bank API** for economic and demographic indicators; **Nager.Date API** for public holidays; and **REST Countries API** for general country information. This allows users to retrieve up-to-date or historical information on topics such as geographic locations, cultural attractions, economic indicators, demographic data, and public holidays.

In addition to API-access functions, the package includes curated datasets covering a wide range of topics, including **Bogota** air stations, business and holiday dates, public schools, Colombian coffee exports, cannabis licenses, **Medellin** rainfall, malls in **Bogota**, indigenous languages, student admissions and school statistics, forest liana mortality, municipal and regional data, connectivity and digital infrastructure, program graduates, vehicle counts, international visitors, and GDP projections. These datasets provide a rich and multifaceted view of Colombian social, economic, environmental, and technological information.

## Installation

You can install the `ColombiAPI` package from CRAN with the following R function:

```R

install.packages("ColombiAPI")

```


## Usage

After installation, load the package and start exploring and using its functions and datasets.

```R

library(ColombiAPI)

```

### ColombiAPI Functions

Below is a list of the main functions included in the package:

- `get_colombia_airports()`: Get Colombia's Airports from API Colombia.

- `get_colombia_attractions()`: Get All Touristic Attractions of Colombia from API Colombia.

- `get_colombia_child_mortality()`: Get Colombia's Under-5 Mortality Rate from World Bank.

- `get_colombia_cities()`: Get All Cities of Colombia from API Colombia.

- `get_colombia_cpi()`: Get Colombia's Consumer Price Index (2010 = 100) from World Bank.

- `get_colombia_departments()`: Get Colombia's Departments from API Colombia.

- `get_colombia_energy_use()`: Get Colombia's Energy Use (kg of oil equivalent per capita) from World Bank.

- `get_colombia_gdp function()`: Get Colombia's GDP (current US$) from World Bank.

- `get_colombia_holidays()`: Get official public holidays in Colombia for a given year, e.g., `get_colombia_holidays(2025)`.

- `get_colombia_hospital_beds()`: Get Colombia's Hospital Beds (per 1,000 people) from World Bank.

- `get_colombia_invasive_species()`: Get Invasive Species of Colombia from API Colombia.

- `get_colombia_life_expectancy()`: Get Colombia's Life Expectancy at Birth (Total, Years) from World Bank.

- `get_colombia_literacy_rate()`: Get Colombia's Adult Literacy Rate from World Bank.

- `get_colombia_native_communities()`: Get Native Communities of Colombia from API Colombia.

- `get_colombia_natural_areas()`: Get Natural Areas of Colombia from API Colombia.

- `get_colombia_population()`: Get Colombia's Total Population from World Bank.

- `get_colombia_presidents()`: Get Colombia's Presidents from API Colombia.

- `get_colombia_radios()`: Get Radios of Colombia from API Colombia.

- `get_colombia_regions()`: Get Colombia's Regions from API Colombia.

- `get_colombia_typical_dishes()`: Get Typical Dishes of Colombia from API Colombia.

- `get_colombia_unemployment()`: Get Colombia's Unemployment Rate (Total) from World Bank.

- `get_country_info_co()`: Get Country Information for Colombia from restcountries.

- `view_datasets_ColombiAPI()`: View available curated datasets included in ColombiAPI.


### Dataset Suffixes

Each dataset in `ColombiAPI` is labeled with a `suffix` to indicate its type and structure:

- `_df`: A standard data frame.

- `_tbl_df`: A tibble, a modern version of a data frame with better formatting and functionality.

- `_Date`: An object of type Date.


### Datasets Included in ColombiAPI

In addition to API functions, `ColombiAPI` includes several preloaded datasets that provide valuable insights into various aspects of `Colombia`:

- `Bogota_airstations_df`: A data frame containing coordinates of air quality monitoring stations in Bogota.

- `Bogota_business_Date`: A Date object listing official business dates in Bogota. 

- `Colombia_coffee_tbl_df`: A tibble with details of Colombian coffee export and import for the year 2016.

## Example Code:

```R

# Load the package

library(ColombiAPI)

# List colombian presidents

get_colombia_presidents()

# Shows Colombia's general information 

get_country_info_co()

# Load a dataset

data("Bogota_airstations_df")

# # Shows six rows of the dataset

head(Bogota_airstations_df)

# Load another dataset

data("Tulua_Public_Schools_tbl_df")

# Display the structure of the tibble

str(Tulua_Public_Schools_tbl_df)


```

