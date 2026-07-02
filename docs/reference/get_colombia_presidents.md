# Get Colombia's Presidents from API Colombia

Retrieves comprehensive information about all Colombian presidents from
1886 to present from the API Colombia service. This function fetches
data including names, political parties, government periods,
descriptions, and biographical information for each president.

## Usage

``` r
get_colombia_presidents()
```

## Source

API Colombia: <https://api-colombia.com/api/v1/President>

## Value

A tibble with the following columns:

- `id`: President identifier (integer)

- `name`: President's first name(s) (character)

- `last_name`: President's last name(s) (character)

- `political_party`: Political party affiliation (character)

- `start_period_date`: Start date of presidency (character, YYYY-MM-DD
  format)

- `end_period_date`: End date of presidency (character, YYYY-MM-DD
  format or NULL for current)

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
  get_colombia_presidents()
}
```
