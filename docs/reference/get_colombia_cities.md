# Get All Cities of Colombia

Retrieves basic information about all cities in Colombia from the API
Colombia. This function fetches only the city ID and name to provide a
clean and concise dataset.

## Usage

``` r
get_colombia_cities()
```

## Source

API Colombia: <https://api-colombia.com/api/v1/City>

## Value

A tibble with the following columns:

- `id`: City identifier (integer)

- `name`: City name (character)

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
  get_colombia_cities()
}
```
