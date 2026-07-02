# Get Invasive Species of Colombia

Retrieves information about invasive species in Colombia from the API
Colombia. This function fetches only selected fields: id, name,
scientificName, commonNames, impact, manage, and riskLevel.

## Usage

``` r
get_colombia_invasive_species()
```

## Source

API Colombia: <https://api-colombia.com/api/v1/InvasiveSpecie>

## Value

A tibble with the following columns:

- `id`: Species identifier (integer)

- `name`: Species common name (character)

- `scientificName`: Scientific name of the species (character)

- `commonNames`: List of common names (list)

- `impact`: Description of ecological impact (character)

- `manage`: Management recommendations (character)

- `riskLevel`: Risk level classification (character)

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
  get_colombia_invasive_species()
}
```
