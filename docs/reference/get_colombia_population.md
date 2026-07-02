# Get Colombia's Total Population from World Bank

Retrieves Colombia's total population for the years 2010 to 2022 using
the World Bank Open Data API. The indicator used is `SP.POP.TOTL`.

## Usage

``` r
get_colombia_population()
```

## Source

World Bank Open Data API:
<https://data.worldbank.org/indicator/SP.POP.TOTL>

## Value

A tibble with the following columns:

- `indicator`: Indicator name (e.g., "Population, total")

- `country`: Country name ("Colombia")

- `year`: Year of the data (integer)

- `value`: Population as a numeric value

- `value_label`: Formatted population with commas (e.g., "51,000,000")

## Details

The function sends a GET request to the World Bank API. If the API
request fails or returns an error status code, the function returns
`NULL` with an informative message.

## Note

Requires internet connection. The data is retrieved in real time from
the World Bank API.

## See also

[`GET`](https://httr.r-lib.org/reference/GET.html),
[`fromJSON`](https://jeroen.r-universe.dev/jsonlite/reference/fromJSON.html),
[`as_tibble`](https://tibble.tidyverse.org/reference/as_tibble.html),
[`comma`](https://scales.r-lib.org/reference/comma.html)

## Examples

``` r
if (interactive()) {
  get_colombia_population()
}
```
