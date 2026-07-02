# Cannabis Licenses Information

This dataset, Cannabis_Licenses_tbl_df, is a tibble containing detailed
information about cannabis-related licenses issued by the Ministry of
Justice and Law in Colombia. It includes data on the number of received,
denied, archived, modified, and granted licenses for cannabis
cultivation, as well as the licenses issued for both psychoactive and
non-psychoactive cannabis plants.

## Usage

``` r
data(Cannabis_Licenses_tbl_df)
```

## Format

A tibble with 92 observations and 10 variables:

- Mes:

  Character string representing the month in which the data was
  recorded.

- Solicitudes de licencias recibidas:

  Numeric value representing the number of license requests received.

- Solicitudes Negadas:

  Numeric value representing the number of denied license requests.

- Solicitudes Archivadas:

  Numeric value representing the number of archived license requests.

- Solicitudes Modificadas:

  Numeric value representing the number of modified license requests.

- Licencias Otorgadas:

  Numeric value representing the number of licenses granted.

- Licencias expedidas de semillas para siembra:

  Numeric value representing the number of seed cultivation licenses
  issued.

- Licencias expedidas de plantas cannabis psicoactivo:

  Numeric value representing the number of psychoactive cannabis plant
  cultivation licenses issued.

- Licencias expedidas de plantas cannabis no psicoactivo:

  Numeric value representing the number of non-psychoactive cannabis
  plant cultivation licenses issued.

- Año:

  Numeric value representing the year in which the data was recorded.

## Source

Originally taken from Kaggle, url:
https://www.kaggle.com/datasets/josetroyatoscano/licencias-cannabis-colombia-full-dataset-feb-2024

## Details

The dataset name has been kept as Cannabis_Licenses_tbl_df to avoid
confusion with other datasets in the R ecosystem. This naming convention
helps distinguish this dataset as part of the ColombiAPI package and
assists users in identifying its specific characteristics. The suffix
'tbl_df' indicates that the dataset is a tibble. The original content
has not been modified in any way.
