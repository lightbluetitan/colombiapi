# Get Typical Dishes of Colombia from API Colombia

Retrieves information about Colombia's typical dishes from the API
Colombia. This function fetches only selected fields: id, name, and
description.

## Usage

``` r
get_colombia_typical_dishes()
```

## Source

API Colombia: <https://api-colombia.com/api/v1/TypicalDish>

## Value

A tibble with the following columns:

- `id`: Dish identifier (integer)

- `name`: Dish name (character)

- `description`: Dish description (character)

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
  get_colombia_typical_dishes()
}
```
