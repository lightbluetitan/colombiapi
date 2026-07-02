# Connected Devices in WiFi Zones of Cartagena (Spanish speaking)

This dataset, Cartagena_wifi_tbl_df, is a tibble containing information
about the number of devices connected in the public WiFi zones of the
District of Cartagena. It includes the year, month, corregimiento or
neighborhood, WiFi zone, and counts of connected devices by type (Other,
Smartphone, Tablet, PC). The dataset was obtained from GOV.CO Datos
Abiertos, last update on September 23, 2025.

## Usage

``` r
data(Cartagena_wifi_tbl_df)
```

## Format

A tibble with 468 observations and 8 variables:

- AÑO:

  Year of the record (numeric)

- MES:

  Month of the record (character)

- CORREGIMIENTO/BARRIO:

  Name of the corregimiento or neighborhood (character)

- ZONA WIFI:

  Name of the WiFi zone (character)

- OTRO:

  Number of connected devices categorized as 'Other' (numeric)

- SMARTPHONE:

  Number of connected smartphones (numeric)

- TABLET:

  Number of connected tablets (numeric)

- PC:

  Number of connected PCs (numeric)

## Source

Data obtained from GOV.CO Datos Abiertos: <https://www.datos.gov.co>

## Details

The dataset name has been kept as 'Cartagena_wifi_tbl_df' to avoid
confusion with other datasets in the R ecosystem. This naming convention
helps distinguish this dataset as part of the ColombiAPI package and
assists users in identifying its specific characteristics. The suffix
'tbl_df' indicates that the dataset is a tibble object. The original
content has not been modified in any way.
