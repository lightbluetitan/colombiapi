# Get Colombia's GDP (current US\$) from World Bank

Retrieves Colombia's Gross Domestic Product (GDP) in current US dollars
for the years 2010 to 2022 using the World Bank Open Data API. The
indicator used is `NY.GDP.MKTP.CD`.

## Usage

``` r
get_colombia_gdp()
```

## Source

World Bank Open Data API:
<https://data.worldbank.org/indicator/NY.GDP.MKTP.CD>

## Value

A tibble with the following columns:

- `indicator`: Indicator name (e.g., "GDP (current US\$)")

- `country`: Country name ("Colombia")

- `year`: Year of the data (integer)

- `value`: GDP in current US dollars

- `value_label`: Formatted GDP with commas (e.g., "1,800,000,000,000")

## Details

This function sends a GET request to the World Bank API. If the API
request fails or returns an error status code, the function returns
`NULL` with an informative message.

## Note

Requires internet connection.

## See also

[`GET`](https://httr.r-lib.org/reference/GET.html),
[`fromJSON`](https://jeroen.r-universe.dev/jsonlite/reference/fromJSON.html),
[`as_tibble`](https://tibble.tidyverse.org/reference/as_tibble.html),
[`comma`](https://scales.r-lib.org/reference/comma.html)

## Examples

``` r
if (interactive()) {
  get_colombia_gdp()
}
```
