# Admitted Students to the Science Faculty, UNAL (2013-I)

This dataset, admitted_students_df, is a data frame containing the
admission scores and socio-demographic information of 445 students
admitted to the seven careers of the Facultad de Ciencias at the
Universidad Nacional de Colombia, Bogotá, for the first semester of
2013. It includes exam component scores, gender, socio-economic
background, and other demographic attributes.

## Usage

``` r
data(admitted_students_df)
```

## Format

A data frame with 445 observations and 15 variables:

- carr:

  Career or program admitted to (factor with 7 levels)

- mate:

  Mathematics exam score (numeric)

- cien:

  Science exam score (numeric)

- soci:

  Social sciences exam score (numeric)

- text:

  Textual reasoning exam score (numeric)

- imag:

  Abstract/imagery reasoning exam score (numeric)

- exam:

  Total exam score (numeric)

- gene:

  Gender of the student (factor with 2 levels)

- estr:

  Socio-economic stratum (factor with 3 levels)

- orig:

  Origin or background classification (factor with 3 levels)

- edad:

  Age group (factor with 4 levels)

- niLE:

  Mother tongue indicator (factor with 2 levels)

- niMa:

  Maternal education indicator (factor with 2 levels)

- stra:

  Admission stratum or classification (factor with 7 levels)

- age:

  Age of the student in years (numeric)

## Source

Data taken from the FactoClass package version 1.2.9

## Details

The dataset name has been kept as 'admitted_students_df' to avoid
confusion with other datasets in the R ecosystem. This naming convention
helps distinguish this dataset as part of the ColombiAPI package and
assists users in identifying its specific characteristics. The suffix
'df' indicates that the dataset is a data frame object. The original
content has not been modified in any way.
