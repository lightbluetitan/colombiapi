# ColombiAPI

The `ColombiAPI` package provides a seamless interface to access diverse public data about `Colombia` through the `API-Colombia`, a RESTful API.
The package enables users to explore various aspects of `Colombia`, including general information, geography, and cultural insights.
It includes five API-related functions to retrieve data on topics such as `Colombia`'s general information, airports, departments, regions, and presidents.

Additionally, `ColombiAPI` offers a built-in function to view the datasets available within the package.
The package also includes curated datasets covering Bogota air stations, business and holiday dates, public schools, Colombian coffee exports,
cannabis licenses, Medellin rainfall, and malls in Bogota, making it a comprehensive tool for exploring `Colombia`'s data.

## Installation

You can install the `ColombiAPI` package from CRAN with the following R function:

```R

install.packages("ColombiAPI")

```

## Usage

After installation, load the package and start exploring and using its functions and  datasets.


### ColombiAPI Functions

- get_Colombia_info() Get Information About Colombia

- get_airports_list() Get the List of Airports in Colombia

- get_departments_list() Get the List of Departments in Colombia

- get_presidents_list() Get the List of Presidents of Colombia

- get_regions_list() Get the List of Regions in Colombia

- view_datasets() List of Datasets in the ColombiAPI Package

### Some of the ColombiAPI Datasets

The naming convention helps you easily understand the structure of each dataset:

- `_df: Data frame`.

- `_Date: Date object`.

- `_tbl_df: Tibble (a modern version of a data frame)`.

- Bogota_airstations_df: Bogota Air Stations Coordinates

- Bogota_holidays_Date: Bogota Holidays Dates

- Tulua_Public_Schools_tbl_df: Tulua Public Schools Information

## Example Code:

```R

# Load the package
library(ColombiAPI)

# List colombian presidents
get_presidents_list()

# Shows Colombia's general information 
get_Colombia_info()

# Load a dataset
data("Bogota_airstations_df")

# View the dataset
head(Bogota_airstations_df)

# Load another dataset
data("Tulua_Public_Schools_tbl_df")

# Display the structure of the tibble
str(Tulua_Public_Schools_tbl_df)


```

