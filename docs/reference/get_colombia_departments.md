# Get Colombia's Departments from API Colombia

Retrieves comprehensive information about all Colombian departments from
the API Colombia service. This function fetches data including
department names, capitals, geographical information, area, population,
and administrative details for all 32 departments plus Bogotá D.C.

## Usage

``` r
get_colombia_departments()
```

## Source

API Colombia: <https://api-colombia.com/api/v1/Department>

## Value

A tibble with the following columns:

- `id`: Department identifier (integer)

- `name`: Department name (character)

- `capital`: Capital city name (character)

- `surface`: Department area in km² (integer)

- `population`: Department population (integer)

- `municipalities`: Number of municipalities (integer)

- `phone_prefix`: Phone area code (character)

- `region_id`: Geographic region identifier (integer)

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
  get_colombia_departments()
}
```
