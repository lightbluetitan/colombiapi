# Bogota Malls Information

This dataset, Bogota_malls_tbl_df, is a tibble containing detailed
information about shopping malls located in Bogota, Colombia. It
includes the mall names, physical addresses, web URLs, geographical
coordinates, and the locality to which each mall belongs.

## Usage

``` r
data(Bogota_malls_tbl_df)
```

## Format

A tibble with 42 observations and 6 variables:

- NAME:

  Character string representing the name of the shopping mall.

- ADDRESS:

  Character string representing the physical address of the mall.

- URL:

  Character string representing the web URL of the mall.

- LATITUD:

  Numeric value representing the latitude of the mall.

- LONGITUD:

  Numeric value representing the longitude of the mall.

- LOCALIDAD:

  Character string representing the locality the mall belongs to.

## Source

Originally taken from Kaggle, url:
https://www.kaggle.com/datasets/erik172/bogota-shopping-malls.

## Details

The dataset name has been kept as Bogota_malls_tbl_df to avoid confusion
with other datasets in the R ecosystem. This naming convention helps
distinguish this dataset as part of the ColombiAPI package and assists
users in identifying its specific characteristics. The suffix 'tbl_df'
indicates that the dataset is a tibble. The original content has not
been modified in any way.
