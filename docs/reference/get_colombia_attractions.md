# Get All Touristic Attractions of Colombia

Retrieves selected information about touristic attractions in Colombia
from the API Colombia. This function fetches the attraction ID, name,
description, latitude, longitude, and city ID.

## Usage

``` r
get_colombia_attractions()
```

## Source

API Colombia: <https://api-colombia.com/api/v1/TouristicAttraction>

## Value

A tibble with the following columns:

- `id`: Attraction identifier (integer)

- `name`: Attraction name (character)

- `description`: Attraction description (character)

- `latitude`: Latitude coordinates (numeric)

- `longitude`: Longitude coordinates (numeric)

- `cityId`: City identifier (integer)

Returns `NULL` if the API request fails.

## Details

This function sends a GET request to the API Colombia service. If the
API request fails or returns an error status code, the function returns
`NULL` with an informative message.

## Note

Requires internet connection.

## See also

[`GET`](https://httr.r-lib.org/reference/GET.html),
[`fromJSON`](https://jeroen.r-universe.dev/jsonlite/reference/fromJSON.html),
[`tibble`](https://tibble.tidyverse.org/reference/tibble.html)

## Examples

``` r
if (interactive()) {
  get_colombia_attractions()
}
```
