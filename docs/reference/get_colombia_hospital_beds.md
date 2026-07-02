# Get Colombia's Hospital Beds (per 1,000 people) from World Bank

Retrieves Colombia's number of hospital beds per 1,000 people for the
years 2010 to 2022 using the World Bank Open Data API. The indicator
used is `SH.MED.BEDS.ZS`.

## Usage

``` r
get_colombia_hospital_beds()
```

## Source

World Bank Open Data API:
<https://data.worldbank.org/indicator/SH.MED.BEDS.ZS>

## Value

A tibble with the following columns:

- `indicator`: Indicator name (e.g., "Hospital beds (per 1,000 people)")

- `country`: Country name ("Colombia")

- `year`: Year of the data (integer)

- `value`: Number of hospital beds per 1,000 people

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
  get_colombia_hospital_beds()
}
```
