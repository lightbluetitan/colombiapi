# Colombian Coffee 2016 Export/Import

This dataset, Colombia_coffee_tbl_df, is a tibble containing detailed
information about Colombian coffee exports and imports in 2016. It
includes data on various factors such as trade flow, commodity codes,
trade value, weight in kilograms, and information about the countries
involved in the trade. The dataset is sourced from Kaggle and provides a
comprehensive analysis of the foreign trade of Colombian coffee.

## Usage

``` r
data(Colombia_coffee_tbl_df)
```

## Format

A tibble with 106 observations and 35 variables:

- Classification:

  Character string representing the classification of the coffee
  product.

- Year:

  Numeric value representing the year of the data entry.

- Period:

  Numeric value representing the period of the trade.

- Period Desc.:

  Numeric value representing the period description.

- Aggregate Level:

  Numeric value representing the aggregate level of the trade data.

- Is Leaf Code:

  Numeric value indicating whether the trade involves a leaf product.

- Trade Flow Code:

  Numeric value representing the trade flow code.

- Trade Flow:

  Character string representing the flow of the trade, either export or
  import.

- Reporter Code:

  Numeric value representing the code of the reporting country.

- Reporter:

  Character string representing the reporting country.

- Reporter ISO:

  Character string representing the ISO code of the reporting country.

- Partner Code:

  Numeric value representing the code of the partner country.

- Partner:

  Character string representing the partner country.

- Partner ISO:

  Character string representing the ISO code of the partner country.

- 2nd Partner Code:

  Logical value indicating if there is a second partner country involved
  in the trade.

- 2nd Partner:

  Logical value indicating if there is a second partner country.

- 2nd Partner ISO:

  Logical value indicating if there is a second partner country's ISO
  code.

- Customs Proc. Code:

  Logical value representing the customs procedure code.

- Customs:

  Logical value indicating whether customs procedure information is
  available.

- Mode of Transport Code:

  Logical value representing the mode of transport code.

- Mode of Transport:

  Logical value indicating the mode of transport used in the trade.

- Commodity Code:

  Character string representing the commodity code for coffee.

- Commodity:

  Character string representing the commodity (coffee).

- Qty Unit Code:

  Numeric value representing the quantity unit code.

- Qty Unit:

  Character string representing the unit of quantity for the trade.

- Qty:

  Logical value representing the quantity of coffee in the trade.

- Alt Qty Unit Code:

  Logical value representing an alternative quantity unit code.

- Alt Qty Unit:

  Numeric value representing an alternative quantity unit for the trade.

- Alt Qty:

  Logical value representing an alternative quantity for the trade.

- Netweight (kg):

  Numeric value representing the net weight of the coffee in kilograms.

- Gross weight (kg):

  Logical value indicating the gross weight of the coffee in kilograms.

- Trade Value (US):

  Numeric value representing the trade value in US dollars.

- CIF Trade Value (US):

  Logical value representing the CIF trade value in US dollars.

- FOB Trade Value (US):

  Logical value representing the FOB trade value in US dollars.

- Flag:

  Numeric value representing a flag for the dataset entry.

## Source

Originally taken from Kaggle, url:
https://www.kaggle.com/datasets/carlosbeltranv/colombian-coffee-2016

## Details

The dataset name has been kept as Colombia_coffee_tbl_df to avoid
confusion with other datasets in the R ecosystem. This naming convention
helps distinguish this dataset as part of the ColombiAPI package and
assists users in identifying its specific characteristics. The suffix
'tbl_df' indicates that the dataset is a tibble. The original content
has not been modified in any way.
