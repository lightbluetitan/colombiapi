# Get Official Public Holidays in Colombia for a Given Year

Retrieves the list of official public holidays in Colombia for a
specific year using the Nager.Date public holidays API. This function
returns a tibble containing the date of the holiday, the name in the
local language (Spanish), and the English name. It is useful for
academic, planning, and data analysis purposes. The information is
retrieved directly from the Nager.Date API and reflects the current
status of holidays for the requested year. The field names returned are
consistent with the API structure.

## Usage

``` r
get_colombia_holidays(year)
```

## Source

Data obtained from the Nager.Date API: <https://date.nager.at/>

## Arguments

- year:

  An integer indicating the year (e.g., 2024 or 2025).

## Value

A tibble with the following columns:

- `date`: Date of the holiday (class `Date`)

- `local_name`: Holiday name in the local language (Spanish)

- `name`: Holiday name in English

## Details

This function sends a GET request to the Nager.Date API. If the API
request fails or returns an error status code, the function returns
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
  get_colombia_holidays(2024)
}
```
