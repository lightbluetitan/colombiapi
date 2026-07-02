# Mortality of lianas (vines) in tropical forests

This dataset, 'dead_lianas_df', is a data frame containing information
on the mortality of vascular epiphytes (lianas) in tropical forests of
the Colombian Andes. The study is part of the project "Diversity and
dynamics of vascular epiphytes in Colombian Andes" supported by
COLCIENCIAS (contract 2115-2013). The data corresponds to the first
large-scale assessment of vascular epiphyte mortality in the neotropics.

## Usage

``` r
data(dead_lianas_df)
```

## Format

A data frame with 4,247 observations and 52 variables:

- PlotSite:

  Plot site identifier (character)

- Y.Plot:

  Y coordinate of the plot (numeric)

- X.Plot:

  X coordinate of the plot (numeric)

- PhoroNo:

  Phorophyte number (integer)

- EpiFam:

  Epiphyte family (character)

- EpiGen:

  Epiphyte genus (character)

- cf.aff:

  Taxonomic uncertainty or affiliation (character)

- Species:

  Epiphyte species name (character)

- Author:

  Species author (character)

- EpiAzi:

  Epiphyte azimuth (character)

- BraAzi:

  Branch azimuth (integer)

- EpiDisTru:

  Epiphyte distance from trunk (numeric)

- EpiSize:

  Epiphyte size (numeric)

- EpiAttHei:

  Epiphyte attachment height (numeric)

- Date0:

  Initial survey date (Date)

- Date1:

  Follow-up survey date (Date)

- Location:

  Location name (character)

- Mortality:

  Mortality status (factor with 2 levels)

- MorCat:

  Mortality category (character)

- Elevation:

  Elevation in meters (integer)

- AP_bio12:

  Annual precipitation (integer)

- PDM_bio14:

  Precipitation of driest month (integer)

- PS_bio15:

  Precipitation seasonality (integer)

- MDT_bio2:

  Mean diurnal temperature range (integer)

- TS_bio4:

  Temperature seasonality (integer)

- ATR_bio7:

  Annual temperature range (integer)

- AET:

  Actual evapotranspiration (integer)

- BasAre:

  Basal area (numeric)

- BasAre5_10:

  Basal area of trees 5–10 cm DBH (numeric)

- BasAre10:

  Basal area of trees \\\ge\\ 10 cm DBH (numeric)

- Ind10:

  Number of individuals \\\ge\\ 10 cm DBH (integer)

- Ind5:

  Number of individuals \\\ge\\ 5 cm DBH (numeric)

- Ind5_10:

  Number of individuals 5–10 cm DBH (numeric)

- Ind10_15:

  Number of individuals 10–15 cm DBH (integer)

- Ind15_20:

  Number of individuals 15–20 cm DBH (integer)

- Ind20_25:

  Number of individuals 20–25 cm DBH (integer)

- Ind25_30:

  Number of individuals 25–30 cm DBH (integer)

- Ind30:

  Number of individuals \\\ge\\ 30 cm DBH (integer)

- TreeHei:

  Tree height (numeric)

- MedHei:

  Median tree height (numeric)

- MaxHei:

  Maximum tree height (numeric)

- BranchNumb:

  Number of branches (integer)

- MEAH:

  Mean epiphyte attachment height (numeric)

- MEAH_sd:

  Standard deviation of mean epiphyte attachment height (numeric)

- MSP:

  Mean species per phorophyte (integer)

- MSP_sd:

  Standard deviation of mean species per phorophyte (integer)

- Htree:

  Mean tree height (numeric)

- Htree_sd:

  Standard deviation of mean tree height (numeric)

- BranNum:

  Mean branch number (numeric)

- BranNUm_sd:

  Standard deviation of branch number (numeric)

- tree.id:

  Tree identifier (character)

- dead:

  Tree mortality status (factor with 2 levels)

## Source

Data taken from the biometrics package version 1.0.2

## Details

The dataset name has been kept as 'dead_lianas_df' to avoid confusion
with other datasets in the R ecosystem. This naming convention helps
distinguish this dataset as part of the ColombiAPI package and assists
users in identifying its specific characteristics. The suffix 'df'
indicates that the dataset is a data frame object. The original content
has not been modified in any way.
