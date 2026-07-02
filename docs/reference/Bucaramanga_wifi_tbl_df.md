# WiFi Connectivity Zones in Bucaramanga (Spanish speaking)

This dataset, Bucaramanga_wifi_tbl_df, is a tibble containing
information about community WiFi connection zones in the municipality of
Bucaramanga. It includes details such as the zone name, address,
neighborhood, commune, urban or rural classification, department,
municipality, and geographic coordinates. This dataset was taken from
GOV.CO Datos Abiertos, last update on September 20, 2025.

## Usage

``` r
data(Bucaramanga_wifi_tbl_df)
```

## Format

A tibble with 82 observations and 9 variables:

- NOMBRE ZONA WIFI:

  Name of the WiFi zone (character)

- DIRECCION:

  Address of the WiFi zone (character)

- BARRIO:

  Neighborhood of the WiFi zone (character)

- COMUNA:

  Commune of the WiFi zone (character)

- ZONA (URBANA/RURAL):

  Urban or rural classification (character)

- DEPARTAMENTO:

  Department where the zone is located (character)

- MUNICIPIO:

  Municipality where the zone is located (character)

- LATITUD:

  Latitude coordinate of the WiFi zone (character)

- LONGITUD:

  Longitude coordinate of the WiFi zone (character)

## Source

Data obtained from GOV.CO Datos Abiertos:
<https://www.datos.gov.co/Ciencia-Tecnolog-a-e-Innovaci-n/SERVICIO-DE-CONECTIVIDAD-ZONAS-WIFI/9n9m-2dqq/about_data>

## Details

The dataset name has been kept as 'Bucaramanga_wifi_tbl_df' to avoid
confusion with other datasets in the R ecosystem. This naming convention
helps distinguish this dataset as part of the ColombiAPI package and
assists users in identifying its specific characteristics. The suffix
'tbl_df' indicates that the dataset is a tibble object. The original
content has not been modified in any way.
