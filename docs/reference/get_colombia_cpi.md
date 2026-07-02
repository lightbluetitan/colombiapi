# Get Colombia's Consumer Price Index (2010 = 100) from World Bank

Retrieves Colombia's Consumer Price Index (CPI), with 2010 as the base
year (index = 100), for the years 2010 to 2022 using the World Bank Open
Data API. The indicator used is `FP.CPI.TOTL`.

## Usage

``` r
get_colombia_cpi()
```

## Source

World Bank Open Data API:
<https://data.worldbank.org/indicator/FP.CPI.TOTL>

## Value

A tibble with the following columns:

- `indicator`: Indicator name (e.g., "Consumer price index (2010 =
  100)")

- `country`: Country name ("Colombia")

- `year`: Year of the data (integer)

- `value`: Consumer Price Index (numeric, base year 2010 = 100)

## Details

This function sends a GET request to the World Bank API. If the API
request fails or returns an error status code, the function returns
`NULL` with an informative message.

## Note

Requires internet connection.

## See also

[`GET`](https://httr.r-lib.org/reference/GET.html),
[`fromJSON`](https://jeroen.r-universe.dev/jsonlite/reference/fromJSON.html),
[`as_tibble`](https://tibble.tidyverse.org/reference/as_tibble.html)

## Examples

``` r
if (interactive()) {
  get_colombia_cpi()
}
```
