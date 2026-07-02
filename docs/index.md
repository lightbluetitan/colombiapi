# ColombiAPI

[![License: GPL
v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![CRAN
downloads](https://cranlogs.r-pkg.org/badges/ColombiAPI)](https://cran.r-project.org/package=ColombiAPI)
[![CRAN total
downloads](https://cranlogs.r-pkg.org/badges/grand-total/ColombiAPI)](https://cran.r-project.org/package=ColombiAPI)

The `ColombiAPI` package provides a comprehensive interface to access
diverse public data about **Colombia** through multiple APIs and curated
datasets. The package integrates three different APIs: **API-Colombia**
for Colombian-specific data including geography, culture, tourism, and
government information; **World Bank API** for economic and demographic
indicators; and **Nager.Date API** for public holidays. This allows
users to retrieve up-to-date or historical information on topics such as
geographic locations, cultural attractions, economic indicators,
demographic data, and public holidays.

In addition to API-access functions, the package includes curated
datasets covering a wide range of topics, including **Bogota** air
stations, business and holiday dates, public schools, Colombian coffee
exports, cannabis licenses, **Medellin** rainfall, malls in **Bogota**,
indigenous languages, student admissions and school statistics, forest
liana mortality, municipal and regional data, connectivity and digital
infrastructure, program graduates, vehicle counts, international
visitors, and GDP projections. These datasets provide a rich and
multifaceted view of Colombian social, economic, environmental, and
technological information.

## Installation

You can install the `ColombiAPI` package from CRAN with the following R
function:

``` r


install.packages("ColombiAPI")
```

## Usage

After installation, load the package and start exploring and using its
functions and datasets.

``` r


library(ColombiAPI)
```

### ColombiAPI Functions

Below is a list of the main functions included in the package:

- [`get_colombia_airports()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_airports.md):
  Get Colombia’s Airports from API Colombia.

- [`get_colombia_attractions()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_attractions.md):
  Get All Touristic Attractions of Colombia from API Colombia.

- [`get_colombia_child_mortality()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_child_mortality.md):
  Get Colombia’s Under-5 Mortality Rate from World Bank.

- [`get_colombia_cities()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_cities.md):
  Get All Cities of Colombia from API Colombia.

- [`get_colombia_cpi()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_cpi.md):
  Get Colombia’s Consumer Price Index (2010 = 100) from World Bank.

- [`get_colombia_departments()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_departments.md):
  Get Colombia’s Departments from API Colombia.

- [`get_colombia_energy_use()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_energy_use.md):
  Get Colombia’s Energy Use (kg of oil equivalent per capita) from World
  Bank.

- [`get_colombia_gdp()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_gdp.md):
  Get Colombia’s GDP (current US\$) from World Bank.

- [`get_colombia_holidays()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_holidays.md):
  Get official public holidays in Colombia for a given year, e.g.,
  `get_colombia_holidays(2025)`.

- [`get_colombia_hospital_beds()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_hospital_beds.md):
  Get Colombia’s Hospital Beds (per 1,000 people) from World Bank.

- [`get_colombia_invasive_species()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_invasive_species.md):
  Get Invasive Species of Colombia from API Colombia.

- [`get_colombia_life_expectancy()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_life_expectancy.md):
  Get Colombia’s Life Expectancy at Birth (Total, Years) from World
  Bank.

- [`get_colombia_literacy_rate()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_literacy_rate.md):
  Get Colombia’s Adult Literacy Rate from World Bank.

- [`get_colombia_native_communities()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_native_communities.md):
  Get Native Communities of Colombia from API Colombia.

- [`get_colombia_natural_areas()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_natural_areas.md):
  Get Natural Areas of Colombia from API Colombia.

- [`get_colombia_population()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_population.md):
  Get Colombia’s Total Population from World Bank.

- [`get_colombia_presidents()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_presidents.md):
  Get Colombia’s Presidents from API Colombia.

- [`get_colombia_radios()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_radios.md):
  Get Radios of Colombia from API Colombia.

- [`get_colombia_regions()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_regions.md):
  Get Colombia’s Regions from API Colombia.

- [`get_colombia_typical_dishes()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_typical_dishes.md):
  Get Typical Dishes of Colombia from API Colombia.

- [`get_colombia_unemployment()`](https://lightbluetitan.github.io/colombiapi/reference/get_colombia_unemployment.md):
  Get Colombia’s Unemployment Rate (Total) from World Bank.

- [`view_datasets_ColombiAPI()`](https://lightbluetitan.github.io/colombiapi/reference/view_datasets_ColombiAPI.md):
  View available curated datasets included in ColombiAPI.

### Dataset Suffixes

Each dataset in `ColombiAPI` is labeled with a `suffix` to indicate its
type and structure:

- `_df`: A standard data frame.

- `_tbl_df`: A tibble, a modern version of a data frame with better
  formatting and functionality.

- `_Date`: An object of type Date.

### Datasets Included in ColombiAPI

In addition to API functions, `ColombiAPI` includes several preloaded
datasets that provide valuable insights into various aspects of
`Colombia`:

- `Bogota_airstations_df`: A data frame containing coordinates of air
  quality monitoring stations in Bogota.

- `Bogota_business_Date`: A Date object listing official business dates
  in Bogota.

- `Colombia_coffee_tbl_df`: A tibble with details of Colombian coffee
  export and import for the year 2016.

## Example Code:

``` r


# Load the package

library(ColombiAPI)

# List colombian presidents

get_colombia_presidents()

# Load a dataset

data("Bogota_airstations_df")

# # Shows six rows of the dataset

head(Bogota_airstations_df)

# Load another dataset

data("Tulua_Public_Schools_tbl_df")

# Display the structure of the tibble

str(Tulua_Public_Schools_tbl_df)
```
