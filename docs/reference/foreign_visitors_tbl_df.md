# Non-Resident Foreign Visitors to Colombia (Spanish speaking)

This dataset, foreign_visitors_tbl_df, is a tibble containing
information about non-resident foreigners entering Colombia through
various migration points. It includes data on the year, month,
destination department, destination city, country of residence of the
foreign visitor, and the number of non-resident foreigners. The dataset
was obtained from GOV.CO Datos Abiertos, last update on September 25,
2025.

## Usage

``` r
data(foreign_visitors_tbl_df)
```

## Format

A tibble with 466,915 observations and 6 variables:

- Año:

  Year of the record (numeric)

- Mes:

  Month of the record (character)

- Departamento:

  Destination department in Colombia (character)

- Ciudad:

  Destination city in Colombia (character)

- PaisOEEResidencia:

  Country of residence of the foreign visitor (character)

- Cant Extranjeros no Residentes:

  Number of non-resident foreign visitors (numeric)

## Source

Data obtained from GOV.CO Datos Abiertos:
<https://www.datos.gov.co/Comercio-Industria-y-Turismo/Extranjeros-No-Residentes/7wm8-w5ad/about_data>

## Details

The dataset name has been kept as 'foreign_visitors_tbl_df' to avoid
confusion with other datasets in the R ecosystem. This naming convention
helps distinguish this dataset as part of the ColombiAPI package and
assists users in identifying its specific characteristics. The suffix
'tbl_df' indicates that the dataset is a tibble object. The original
content has not been modified in any way.
