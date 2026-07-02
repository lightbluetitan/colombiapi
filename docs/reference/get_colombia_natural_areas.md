# Get Natural Areas of Colombia

Retrieves information about natural areas in Colombia from the API
Colombia. This function fetches only selected fields: id, areaGroupId,
categoryNaturalAreaId, name, departmentId, daneCode, and landArea.

## Usage

``` r
get_colombia_natural_areas()
```

## Source

API Colombia: <https://api-colombia.com/api/v1/NaturalArea>

## Value

A tibble with the following columns:

- `id`: Natural area identifier (integer)

- `areaGroupId`: Area group identifier (integer)

- `categoryNaturalAreaId`: Category identifier for the natural area
  (integer)

- `name`: Natural area name (character)

- `departmentId`: Department identifier (integer)

- `daneCode`: DANE statistical code (character)

- `landArea`: Land area in hectares (numeric)

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
  get_colombia_natural_areas()
}
```
