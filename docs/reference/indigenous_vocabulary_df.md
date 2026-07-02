# Comparative Vocabulary for Colombia's Indigenous Languages

This dataset, indigenous_vocabulary_df, is a data frame containing a
comparative vocabulary (a "wordlist") for 69 indigenous languages of
Colombia, originally compiled by Huber & Reed (1992). The dataset
provides lexical correspondences across multiple languages, supporting
linguistic, anthropological, and historical research.

## Usage

``` r
data(indigenous_vocabulary_df)
```

## Format

A data frame with 27,521 observations and 4 variables:

- CONCEPT:

  Gloss or concept represented in the wordlist (factor with 366 levels)

- COUNTERPART:

  Word corresponding to the concept in the given language (character)

- DOCULECT:

  Name of the language or variety (factor with 71 levels)

- TOKENS:

  Tokenized form of the counterpart (character)

## Source

Data taken from the qlcMatrix package version 0.9.9

## Details

The dataset name has been kept as 'indigenous_vocabulary_df' to avoid
confusion with other datasets in the R ecosystem. This naming convention
helps distinguish this dataset as part of the ColombiAPI package and
assists users in identifying its specific characteristics. The suffix
'df' indicates that the dataset is a data frame object. The original
content has not been modified in any way.
