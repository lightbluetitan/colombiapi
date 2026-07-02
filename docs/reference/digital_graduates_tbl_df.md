# "Advancing in Digital" Program Graduates (Spanish speaking)

This dataset, digital_graduates_tbl_df, is a tibble containing
information about graduates of the first cohort in the various courses
of the "Avanzando en lo Digital" program, an initiative aimed at
developing digital skills. It includes data such as year, age, gender,
courses enrolled, zone, ethnicity, and socioeconomic stratum. The
dataset was obtained from GOV.CO Datos Abiertos, last update on October
3, 2024.

## Usage

``` r
data(digital_graduates_tbl_df)
```

## Format

A tibble with 230 observations and 7 variables:

- AÑO:

  Year of graduation (numeric)

- EDAD:

  Age of the graduate (numeric)

- GENERO:

  Gender of the graduate (character)

- CURSOS INSCRITOS:

  Courses in which the graduate was enrolled (character)

- ZONA:

  Geographical zone of the graduate (character)

- ETNIA:

  Ethnicity of the graduate (character)

- ESTRATO:

  Socioeconomic stratum of the graduate (numeric)

## Source

Data obtained from GOV.CO Datos Abiertos:
<https://www.datos.gov.co/Ciencia-Tecnolog-a-e-Innovaci-n/GRADUADOS-AVANZANDO-EN-LO-DIGITAL-PRIMERA-PROMOCIO/yfz9-fwqr/about_data>

## Details

The dataset name has been kept as 'digital_graduates_tbl_df' to avoid
confusion with other datasets in the R ecosystem. This naming convention
helps distinguish this dataset as part of the ColombiAPI package and
assists users in identifying its specific characteristics. The suffix
'tbl_df' indicates that the dataset is a tibble object. The original
content has not been modified in any way.
