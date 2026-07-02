# Get Colombia's Regions from API Colombia

Retrieves comprehensive information about Colombia's six natural regions
from the API Colombia service. This function fetches data including
region names, descriptions, and identifiers for all Colombian regions:
Caribe, Pacífico, Orinoquía, Amazonía, Andina, and Insular.

## Usage

``` r
get_colombia_regions()
```

## Source

API Colombia: <https://api-colombia.com/api/v1/Region>

## Value

A tibble with the following columns:

- `id`: Region identifier (integer)

- `name`: Region name (character)

- `description`: Detailed description of the region (character)

## Details

This function sends a GET request to the API Colombia service. If the
API request fails or returns an error status code, the function returns
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
  get_colombia_regions()
}
```
