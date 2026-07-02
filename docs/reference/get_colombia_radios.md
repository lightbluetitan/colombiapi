# Get Radios of Colombia from API Colombia

Retrieves information about radio stations in Colombia from the API
Colombia. This function fetches only the following fields: id, name,
frequency, and band.

## Usage

``` r
get_colombia_radios()
```

## Source

API Colombia: <https://api-colombia.com/api/v1/Radio>

## Value

A tibble with the following columns:

- `id`: Radio station identifier (integer)

- `name`: Radio station name (character)

- `frequency`: Broadcast frequency (numeric)

- `band`: Frequency band (e.g., AM, FM) (character)

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
  get_colombia_radios()
}
```
