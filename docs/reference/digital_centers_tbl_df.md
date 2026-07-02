# Digital Centers in Sucre (Spanish speaking)

This dataset, digital_centers_tbl_df, is a tibble containing information
about Digital Centers located in the department of Sucre. It includes
details such as department name, municipality name, PDET status, name of
the populated center, educational center name, start date of operation,
end date of initial operation, and current status. The dataset was
obtained from GOV.CO Datos Abiertos, last update on April 20, 2024.

## Usage

``` r
data(digital_centers_tbl_df)
```

## Format

A tibble with 475 observations and 8 variables:

- NOMBRE DEPARTAMENTO:

  Name of the department (character)

- NOMBRE MUNICIPIO:

  Name of the municipality (character)

- PDET:

  PDET status (character)

- NOMBRE CENTRO POBLADO:

  Name of the populated center (character)

- NOMBRE SEDE EDUCATIVA:

  Name of the educational center (character)

- FECHA INICIO DE OPERACIÓN:

  Start date of operation (character)

- FIN DE OPERACIÓN INICIAL:

  End date of initial operation (character)

- ESTADO:

  Current status of the center (character)

## Source

Data obtained from GOV.CO Datos Abiertos:
<https://www.datos.gov.co/Ciencia-Tecnolog-a-e-Innovaci-n/Centros-Digitales-Sucre-/pwyn-md8n/about_data>

## Details

The dataset name has been kept as 'digital_centers_tbl_df' to avoid
confusion with other datasets in the R ecosystem. This naming convention
helps distinguish this dataset as part of the ColombiAPI package and
assists users in identifying its specific characteristics. The suffix
'tbl_df' indicates that the dataset is a tibble object. The original
content has not been modified in any way.
