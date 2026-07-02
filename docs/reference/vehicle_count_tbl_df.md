# Vehicle Count: Cars and Motorcycles (Spanish speaking)

This dataset, vehicle_count_tbl_df, is a tibble containing information
from a license plate recognition camera system designed to generate
trends and metrics for traffic management decision-making. It includes
data on the date, sensor name, type of vehicle, and the number of
vehicles counted. The dataset was obtained from GOV.CO Datos Abiertos,
last update on March 26, 2024.

## Usage

``` r
data(vehicle_count_tbl_df)
```

## Format

A tibble with 262,114 observations and 4 variables:

- Fecha:

  Date of the record (character)

- Nombre Sensor:

  Name of the sensor capturing the data (character)

- Tipo Vehiculo:

  Type of vehicle (Cars, Motorcycles, etc.) (character)

- Cantidad:

  Number of vehicles counted (numeric)

## Source

Data obtained from GOV.CO Datos Abiertos:
<https://www.datos.gov.co/Ciencia-Tecnolog-a-e-Innovaci-n/Conteo-de-Autos-y-Motos/s53k-ztax/about_data>

## Details

The dataset name has been kept as 'vehicle_count_tbl_df' to avoid
confusion with other datasets in the R ecosystem. This naming convention
helps distinguish this dataset as part of the ColombiAPI package and
assists users in identifying its specific characteristics. The suffix
'tbl_df' indicates that the dataset is a tibble object. The original
content has not been modified in any way.
