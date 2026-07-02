# Get Colombia's Unemployment Rate (Total) from World Bank

Retrieves Colombia's total unemployment rate, measured as a percentage
of the total labor force, for the years 2010 to 2022 using the World
Bank Open Data API. The indicator used is `SL.UEM.TOTL.ZS`.

## Usage

``` r
get_colombia_unemployment()
```

## Source

World Bank Open Data API:
<https://data.worldbank.org/indicator/SL.UEM.TOTL.ZS>

## Value

A tibble with the following columns:

- `indicator`: Indicator name (e.g., "Unemployment, total (

- `country`: Country name ("Colombia")

- `year`: Year of the data (integer)

- `value`: Unemployment rate as a numeric value (percentage)

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
  get_colombia_unemployment()
}
```
