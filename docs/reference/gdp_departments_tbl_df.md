# Departmental GDP Projection (Spanish speaking)

This dataset, gdp_departments_tbl_df, is a tibble containing the
projected Gross Domestic Product (GDP) at constant prices for the
departments of Colombia, expressed in 2015 prices. It includes data such
as year, economic activity, sector, price type, DIVIPOLA department
code, department name, and GDP value in thousands of millions of pesos.
The dataset was obtained from GOV.CO Datos Abiertos, last update on
November 1, 2024.

## Usage

``` r
data(gdp_departments_tbl_df)
```

## Format

A tibble with 16,302 observations and 7 variables:

- Año:

  Year of the record (numeric)

- Actividad:

  Economic activity (character)

- Sector:

  Sector of the economy (character)

- Tipo de precios:

  Price type (character)

- Código Departamento (DIVIPOLA):

  DIVIPOLA code of the department (numeric)

- Departamento:

  Name of the department (character)

- Valor (miles de millones de pesos):

  GDP value in thousands of millions of pesos (numeric)

## Source

Data obtained from GOV.CO Datos Abiertos:
<https://www.datos.gov.co/Econom-a-y-Finanzas/PIB-Departamental-con-proyecci-n/kgyi-qc7j/about_data>

## Details

The dataset name has been kept as 'gdp_departments_tbl_df' to avoid
confusion with other datasets in the R ecosystem. This naming convention
helps distinguish this dataset as part of the ColombiAPI package and
assists users in identifying its specific characteristics. The suffix
'tbl_df' indicates that the dataset is a tibble object. The original
content has not been modified in any way.
