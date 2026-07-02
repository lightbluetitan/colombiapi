# Medellin Rainfall Information

This dataset, Medellin_rain_tbl_df, is a tibble containing information
about rainfall measurements in Medellin, Colombia, including station
identifiers, geographical coordinates, date of observation, and rainfall
values.

## Usage

``` r
data(Medellin_rain_tbl_df)
```

## Format

A tibble with 185,705 observations and 8 variables:

- station_id:

  Numeric identifier for the rain observation station.

- lat:

  Numeric value representing the latitude of the station.

- lon:

  Numeric value representing the longitude of the station.

- date:

  Date of the rainfall observation.

- year:

  Numeric year of the observation.

- month:

  Numeric month of the observation.

- day:

  Numeric day of the observation.

- rainfall:

  Numeric value representing the amount of rainfall in millimeters.

## Source

Originally taken from the tidychangepoint package version 0.0.1.

## Details

The dataset name has been kept as Medellin_rain_tbl_df to avoid
confusion with other datasets in the R ecosystem. This naming convention
helps distinguish this dataset as part of the ColombiAPI package and
assists users in identifying its specific characteristics. The suffix
'tbl_df' indicates that the dataset is a tibble. The original content
has not been modified in any way.
