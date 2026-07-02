# Get Colombia's Airports from API Colombia

Retrieves comprehensive information about all Colombian airports from
the API Colombia service. This function fetches data including airport
names, codes, types, locations, and geographical coordinates for all
airports across Colombia's departments.

## Usage

``` r
get_colombia_airports()
```

## Source

API Colombia: <https://api-colombia.com/api/v1/Airport>

## Value

A tibble with the following columns:

- `id`: Airport identifier (integer)

- `name`: Airport name (character)

- `iata_code`: IATA airport code (character)

- `oaci_code`: ICAO airport code (character)

- `type`: Airport type (character)

- `city`: City where airport is located (character)

- `department`: Department where airport is located (character)

- `latitude`: Latitude coordinates (numeric)

- `longitude`: Longitude coordinates (numeric)

## Details

This function sends a GET request to the API Colombia service. If the
API request fails or returns an error status code, the function returns
`NULL` with an informative message. Note: The API returns latitude and
longitude values swapped, so this function corrects the coordinates by
swapping them back to their correct positions.

## Note

Requires internet connection.

## See also

[`GET`](https://httr.r-lib.org/reference/GET.html),
[`fromJSON`](https://jeroen.r-universe.dev/jsonlite/reference/fromJSON.html),
[`as_tibble`](https://tibble.tidyverse.org/reference/as_tibble.html)

## Examples

``` r
if (interactive()) {
  get_colombia_airports()
}
```
