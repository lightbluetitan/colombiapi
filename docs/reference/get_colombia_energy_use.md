# Get Colombia's Energy Use (kg of oil equivalent per capita) from World Bank

Retrieves Colombia's energy use per capita, measured in kilograms of oil
equivalent, for the years 2010 to 2022 using the World Bank Open Data
API. The indicator used is `EG.USE.PCAP.KG.OE`.

## Usage

``` r
get_colombia_energy_use()
```

## Source

World Bank Open Data API:
<https://data.worldbank.org/indicator/EG.USE.PCAP.KG.OE>

## Value

A tibble with the following columns:

- `indicator`: Indicator name (e.g., "Energy use (kg of oil equivalent
  per capita)")

- `country`: Country name ("Colombia")

- `year`: Year of the data (integer)

- `value`: Energy use in kilograms of oil equivalent per capita

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
  get_colombia_energy_use()
}
```
