# Tulua Public Schools Information

This dataset, Tulua_Public_Schools_tbl_df, is a tibble containing
detailed information about public schools located in the municipality of
Tulua, Valle del Cauca, Colombia. It includes the name, location,
contact information, and the geographical coordinates of each
institution, as well as specific details about each school and its
facilities.

## Usage

``` r
data(Tulua_Public_Schools_tbl_df)
```

## Format

A tibble with 105 observations and 8 variables:

- COD_DANE_INS:

  Numeric code representing the educational institution's DANE code.

- INSTITUCION:

  Character string representing the name of the public school.

- SEDE:

  Character string representing the name of the specific school location
  or branch.

- COD_DANE_SEDE:

  Numeric code representing the DANE code of the specific school branch.

- TELEFONO:

  Character string representing the phone number of the school.

- CORREOS:

  Character string representing the email addresses of the school.

- DIRECCIÓN:

  Character string representing the physical address of the school.

- CORDE_GEO:

  Character string representing the geographical coordinates of the
  school.

## Source

Originally taken from GOV.CO, url:
https://www.datos.gov.co/Educaci-n/Listado-de-colegios-p-blicos-del-municipio-de-Tulu/scz9-f8ud/about_data

## Details

The dataset name has been kept as Tulua_Public_Schools_tbl_df to avoid
confusion with other datasets in the R ecosystem. This naming convention
helps distinguish this dataset as part of the ColombiAPI package and
assists users in identifying its specific characteristics. The suffix
'tbl_df' indicates that the dataset is a tibble. The original content
has not been modified in any way.
